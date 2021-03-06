#!/usr/bin/env bash

ROS=false
SHELL=false
WHICH_SHELL="bash"
TMUX=false
VIM=false
DOTFILE_DIR=$HOME/.dotfiles

OS_STR=""
case $OSTYPE in
    darwin*) 
        echo "I am using mac"
	OS_STR="osx"
        ;;
    linux*)
        echo "I am using linux"
	OS_STR="linux"
        ;;
    freebsd*)
        echo "I am using freebsd"
	OS_STR="freebsd"
        ;;
esac    

# A usefule one-liner which will give the full directory name where the script is stored in no matter where it is being called from
#SETUP_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
SETUP_SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

function help {
    echo "HELP"
}

function setup_dir {
    mkdir $DOTFILE_DIR
}

function setup_shell {
    echo "%%% $1 $2 $3 $4"

    os_str=$1
    do_change=$2
    which_shell=$3
    want_ros=$4

    if [[ $do_change = false ]]; then
        return 0
    fi

    echo "=== $which_shell ==="
 
    shrc_ln_src=""
    shrc_ln_tgt="$HOME/.bashrc"
    shrc_ln_tgt_bak="$HOME/.bashrc.bak"
    sh_profile_ln_src_path=""
    sh_profile_ln_tgt="$HOME/.bash_profile"
    sh_profile_ln_tgt_bak="$HOME/.bashrc.bak"

    $SETUP_SCRIPT_DIR/powerline/setup.sh

    if [ $which_shell = "bash" ]; then
        shell="bash"
        echo "Setting up for $shell"
        if [[ $want_ros = true ]]; then
            shrc_ln_src="$SETUP_SCRIPT_DIR/${shell}/${shell}rc.${os_str}+ros"
    	else
            shrc_ln_src="$SETUP_SCRIPT_DIR/${shell}/${shell}rc.${os_str}"
        fi        

    elif [ $which_shell = "zsh" ]; then
        shell="zsh"
        echo "Setting up for ${shell}"
        if [[ $want_ros = true ]]; then
            shrc_ln_src="$SETUP_SCRIPT_DIR/${shell}/${shell}rc.${os_str}+ros"
    	else
            shrc_ln_src="$SETUP_SCRIPT_DIR/${shell}/${shell}rc.${os_str}"
        fi
    fi

    sh_profile_ln_src="$SETUP_SCRIPT_DIR/${shell}/${shell}_profile.${os_str}"
    shrc_ln_tgt="$HOME/.${shell}rc"
    shrc_ln_tgt_bak="$HOME/.${shell}rc.bak"
    sh_profile_ln_tgt="$HOME/.${shell}_profile"
    sh_profile_ln_tgt_bak="$HOME/.${shell}_profile.bak"

    if ! [[ -L "$sh_ln_tgt" ]]; then
        echo "backing up $shrc_ln_tgt to $shrc_ln_tgt_bak"
        mv $shrc_ln_tgt $shrc_ln_tgt_bak
    fi
    if ! [[ -L "$sh_profile_ln_tgt" ]]; then
        echo "backing up $sh_profile_ln_tgt to $sh_profile_ln_tgt_bak"
        mv $sh_profile_ln_tgt $sh_profile_ln_tgt_bak
    fi

    cp $shrc_ln_src $DOTFILE_DIR/
    cp $sh_profile_ln_src $DOTFILE_DIR/

    shrc_ln_src_basename=${shrc_ln_src##*/}
    sh_profile_ln_src_basename=${sh_profile_ln_src##*/}

    shrc_new_ln_src=$DOTFILE_DIR/$shrc_ln_src_basename
    sh_profile_new_ln_src=$DOTFILE_DIR/$sh_profile_ln_src_basename

    echo $shrc_new_ln_src
    echo $sh_profile_new_ln_src


    echo "linking $shrc_new_ln_src to $shrc_ln_tgt"
    ln -fs $shrc_new_ln_src $shrc_ln_tgt

    echo "linking $sh_profile_new_ln_src to $sh_profile_ln_tgt"
    ln -fs $sh_profile_new_ln_src $sh_profile_ln_tgt

}

function setup_tmux {
    do_change=$1
    if [[ $do_change = false ]]; then
        return 0
    fi
    
    echo "=== tmux ===" 
    tmux_ln_src="$SETUP_SCRIPT_DIR/tmux/tmux.conf.${os_str}"
    tmux_ln_tgt="$HOME/.tmux.conf"
    tmux_ln_tgt_bak="$HOME/.tmux.conf.bak"

    if ! [[ -L "$tmux_ln_tgt" ]]; then
        echo "backing up $tmux_ln_tgt to $tmux_ln_tgt_bak"
        mv $tmux_ln_tgt $tmux_ln_tgt_bak
    fi

    mkdir -pv $DOTFILE_DIR
    cp $tmux_ln_src $DOTFILE_DIR/

    tmux_ln_src_basename=${tmux_ln_src##*/}

    tmux_ln_new_src=$DOTFILE_DIR/$tmux_ln_src_basename

  

    echo "linking $tmux_ln_new_src to $tmux_ln_tgt"
    ln -fs $tmux_ln_new_src $tmux_ln_tgt
    
    sleep 15
}

function setup_vim {
    do_change=$1
    if [[ $do_change = false ]]; then
        return 0
    fi
    echo "=== vim ==="
    cd vim && ./dein.vim.setup.sh && cd ..
 
    vim_ln_src="$SETUP_SCRIPT_DIR/vim/vimrc.${OS_STR}"
    vim_ln_tgt="$HOME/.vimrc"
    vim_ln_tgt_bak="$HOME/.vimrc.bak"

    if ! [[ -L "$vim_ln_tgt" ]]; then
        echo "backing up $vim_ln_tgt to $vim_ln_tgt_bak"
        mv $vim_ln_tgt $vim_ln_tgt_bak
    fi

    mkdir -pv $DOTFILE_DIR
    cp $vim_ln_src $DOTFILE_DIR/

    vim_ln_src_basename=${vim_ln_src##*/}

    vim_ln_new_src=$DOTFILE_DIR/$vim_ln_src_basename
    echo "linking $vim_ln_new_src to $vim_ln_tgt"
    ln -fs $vim_ln_new_src $vim_ln_tgt
    
}

if [[ "$#" -eq 0 ]]; then
    help
    exit
fi


while [[ $# -ge 1 ]]
do
    key="$1"
    case $key in
        --bash)
            SHELL=true
            WHICH_SHELL="bash"
            ;;
        --zsh)
            SHELL=true
            WHICH_SHELL="zsh"
            ;;
        --vim)
            VIM=true
            ;;
        --tmux)
            TMUX=true
            ;;
        --ros)
            ROS=true
        ;;
        *)
            help
        ;;
    esac
    shift
done


echo "ROS=$ROS"
echo "SHELL=$SHELL"
echo "WHICH_SHELL=$WHICH_SHELL"
echo "VIM=$VIM"
echo "TMUX=$TMUX"

setup_dir
setup_shell $OS_STR $SHELL $WHICH_SHELL $ROS 
setup_tmux $TMUX
setup_vim $VIM


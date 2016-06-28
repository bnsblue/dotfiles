export LC_ALL=en_US.UTF-8 
export LANG=en_US.UTF-8

# MacPorts Installer addition on 2016-06-11_at_20:52:02: adding an appropriate PATH variable for use with MacPorts.
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/usr/local/bin:/usr/local/share/python:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

alias ls='ls -Gp'

export PATH="$PATH:$HOME/Library/Python/2.7/bin"

# POWERLINE_CONFIG_COMMAND variable should point to the location of the script `powerline-config`
export POWERLINE_CONFIG_COMMAND="/Users/changhong/Library/Python/2.7/bin/powerline-config"

# Enabling powerline for bash prompt
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1

. /Users/changhong/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh


alias fpwsm='python $HOME/workspace/clarity-box/clarity-coding/fpwsm/fpwsm.py'



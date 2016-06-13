
# Alternative installation of fpwsm
# ========

# Install tex, gnuplot, 
brew cask install mactex
brew install gnuplot wget pyqt homebrew/science/R

# Install pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

# Using pip to install libraries
pip install pyenchant
pip install scipy
pip install pandas
pip install matplotlib
pip install numpy

# Installing poppler and python-poppler-qt4
brew install poppler --with-qt4 --with-quartz
git clone https://github.com/wbsoft/python-poppler-qt4.git
cd python-poppler-qt4
python setup.py build
python setup.py install

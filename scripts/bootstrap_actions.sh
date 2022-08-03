#!/usr/bin/env bash

# install conda
wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
    && /bin/bash ~/miniconda.sh -b -p $HOME/conda

echo -e '\nexport PATH=$HOME/conda/bin:$PATH' >> $HOME/.bashrc && source $HOME/.bashrc

conda config --set always_yes yes --set changeps1 no
conda config -f --add channels conda-forge
conda config -f --add channels defaults

# install packages
conda install -y pandas seaborn git

#install findspark
pip install --upgrade pip
pip install findspark
pip install sklearn



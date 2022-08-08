#!/usr/bin/env bash

# install conda
# wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
#    && /bin/bash ~/miniconda.sh -b -p $HOME/conda

# echo -e '\nexport PATH=$HOME/conda/bin:$PATH' >> $HOME/.bashrc && source $HOME/.bashrc

# install packages
# conda install -y pandas seaborn git

sudo yum update -y
sudo yum install -y jq git pigz
sudo python3 -m pip install boto3 botocore ec2-metadata findspark



#!/bin/bash

cd libsnark
mkdir build
cd build
#Sync & Initialization of libsnark
git submodule sync
git submodule init
# Update libsnark in order to pull down the files.
git submodule update --init --recursive
# Reset all submodules
git submodule foreach --recursive git reset --hard

brew list cmake || brew install cmake
brew list gmp || brew install gmp
brew list boost || brew install boost
brew list gcc || brew install gcc

ln -s /usr/local/opt/openssl/include/openssl /usr/local/include
cmake -DWITH_PROCPS=OFF -DWITH_SUPERCOP=OFF ..


make

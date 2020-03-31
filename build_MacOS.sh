#!/bin/bash

#installing Dependencies
brew list cmake || brew install cmake
brew list gmp || brew install gmp
brew list boost || brew install boost
brew list gcc || brew install gcc

# Removing old directory
rm -rf libsnark

# Update libsnark in order to pull down the files.
git submodule update libsnark

# Reset all submodules
git submodule foreach --recursive git reset --hard

cd libsnark
mkdir build
cd build

ln -s /usr/local/opt/openssl/include/openssl /usr/local/include
cmake -DWITH_PROCPS=OFF -DWITH_SUPERCOP=OFF ..


make

#!/bin/bash -i

# This schell script is modified from the existing script at https://github.com/cosmos/testnets/tree/master/public#bash-script 
# It is modified to work with the DVS Posthuman Validator school-testnet-1

# The script performs the following actions:
	# Updates system packages
	# Installs essential build tools
	# Installs Go and defines paths
	# clones gaia repository, checks out correct version, makes, and builds the binary
	# Configures chain ID and home folder
	# Initializes node_moniker on testnet chain ID

# The only thing you need to change is your NODE_MONIKER value; unless the branch or chain ID has changed in the meantime.

##### CONFIGURATION ###

export GAIA_BRANCH=v7.0.2
export NODE_HOME=$HOME/.gaia
export CHAIN_ID=school-testnet-1
export NODE_MONIKER=my-node # only really need to change this one
export BINARY=gaiad

##### CONFIGURATION ###

# you shouldn't need to edit anything below this

echo "Updating apt-get..."
sudo apt-get update

echo "Getting essentials..."
sudo apt-get install git build-essential ntp

echo "Installing go..."
wget -q -O - https://git.io/vQhTU | bash -s - --version 1.18

echo "Sourcing bashrc to get go in our path..."
source $HOME/.bashrc

export GOROOT=$HOME/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/root/go
export PATH=$GOPATH/bin:$PATH

echo "Getting gaia..."
git clone https://github.com/cosmos/gaia.git

echo "cd into gaia..."
cd gaia

echo "checkout gaia branch..."
git checkout $GAIA_BRANCH

echo "building gaia..."
make install
echo "***********************"
echo "INSTALLED GAIAD VERSION"
gaiad version
echo "***********************"

echo "configuring chain..."
$BINARY config chain-id $CHAIN_ID --home $NODE_HOME
$BINARY init $NODE_MONIKER --home $NODE_HOME --chain-id=$CHAIN_ID

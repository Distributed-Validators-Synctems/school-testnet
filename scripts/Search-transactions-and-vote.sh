#!/bin/bash

# This shell script is meant for Stage 2 of the DVS Validator School Testnet Competition.

### Configuration ###

export CHAIN_ID=school-testnet-1
export NODE_MONIKER=Monarch

### Configuration ###

# query active governance proposals
echo "Querying governance proposals..."
gaiad query gov proposals

# vote for the proposal given config values
echo "voting for proposal..."
gaiad tx gov vote <proposal_id> Yes \
  --from=$NODE_MONIKER \
  --chain-id=$CHAIN_ID


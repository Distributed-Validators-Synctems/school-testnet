#!/bin/bash -i

##### CONFIGURATION ###

export CHAIN_ID=school-testnet-1
export NODE_MONIKER=Monarch
export KEY_NAME=Monarch_key
export WEBSITE=https://gorgeous-penalty-e5f.notion.site/Test-Notion-Site-d53a3f11e90a40e8a253322041d46595
export NODE_DETAILS="Monarch"

##### CONFIGURATION ###

gaiad tx staking create-validator \
    --amount=1000000000uatom \
    --pubkey=$(gaiad tendermint show-validator) \
    --chain-id=$CHAIN_ID \
    --moniker=$NODE_MONIKER \
    --website=$WEBSITE \
    --details=$NODE_DETAILS \
    --commission-rate="0.10" \
    --commission-max-rate="0.20" \
    --commission-max-change-rate="0.01" \
    --min-self-delegation="1" \
    --gas="auto" \
    --gas-prices="0.0025uatom" \
    --from=$KEY_NAME
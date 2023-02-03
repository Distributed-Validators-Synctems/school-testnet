# Distributed **Validators School Testnet**

## **Quick Links**

Genesis: https://github.com/Distributed-Validators-Synctems/school-testnet-2/raw/master/genesis.json

Block explorer: `TBA`

Persistent peers: "b0000e2150232ad41ad535348a9f0aa28fc60407@65.109.220.1:26656,cd2858f390c1ed4531f07254893b84342d6f761a@38.242.148.56:26656,19562fac936b31d87211c795c16dd8e0f0d7bc25@65.109.167.179:26656,2d90840571b346f64d0e8bab92950f1af4013085@46.4.121.72:11756,541d51d63b5d8ca5ca8e0fc4f49ca4b00e507841@2.58.82.181:26656,d4cd03f5d06d2fb185044398c1a1085aec71117b@38.242.137.91:26656"

Chain Id: school-testnet-2

## **Hardware Requirements**

Here are the minimal hardware configs required for running a validator/sentry node

- 4GB RAM
- 2vCPUs
- 80GB Disk space

## **Software Requirements**

- Ubuntu 20.04+ or Debian 10+
- [Go v1.18+](https://golang.org/doc/install)

## **Install Gaiad, Generate Wallet and Submit GenTx**

### ****Cosmos Hub binaries installation (gaiad)****

For the sake of simplicity we decided to use Cosmos Hub service binary. In order to install it please follow steps from official Cosmos HUB [instructions](https://hub.cosmos.network/main/getting-started/installation.html). It is based on the `v7.0.2` version of `gaiad` binary. Please check version of used binary by running this command `gaiad version --long`. You should get big list of text and at the beginning of it you should have following lines:

```
name: gaia
server_name: gaiad
version: v7.0.2
commit: cd27aaaf39cc7819b5164e4baf3fd5aad23ec52a
build_tags: netgo ledger
```

### Network init

`cd ~`
`gaiad init "<moniker-name>" --chain-id school-testnet-2`

example:

`gaiad init course-participant-1 --chain-id school-testnet-2`

### **Create Validator Key**

It's very important that after you run this command that you save the seed phrase that is generated. If you do not save you phrase, you will not be able to recover this account.

`gaiad keys add <your validator key name>`

or restore existing wallet with mnemonic seed phrase. You will be prompted to enter mnemonic seed.

`gaiad keys add <key-name> --recover`

or add keys using ledger

`gaiad keys add <key-name> --ledger`

Check your key:

`gaiad keys show <key-name> -a`

### ****Create account to genesis****

This command will help you to create account in your local genesis file. It will add funds to your address. Otherwise `gaiad getntx` command will fail because of lack of funds.

`gaiad add-genesis-account <key-name> 1000000000uatom`

### ****Create GenTX****

Create the gentx file. Note, your gentx will be rejected if you use any amount greater than 1000000000uatom.

```
gaiad gentx <key-name> 1000000000uatom --output-document=$HOME/.gaia/config/gentx.json \
  --chain-id=school-testnet-2 \
  --moniker="<moniker-name>" \
  --website=<your-node-website> \
  --details=<your-node-details> \
  --commission-rate="0.10" \
  --commission-max-rate="0.20" \
  --commission-max-change-rate="0.01" \
  --min-self-delegation="1"
```

After gentx will be ready you can find it in the `~/.gaia/config/gentx.json` directory. After that you will be required to upload it into `gentxs` directory of this repository. Please name it using following template `gentx-<validator name>.json`.

In order to upload this file you will need to create fork of this repository. Please click on “Fork” button in the top right corner of this page, and name it somehow or leave repository name unchanged.

![fork.png](https://raw.githubusercontent.com/kuraassh/school-testnet/master/fork.png)

After that you can upload `gentx` file into appropriate directory of your repository. Next, you will need to create a PR (Pull request) to add changes from your cloned repository into main repository.

Please go into root directory of your repository and click on “Contribute” button.

![contribute.png](https://raw.githubusercontent.com/kuraassh/school-testnet/master/contribute.png)

You will see this popup window.

![popup.png](https://raw.githubusercontent.com/kuraassh/school-testnet/master/popup.png)

Please “Open pull request”, check data, put some description into text box field and click on “Create pull request” inside it. Congratulations you have created your first pull request!

### Create validator after genesis

```
gaiad tx staking create-validator \
  --amount=1000000000uatom \
  --pubkey=$(gaiad tendermint show-validator) \
  --chain-id=school-testnet-2 \
  --moniker="<moniker-name>" \
  --website=<your-node-website> \
  --commission-rate="0.10" \
  --commission-max-rate="0.20" \
  --commission-max-change-rate="0.01" \
  --min-self-delegation="1" \
  --gas="auto" \
  --gas-prices="0.0025uatom" \
  --from=<key_name>
```

## Run node

### ****Download genesis****

To download genesis:

`$ curl https://raw.githubusercontent.com/Distributed-Validators-Synctems/school-testnet-2/master/genesis.json > ~/.gaia/config/genesis.json`

After downloading you need to verify your `genesis.json` checksum

`sha256sum ~/.gaia/config/genesis.json`

you should see `efc118165b7f968d920c67e99586684209a06d8c7255370101b546d24536ea0e` in the output.

### ****Set Up Cosmovisor****

Set up cosmovisor to ensure any future upgrades happen flawlessly. To install Cosmovisor:

`go install github.com/cosmos/cosmos-sdk/cosmovisor/cmd/cosmovisor@v1.0.0`

Create the required directories:

```
mkdir -p ~/.gaia/cosmovisor/genesis/bin
mkdir -p ~/.gaia/cosmovisor/upgrades
```

After directories will be ready please copy `gaiad` binaries created in the “Cosmos Hub binaries installation (gaiad)” section into `~/.gaia/cosmovisor/genesis/bin` directory. You can do it using `cp ~/go/bin/gaiad ~/.gaia/cosmovisor/genesis/bin/gaiad` command.

### ****Set Up Gaiad Service****

Set up a service to allow cosmovisor to run in the background as well as restart automatically if it runs into any problems:

```
sudo tee <<EOF >/dev/null /etc/systemd/system/gaiad.service
[Unit]
Description=Cosmos Hub daemon
After=network-online.target
[Service]
Environment="DAEMON_NAME=gaiad"
Environment="DAEMON_HOME=${HOME}/.gaia"
Environment="DAEMON_RESTART_AFTER_UPGRADE=true"
Environment="DAEMON_ALLOW_DOWNLOAD_BINARIES=false"
Environment="DAEMON_LOG_BUFFER_SIZE=512"
Environment="UNSAFE_SKIP_BACKUP=true"
User=$USER
ExecStart=${HOME}/go/bin/cosmovisor start
Restart=always
RestartSec=3
LimitNOFILE=infinity
LimitNPROC=infinity
[Install]
WantedBy=multi-user.target
EOF
```
and start service:
```
sudo systemctl enable gaiad 
sudo systemctl daemon-reload
sudo systemctl restart gaiad
```

## **More about validators**

Please refer to the Cosmos Hub documentation on validators for a general overview of running a validator. We are using the exact same validator model and software, but with slightly different parameters and other functionality specific to the Validator School Network.

- [Run a Validator](https://hub.cosmos.network/main/validators/validator-setup.html)
- [Validators Overview](https://hub.cosmos.network/main/validators/overview.html)
- [Validator Security](https://hub.cosmos.network/main/validators/security.html)
- [Validator FAQ](https://hub.cosmos.network/main/validators/validator-faq.html)

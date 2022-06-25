![Snickerdoodle](https://github.com/SnickerdoodleLabs/Snickerdoodle-Theme-Light/blob/main/snickerdoodle_horizontal_notab.png?raw=true)

# Avalanche Local Subnet

This branch is used for creating a [local subnet](https://docs.avax.network/subnets/create-a-local-subnet) developement 
network. The [Avalanche-cli](https://github.com/ava-labs/avalanche-cli) currnetly does not work in a containerized environment, 
so for now you will have to run on a linux or max host. 

## Subnet Settings

The genesis file, [`snickerdoodle_genesis.json`](/snickerdoodle_genesis.json), defines the parameters of the subnet when it is
created. This file will create a subnet with the following parameters:

- Subnet Name: `Snickerdoodle`
- [chainId](https://chainlist.org/): `36`
- Total token amount: `13,500,000,000 DOODLE` 
- Genesis Airdrop Account: `0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266` (this is the first test account in Hardhat)

## Setting up

### Download the Avalanche CLI

```shell
curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s
```

### Compile the subnet configuration

```shell
./bin/avalanche subnet create snickerdoodle --file ./snickerdoodle_genesis.json --evm
```

### Start the subnet on a local network

```shell
./bin/avalanche subnet deploy snickerdoodle -l
```
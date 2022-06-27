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

## IMPORTANT: Docker Daemon Configuration

The Avalanche subnet tool uses IPV6 to resolve local IP address. Unfortunatly, the docker engine is not configured out-of-the-box to 
resolve IPV6 addresses. You must enable IPV6 in your local docker installation before creating a container from the subnet image. Update
your [`daemon.json`](https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-configuration-file) file to include the following
attributes:

```
{ 
        "ipv6": true,
        "fixed-cidr-v6": "fd00::/80"
}
```


## Manual Setup for Running Directly on Host Machine

### 1. Download the Avalanche CLI

```shell
cd Avalanche-Subnets
curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s
```

### 2. Compile the subnet configuration

```shell
./bin/avalanche subnet create snickerdoodle --file ./snickerdoodle_genesis.json --evm
```

### 3. Start the subnet on a local network

```shell
./bin/avalanche subnet deploy snickerdoodle -l
```

### 4. Check subnet status

```shell
./bin/avalanche network status
```

### 5. Stop the subnet

```shell
./bin/avalanche network stop snickerdoodle
```

### 6. Restarting the subnet

```shell
./bin/avalanche network start snickerdoodle
```

## Outstanding questions

- Do we want to put restrictions on who can [deploy contracts](https://docs.avax.network/subnets/customize-a-subnet#restricting-smart-contract-deployers) to our subnet? Probably...
- Where do we want to send [fees](https://docs.avax.network/subnets/customize-a-subnet#fee-recipient-1) from subnet validators? Probably the DAO?
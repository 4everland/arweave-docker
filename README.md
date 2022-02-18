# Arweave-Docker
Currently in testnet branch, you can compile the [arweave testnet](https://github.com/ArweaveTeam/arweave/tree/feature/testnet) image 
or pull the image from the [docker hub](https://hub.docker.com/r/4everland/arweave-node). 
After run this image, you'll be able to use the [TestWeave SDK](https://github.com/ArweaveTeam/testweave-sdk) 
for testing your arweave application locally.
## Usage
```shell
# only arweave node
$ docker run --rm --name arweave-node 4everland/arweave-node:testnet

# arm64 platform
$ docker run --rm --name arweave-node -v $path/bin-start-arm64.sh:/app/bin/start 4everland/arweave-node:testnet

# with auto miner
$ docker-compose up -d
```
### Tips
*  [This wallet](https://github.com/ArweaveTeam/testweave-sdk/blob/50f169fca015263b0cc04c60d25b6a40e9dd5378/src/assets/arweave-keyfile-MlV6DeOtRmakDOf6vgOBlif795tcWimgyPsYYNQ8q1Y.json) has a balance.
*  Modify and mount ```start.sh``` customized startup parameters.
*  Arm64  need to mount ```bin-start-arm64.sh``` to ```/app/bin/start```.

## Compile
```shell
$ docker build -t arweave-node .
```
Arm64 needs to be compiled using the environment of clang in ```Dockerfile```.
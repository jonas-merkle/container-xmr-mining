# container-xmr-mining

A Docker container setup to mine XMR based on [XMRig](https://github.com/xmrig).

## Table of contents

- [container-xmr-mining](#container-xmr-mining)
  - [Table of contents](#table-of-contents)
  - [Build the Docker container](#build-the-docker-container)
  - [Create the configuration file](#create-the-configuration-file)
  - [Start the Docker container](#start-the-docker-container)

## Build the Docker container

```bash
docker build -t xmr-mining-container ./src/ 
```

## Create the configuration file

Create based on the `./config/config_demo.json` a file called `./config/config.json` containing your custom settings.

## Start the Docker container

```bash
docker run -d --restart unless-stopped --name miner -v $(pwd)/config:/miner-config xmr-mining-container
```

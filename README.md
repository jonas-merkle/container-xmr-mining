# container-xmr-mining

A Docker container setup to mine XMR based on XMRig.

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

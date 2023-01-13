# XMR-Mining-Container

XMR-Mining-Container based on XMRig.

## Build the Docker Container

```bash
docker build -t xmr-mining-container ./src/ 
```

## Create the Configuration File

Create based on the `./config/config_demo.json` a file called `./config/config.json` containing your custom settings.

## Start the Docker Container

```bash
docker run -d --restart unless-stopped --name miner -v $(pwd)/config:/miner-config xmr-mining-container
```

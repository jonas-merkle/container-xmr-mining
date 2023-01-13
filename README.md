# XMR-Mining-Container

XMR-Mining-Container based on XMRig.

## Build the Docker Container

```bash
docker build -t xmr-mining-container ./src/ 
```

## Start the Docker Container

```bash
docker run -d --restart unless-stopped --name miner -v $(pwd)/config:/miner-config xmr-mining-container
```

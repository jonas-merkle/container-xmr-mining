# container-xmr-mining

A Docker container setup to mine XMR based on [XMRig](https://github.com/xmrig).

## Table of contents

- [container-xmr-mining](#container-xmr-mining)
  - [Table of contents](#table-of-contents)
  - [Setup](#setup)
    - [Docker](#docker)
    - [Docker Compose](#docker-compose)

## Setup

### Docker

0. Requirements

   - Docker

1. Build the Docker container

    ```bash
    docker build -t xmr-mining-container ./src/ 
    ```

2. Create the configuration file

    Create based on the `./config/config_demo.json` a file called `./config/config.json` containing your custom settings.

3. Limit the cpu usage

    To limit the cpu usage remove the `#` at the beginning of the following lines in the `docker-compose.yml` file:

    ```yml
        #deploy:
        #  resources:
        #    limits:
        #      cpus: "3.0"   # max cpu usage (1.0 equals 1 cpu core) 
    ```

4. Start the Docker container

    ```bash
    docker run -d --restart unless-stopped --name miner -v $(pwd)/config:/miner-config xmr-mining-container
    ```

### Docker Compose

0. Requirements

   - Docker
   - Docker Compose

1. Create the configuration file

    Create based on the `./config/config_demo.json` a file called `./config/config.json` containing your custom settings.

2. Limit the cpu usage

    To limit the cpu usage remove the `#` at the beginning of the following lines in the `docker-compose.yml` file:

    ```yml
        #deploy:
        #  resources:
        #    limits:
        #      cpus: "3.0"   # max cpu usage (1.0 equals 1 cpu core) 
    ```

3. Start container

    ```bash
    docker-compose up -d --build
    ````

4. Stop container

    ```bash
    docker-compose down
    ```

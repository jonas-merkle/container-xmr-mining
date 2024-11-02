# container-xmr-mining

A Docker container setup to mine XMR based on [XMRig](https://github.com/xmrig).

## Table of contents

- [container-xmr-mining](#container-xmr-mining)
  - [Table of contents](#table-of-contents)
  - [Setup](#setup)
    - [Docker](#docker)
    - [Docker Compose](#docker-compose)
  - [License](#license)

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

3. Start the Docker container

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

3. Build the container local

    If you ar not using a `linux x86` containerhost or want to build the container on startup the remove the `#` at the beginning of the following lines in the `docker-compose.yml` file:

    ```yml
        #build:
        #  context: ./src
        #  dockerfile: ./Dockerfile
    ```

    And add add a `#` at the beginning of the following line:

    ```yml
        image: ghcr.io/jonas-merkle/container-xmr-mining:master
    ```

4. Start container

    The default start command is:

    ```bash
    docker-compose up -d
    ````

    If you changed something in section 4. of this tutorial the use this command to start the container:

    ```bash
    docker-compose up -d --build
    ````

5. Stop container

    ```bash
    docker-compose down
    ```

## License

This project is licensed under the [GNU Lesser General Public License v3.0](https://www.gnu.org/licenses/lgpl-3.0.html) (LGPLv3). You are free to use, modify, and distribute this software under the terms specified in the LGPLv3.

See the [LICENSE](./LICENSE) file for more detailed information.
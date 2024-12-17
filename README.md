# container-xmr-mining

A Docker container setup for mining Monero (XMR) using [XMRig](https://github.com/xmrig). This repository provides a simple Docker and Docker Compose setup to facilitate a fast and efficient mining experience.

## Table of Contents

- [container-xmr-mining](#container-xmr-mining)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Setup](#setup)
    - [Using only the Docker image](#using-only-the-docker-image)
    - [Using Docker Compose](#using-docker-compose)
      - [Configuration](#configuration)
  - [Running the Project](#running-the-project)
  - [Security Notes](#security-notes)
  - [License](#license)

## Requirements

- Docker
- Docker Compose

## Setup

### Using only the Docker image

1. Pull the Docker image:

    ```sh
    docker pull ghcr.io/jonas-merkle/container-xmr-mining:latest
    ```

2. Run the Docker container:

    ```sh
    docker run -d --name xmr-miner -v $(pwd)/config:/miner-config:ro ghcr.io/jonas-merkle/container-xmr-mining:latest
    ```

### Using Docker Compose

1. Clone the repository:

    ```sh
    git clone https://github.com/jonas-merkle/container-xmr-mining.git
    cd container-xmr-mining
    ```

2. Copy the demo configuration file:

    ```sh
    cp ./config/config_demo.json ./config/config.json
    ```

3. Edit the `config.json` file to suit your needs:

    ```sh
    nano ./config/config.json
    ```

4. Start the Docker Compose setup:

    ```sh
    docker-compose up -d
    ```

#### Configuration

The XMRig tool must be configured before the first run. Follow these steps to set up the tool:

1. Copy the Demo Configuration File:

    ```sh
    cp ./config/config_demo.json ./config/config.json
    ```

2. Edit the Configuration File:
    Open the `config.json` file in your preferred text editor:

    ```sh
    nano ./config/config.json
    ```

3. Essential Configuration Settings:
    - Pool Information:

        ```json
        "url": "pool.minexmr.com:4444"
        ```

    - Wallet Address:

        ```json
        "user": "YOUR_WALLET_ADDRESS"
        ```

4. Advanced Configuration Options:
    - Worker ID (Optional):

        ```json
        "rig-id": "my-miner-01"
        ```

    - Algorithm Selection:

        ```json
        "algo": "rx/0"
        ```

    - Threads Configuration:

        ```json
        "threads": 4
        ```

    - Background Mode:

        ```json
        "background": true
        ```

    - Max CPU Usage:

        ```json
        "max-cpu-usage": 75
        ```

    - Donate Level:

        ```json
        "donate-level": 1
        ```

5. Logging and Monitoring:
    - Log File:

        ```json
        "log-file": "/miner-config/xmrig.log"
        ```

    - Print Time Interval:

        ```json
        "print-time": 60
        ```

6. Tuning for Optimal Performance:
    - Huge Pages:

        ```json
        "huge-pages": true
        ```

    - Affinity:

        ```json
        "cpu-affinity": [0, 2, 4, 6]
        ```

For more detailed information on configuring XMRig, refer to the [XMRig Configuration Guide](./doc/XMRig-Configuration-Guide.md). Configuration

The XMRig tool must be configured before the first run. Have a look at the short [documentation](./doc/XMRig-Configuration-Guide.md) on how to set up the tool.

## Running the Project

1. Ensure Docker and Docker Compose are installed on your system.

2. Clone the repository and navigate to the project directory:

    ```sh
    git clone https://github.com/jonas-merkle/container-xmr-mining.git
    cd container-xmr-mining
    ```

3. Copy and edit the configuration file:

    ```sh
    cp ./config/config_demo.json ./config/config.json
    nano ./config/config.json
    ```

4. Start the Docker Compose setup:

    ```sh
    docker-compose up -d
    ```

5. Check the logs to ensure the miner is running correctly:

    ```sh
    docker-compose logs -f
    ```

## Security Notes

- **Environment Variables**: Ensure that `.env` files are not shared or tracked in version control, as they may contain sensitive information such as API tokens or credentials.
- **Sensitive Files**: Always keep sensitive files like `.env` secure and ensure they are not exposed publicly.

## License

This project is licensed under the [**GNU Lesser General Public License v3.0**](https://www.gnu.org/licenses/lgpl-3.0.html) (LGPLv3).
It is distributed "as is", without warranty of any kind.
You are free to use, modify, and distribute this software under the terms specified in the LGPLv3.

See the [LICENSE](./LICENSE) file for more detailed information.

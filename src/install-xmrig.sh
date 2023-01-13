#!/bin/bash

apt update && apt upgrade -y
apt install wget git build-essential cmake automake libtool autoconf -y
git clone https://github.com/xmrig/xmrig.git
mkdir xmrig/build && cd xmrig/scripts
./build_deps.sh && cd ../build
cmake .. -DXMRIG_DEPS=scripts/deps
make -j$(nproc)
# Use a lightweight base image
FROM ubuntu:latest AS builder

# Set non-interactive environment to avoid prompts during builds
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies for building xmrig
RUN apt-get update && apt-get install -y \
    wget git build-essential cmake automake libtool autoconf \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone the xmrig repository and build it
WORKDIR /xmrig
RUN git clone https://github.com/xmrig/xmrig.git . && \
    mkdir build && cd scripts && ./build_deps.sh && cd ../build && \
    cmake .. -DXMRIG_DEPS=scripts/deps && \
    make -j$(nproc)

# Create a minimal runtime image
FROM ubuntu:latest AS runtime

# Set non-interactive environment
ENV DEBIAN_FRONTEND=noninteractive

# Install runtime dependencies
#RUN apt-get update && apt-get install -y \
#    libhwloc15 libuv1 libssl1.1 \
#    --no-install-recommends && \
#    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the built xmrig binary from the builder stage
COPY --from=builder /xmrig/build/xmrig /usr/local/bin/xmrig

# Default command to run xmrig
CMD ["xmrig"]

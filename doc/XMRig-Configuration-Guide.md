# XMRig Configuration Guide

XMRig requires a configuration file (`config.json`) to define mining parameters like pool address, wallet information, and CPU/GPU settings. Below are step-by-step instructions for setting up `config.json`:

1. **Create the Configuration File**

   - Copy the demo configuration file as a starting point:

     ```bash
     cp ./config/config_demo.json ./config/config.json
     ```

   - Open `config.json` in your preferred editor (e.g., `nano ./config/config.json`) to modify it.

2. **Essential Configuration Settings**

   Update these settings to ensure XMRig is properly configured for your setup:

   - **Pool Information**:
     - The pool is where your mining software connects to share computing power and earn rewards.
     - Replace `"url": "pool.example.com:3333"` with your chosen pool’s address. For example:

       ```json
       "url": "pool.minexmr.com:4444"
       ```

   - **Wallet Address**:
     - Set `"user": "YOUR_WALLET_ADDRESS"` with your Monero (XMR) wallet address to receive mining rewards. For example:

       ```json
       "user": "46Jmjc9gDgQg3HoX5...your_monero_wallet_address_here..."
       ```

   - **Worker ID** (Optional):
     - You can use the `"rig-id"` setting to distinguish multiple miners in your pool account. This is helpful for managing multiple rigs:

       ```json
       "rig-id": "my-miner-01"
       ```

3. **Advanced Configuration Options**

   XMRig offers additional settings to optimize mining performance and reduce system resource usage.

   - **Algorithm Selection**:
     - Ensure you’re mining with the correct algorithm. Monero uses the `rx/0` (RandomX) algorithm. Verify that it’s correctly set:

       ```json
       "algo": "rx/0"
       ```

   - **Threads Configuration**:
     - You can specify the number of CPU threads to use. If you want XMRig to auto-detect the optimal number of threads, set this to `null`. To customize, set `"threads"` to a number. For example:

       ```json
       "threads": 4
       ```

   - **Background Mode**:
     - If you want XMRig to use CPU resources only when your system is idle, set `"background": true`. This can reduce system slowdown during other tasks:

       ```json
       "background": true
       ```

   - **Max CPU Usage**:
     - Control the percentage of CPU resources that XMRig can use by setting `"max-cpu-usage"`. For example, setting `"max-cpu-usage": 75` limits the miner to 75% CPU usage:

       ```json
       "max-cpu-usage": 75
       ```

   - **Donate Level**:
     - XMRig includes a default 1% donation to support the developers. You can modify or remove this by setting `"donate-level"` to your preferred donation percentage:

       ```json
       "donate-level": 1
       ```

4. **Logging and Monitoring**

   XMRig provides logging options that can help you monitor performance and troubleshoot issues.

   - **Log File**:
     - You can enable logging to a file for long-term monitoring:

       ```json
       "log-file": "/miner-config/xmrig.log"
       ```

   - **Print Time Interval**:
     - Control how often XMRig prints status updates to the console. This is set in seconds:

       ```json
       "print-time": 60
       ```

5. **Tuning for Optimal Performance**

   Fine-tuning settings based on your hardware can improve mining efficiency.

   - **Huge Pages**:
     - Huge pages can improve mining performance by reducing memory overhead. Set `"huge-pages": true` to enable this (may require additional OS configuration).

     ```json
     "huge-pages": true
     ```

   - **Affinity**:
     - Use `"cpu-affinity"` to bind threads to specific CPU cores, improving stability and potentially enhancing performance. Refer to XMRig’s documentation for specific affinity settings.

6. **Finalizing Configuration**

   Save `config.json` once you have completed the adjustments. This file should be located in the `config` directory within the project’s root folder. Ensure the Docker container is set up to access it by binding the volume as shown in the Docker commands.

### Example Configuration

Here’s an example configuration to help guide you. Adapt it to match your specific requirements:

```json
{
  "url": "pool.minexmr.com:4444",
  "user": "46Jmjc9gDgQg3HoX5...your_monero_wallet_address_here...",
  "pass": "x",
  "rig-id": "my-miner-01",
  "algo": "rx/0",
  "background": true,
  "max-cpu-usage": 75,
  "donate-level": 1,
  "threads": null,
  "print-time": 60,
  "huge-pages": true,
  "log-file": "/miner-config/xmrig.log"
}
```

This example sets up XMRig to mine with 75% CPU usage in the background, while logging to a file and utilizing huge pages for performance. Adjust settings as needed based on your hardware and pool requirements.

For detailed options and explanations, refer to the official [XMRig Configuration Guide](https://xmrig.com/docs/miner/config) on the XMRig website.

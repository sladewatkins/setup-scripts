# Setup Scripts
I use these to automate the setup of my computers, dependent on its operating system (usually Linux or macOS). These are quite literally tailored towards me, so I wouldn't recommend using them for your own systems (unless you modify them for yourself, of course.)

## macOS
Copy, paste, then run this command in **Terminal.app**. Keep in mind, it's setting up the Terminal and all apps on the system to act like me, not you. I would actually recommend you fork this repo and change the scripts yourself first.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/sladewatkins/setup-scripts/HEAD/mac-setup.sh)"
```

This script requires [macOS Ventura (13.x)](https://apps.apple.com/us/app/macos-ventura/id1638787999?mt=12), but is fully working on [macOS Sonoma (14.x)](https://www.apple.com/macos/sonoma/). It should work fine on Intel Macs, but I've only tested on Apple silicon (M2).

## Pop!_OS 22.04
Coming soon.

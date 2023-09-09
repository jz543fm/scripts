# Managing multiple releases of binaries

Specify binary to install in `install.sh`, actually is there only kustomize for testing, so install by specific version specific release and then you need to create a symlink for a specific tool by specific release, use `symlink.sh`, the script will check where you've installed the tools to symlink and then creates symlinks to the `/usr/local/bin/${TOOL}`

## Install:

Set version in `install.sh` of tool you want to test, then install the proper version, then use `symlink.sh`, set the tool and version for symlink creation purposes and then you can verify version of tool

## Removing symlink

```bash
sudo rm -i /usr/local/bin/${TOOL}
```
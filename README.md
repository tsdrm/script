# script

A script for installation service

About Script: It's a sample scipt to install/uninstall the server on Ubuntu.

```
#### Install the service
Usage:
    ./install.sh -u tangs -e /tmp/yourExec -n yourServiceName -d /home/tangs/yourServiceStartDir
    
#### Uninstall the service
Usage:
    ./uninstall.sh -n yourServiceName
    
`./install.sh --help` or `./uninstall.sh --help` for detail.
	
```
Developing

- [x] Uninstall the server
- [x] Server start on booting

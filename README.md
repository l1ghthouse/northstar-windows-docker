# northstar-windows-docker

# Build:

 - Place dockerfile and dockerignore into the root directory of titanfall.

 - `docker build .`

# Run in process isolation:

`docker run <DOCKER_ID>`

Then use: https://docs.microsoft.com/en-us/powershell/module/netsecurity/new-netfirewallrule?view=windowsserver2022-ps to expose ports to the process


# Run in hyper-v isolation(preferred): 

`docker run -p 8081:8081 -p 37015:37015/udp --memory 8192m --cpus 4 --rm --isolation=hyperv <DOCKER_ID> -dedicated -softwared3d11`

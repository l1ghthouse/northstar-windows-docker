# northstar-windows-docker

# Build:

 - Place dockerfile and dockerignore into the root directory of titanfall.

 - `docker build .`

# Run in process isolation:

`docker run <DOCKER_ID>`

The process of exposing ports for process isolated containers is a bit more complicated than hyper-v isolation.
Follow my comment here to open ports when using process isolation: https://github.com/microsoft/Windows-Containers/issues/190#issuecomment-1013519644

if running in a VM, consider allocating extra CPU, as described in: https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-containers/resource-controls, and providing real-time process priority



# Run in hyper-v isolation: 

`docker run -p 8081:8081 -p 37015:37015/udp --memory 8192m --cpus 4 --rm --isolation=hyperv <DOCKER_ID> -dedicated -softwared3d11`

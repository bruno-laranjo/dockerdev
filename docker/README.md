# Docker images for Development and DevOps
## Dev Image

### How to build
    docker build -t dev/remote-cpp-env --file="dev.Dockerfile" .

### Run the image
    docker run -d --cap-add sys_ptrace --network host --name dev_remote_env dev/remote-cpp-env

### Connect to the image

#### Terminal connection
You can use ssh to connect to your machine:
    ssh user@localhost -p 2222

## DevOps Image
The image for DevOps is still on the makings

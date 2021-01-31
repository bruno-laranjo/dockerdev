# Remote docker environment (How to build docker container, run and stop it)
# Based on the Clion cpp remote development from here https://github.com/JetBrains/clion-remote
#
# Build and run:
#   docker build -t dev/remote-cpp-env -f dev.Dockerfile .
#   docker run -d --cap-add sys_ptrace --network host --name dev_remote_env dev/remote-cpp-env
#   ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:2222"
#
# stop:
#   docker stop dev_remote_env
# 
# ssh credentials (test user):
#   user@password 

FROM ubuntu:20.04

# For ubuntu 20.04 image we need to configure timezone
ENV TZ=Europe/Lisbon
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
  && apt-get install -y ssh \
      build-essential \
      gcc \
      g++ \
      gdb \
      clang \
      cmake \
      rsync \
      tar \
      python \
  && apt-get clean

RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'Port 2222'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
  ) > /etc/ssh/sshd_config_test_dev \
  && mkdir /run/sshd

ENV USER=user
RUN useradd -m $USER \
  && yes password | passwd $USER

# Start the image in bash when enter ssh
RUN usermod -s /bin/bash $USER

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_test_dev"]
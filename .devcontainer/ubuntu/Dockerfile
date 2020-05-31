FROM ubuntu:18.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt update && apt upgrade -y && \
    apt install curl -y

RUN apt install git nano bash-completion -y && \
    echo "if [ -f /etc/bash_completion ]; then" >> /etc/bash.bashrc && \
    echo ". /etc/bash_completion" >> /etc/bash.bashrc && \
    echo "fi" >> /etc/bash.bashrc

RUN mkdir /usr/local/nvm

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 12.17.0

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
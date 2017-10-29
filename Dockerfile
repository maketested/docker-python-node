FROM circleci/python:3.6.3-stretch-browsers

# Pipenv

RUN sudo pip install --upgrade pipenv && \
pipenv --version

# Node

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
sudo apt-get install -y nodejs && \
node --version

# Yarn

RUN sudo npm install --global yarn && \
yarn --version

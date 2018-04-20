## Install Script

The following setup will set up your ubuntu machine with: 

* Git
* Curl
* Node
* PM2


### Start by setting up git on an Ubuntu Machine

1. ```sudo apt-get update -y```
2. ```sudo apt-get install git-core```
3. ```git config --global user.name <username>```
4. ```git config --global user.email <useremail>```


### Download the relevant repository (dispatcher or worker)

1. ```git clone git@bitbucket.org:oxfordgenetics/async-worker.git```
2. ```cd async-worker```
3. ```sudo ./install.sh```

This will install all the required packages and spin up the worker process using
PM2

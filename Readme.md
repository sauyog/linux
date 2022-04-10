## Name: Saurabh Vijaywargia

## SJSU ID: 015224677

-Installed VMware Workstation and created a VM with Ubuntu OS with 8 processors and 6GB RAM.

-Then mounted Ubuntu 20.04 iso image to the VM and then installed the Ubuntu Operating system in VMware Workstation.

-Enabled  the nested VM capability feature for the virtual Machine.

-Then, forked the linux repsoitory from torvalds and then cloned the linux repository from my github account.

-Then, Built the latest linux source code succesfully. 

-Once the kernal source code was built, I added Primary proc based controls, Exit based controls, Secondary Procbased controls and Entrybased controls.   

# Steps to install the dependencies:

sudo apt install git

sudo apt install make

sudo apt install gcc

sudo apt install flex

sudo apt install bison

sudo apt-get install libssl-dev

sudo apt-get install libelf-dev

sudo apt install dwarves

sudo apt install zstd


# Execution Steps for linux source code build and installation:

git clone https://github.com/sauyog/linux.git 

cd linux

git status

git remote -v

uname -a

make clean

cp /boot/config-5.13.0-39-generic .config

make oldconfig

make prepare

scripts/config --disable SYSTEM_TRUSTED_KEYS

scripts/config --disable SYSTEM_REVOCATION_KEYS

make -j 4 modules

make -j 4

sudo make INSTALL_MOD_STRIP=1 modules_install

sudo make install

sudo reboot

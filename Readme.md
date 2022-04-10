## Name: Saurabh Vijaywargia

## SJSU ID: 015224677

-Installed VMware Workstation and created a VM with Ubuntu OS with 8 processors and 6GB RAM.

-Then mounted Ubuntu 20.04 iso image to the VM and then installed the Ubuntu Operating system in VMware Workstation.

-Enabled  the nested VM capability feature for the virtual Machine.

-Then, forked the linux repsoitory from torvalds and then cloned the linux repository from my github account.

-Then, Built the latest linux source code succesfully. 

![Screenshot 2022-04-09 205316](https://user-images.githubusercontent.com/23494069/162604519-1cbe7764-a17e-4bf3-8810-57f983eb9fd8.png)

![Screenshot 2022-04-09 222737](https://user-images.githubusercontent.com/23494069/162604530-5a83aec9-aab8-4c19-9101-6e1f4bd3ca7a.png)

-Once the kernal source code was built, I added Primary proc based controls, Exit based controls, Secondary Procbased controls and Entrybased controls.   

The output in dmesg is shown below.

![Screenshot 2022-04-09 225410](https://user-images.githubusercontent.com/23494069/162604543-137aa6d6-493f-4db3-a8b7-1af404a48588.png)
![Screenshot 2022-04-09 225446](https://user-images.githubusercontent.com/23494069/162604544-5691d63c-0bad-446d-b524-6949bd899446.png)
![Screenshot 2022-04-09 225509](https://user-images.githubusercontent.com/23494069/162604545-b45fb71c-88bd-4757-aeb4-e9f5c74b4c8c.png)


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

# Steps to build cmpe283-1.c source code, load and remove the module and see message logs:

sudo make

cmpe283-1.c generates cmpe283-1.ko file. Now using the command "sudo insmod cmpe283-1.ko" the module can be loaded in to the kernel and using the command 
"sudo rmmod cmpe283_1" it can be removed.

The logs can be seen using the command "dmesg"

# Name: Saurabh Vijaywargia

# SJSU ID: 015224677

# code files I have placed in the folder cmpe283 for all assignments

# Assignment 1

-First I installed VMware Workstation and created a VM with Ubuntu OS with 8 processors and 6GB RAM. Then I mount the Ubuntu 20.04 iso image to the VM and installed the Ubuntu Operating system in the Workstation.

-From settings I enabled the nested VM capability feature for the virtual Machine.

-Then, forked the linux repsoitory from torvalds and then cloned the linux repository from my github account.

-Then, Built the latest linux source code succesfully. 

![Screenshot 2022-04-09 205316](https://user-images.githubusercontent.com/23494069/162604519-1cbe7764-a17e-4bf3-8810-57f983eb9fd8.png)

![Screenshot 2022-04-09 222737](https://user-images.githubusercontent.com/23494069/162604530-5a83aec9-aab8-4c19-9101-6e1f4bd3ca7a.png)

-Once the kernal source code was built, I added Primary proc based controls, Exit based controls, Secondary Procbased controls and Entrybased controls.   

The output in dmesg is shown below.

![Screenshot 2022-04-09 225410](https://user-images.githubusercontent.com/23494069/162604543-137aa6d6-493f-4db3-a8b7-1af404a48588.png)
![Screenshot 2022-04-09 225446](https://user-images.githubusercontent.com/23494069/162604544-5691d63c-0bad-446d-b524-6949bd899446.png)
![Screenshot 2022-04-09 225509](https://user-images.githubusercontent.com/23494069/162604545-b45fb71c-88bd-4757-aeb4-e9f5c74b4c8c.png)


### Steps to install the dependencies:

sudo apt install git

sudo apt install make

sudo apt install gcc

sudo apt install flex

sudo apt install bison

sudo apt-get install libssl-dev

sudo apt-get install libelf-dev

sudo apt install dwarves

sudo apt install zstd


### Execution Steps for linux source code build and installation:

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

### Steps to build cmpe283-1.c source code, load and remove the module and see message logs:

sudo make

cmpe283-1.c generates cmpe283-1.ko file. Now using the command "sudo insmod cmpe283-1.ko" the module can be loaded in to the kernel and using the command 
"sudo rmmod cmpe283_1" it can be removed.

The logs can be seen using the command "dmesg"


# Assignment 2

The Changed files are cpuid.c and vmx.c

For CPUID leaf node %eax=0x4FFFFFFF and leaf node %eax=0x4FFFFFFE, I updated the code in vmx.c and cpuid.c to get the total number of exits and total time taken in handling the exits. Then I Installed the nested virtual machine inside the virtual machine and ran CPUID Package with 0x4FFFFFFF and 0x4FFFFFFE in eax.
For 1st case the total number of exits is returned to eax. For Second case the total time taken value's higher 32 bits are returned to ebx and lower 32 bits are returned to ecx.

### Commands are as follows:

make modules

make -j 4 modules

sudo bash

sudo make INSTALL_MOD_STRIP=1 modules_install
  
sudo rmmod kvm-intel

sudo rmmod kvm

modprobe kvm

modprobe kvm-intel

### Now for creating the virtual machine inside current virtual machine following commands are executed:
  
sudo apt update

sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

sudo systemctl status libvirtd

sudo systemctl enable --now libvirtd

sudo apt install virt-manager

sudo virt-manager

installing ubuntu 20.4 iso image in the virtual manager

![3](https://user-images.githubusercontent.com/23494069/163943854-f3edb0e2-a76a-4997-9dd1-0b2886efc65c.png)

Adding the line 'deb http://mirrors.kernel.org/ubuntu bionic main universe' in /etc/apt/sources.list file and running

sudo apt-get -y update

sudo apt-get install cpuid

Will install cpuid package in inner ubuntu VM. Now executing the commands in inner VM

cpuid -l 0X4fffffff -s exit_number
cpuid -l 0X4ffffffe -s exit_number

The output from inner vm is captured below.

![1](https://user-images.githubusercontent.com/23494069/163943789-1dd9fdfb-061c-4976-96e4-0e87c50b62a1.png)

In outer VM running dmesg command and capturing the output below.
  
![2](https://user-images.githubusercontent.com/23494069/163943807-41e2b705-1bf3-48fc-ab68-4bc6a2db19d2.png)


# Assignment 3

● CPUID leaf node %eax=0x4FFFFFFC and %eax=0x4FFFFFFD

● Modified the code in vmx.c to get the total time spent in processing specific exit number and get the number of exits for a given exit number in ecx.

●	Modified the code in cpuid.c to to get the higher 32 and lower 32 bits bits of exit processing time in ebx and ecx respectively. 

And also modified it to get the total number of exits for a given exit number.

● Ran CPUID Package for 0x4FFFFFFC and 0x4FFFFFFD with exit number in ecx.



### Output:
● Ran the below commands in the inner VM which is inside outer VM

  cpuid -l 0X4ffffffc -s exit_number
  
  cpuid -l 0X4ffffffd -s exit_number
  
● Ran the command dmesg in the outer VM which gave the output.

### Observations:

3: Comment on the frequency of exits – does the number of exits increase at a stable rate? Or are there more exits performed during certain VM operations? Approximately how many exits does a full VM boot entail?

The frequency of exits increases at a steady rate. From the screenshots It can be observed that VM boot for all the exits entails up to ~6800000.

4. Of the exit types defined in the SDM, which are the most frequent? Least?

The most frequent exits are as follows:
●	Exit number 48 - EPT Violation
●	Exit number 32 - WRMSR
●	Exit number 1- External Interrupt
●	Exit number 12- HLT
●	Exit number 49- EPT misconfiguration
●	Exit number 10- CPUID
The least frequent exits are as follows:
●	Exit number 54 - WBINVD or WBNOINVD
●	Exit number 55 -  XSETBV
●	Exit number 29 - MOV DR


# Assignment 4


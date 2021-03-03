Base image http://mirror.cs.pitt.edu/archlinux/iso/

loadkeys dvorak
timedatectl set-ntp true
fdisk /dev/sda
#n, p ENTER a bunch, w
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt
vim /etc/pacman.d/mirrorlist #comment all except one US
pacstrap /mnt base linux base-devel dhcpcd vi sudo
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
/etc/locale.gen
locale-gen 
/etc/locale.conf 
	LANG=en_US.UTF-8
/etc/vconsole.conf
	KEYMAP=dvorak
/etc/hostname
	linux
/etc/hosts
	127.0.0.1	localhost
    ::1		localhost
    127.0.1.1	linux.localdomain	linux
passwd
pacman -S Amd-ucode or intel-ucode grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
exit
poweroff
#Remove cd
#Reboot
#Login as root
systemctl start/enable dhcpcd
visudo uncomment wheel
useradd -m -G wheel pai
passwd pai
pacman -S linux-headers virtualbox-guest-dkms
Insert guest-addition cd
mkdir /mnt/cd
mount /dev/sr0 /mnt/cd
sudo sh /mnt/cd/VBoxLinuxAdditions.run
#run desktop-install.sh
#run app-install.sh
#run app-config.sh

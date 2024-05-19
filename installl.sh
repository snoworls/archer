#!/bin/sh

useradd -m -g wheel tom

echo "enter your root password"
passwd
echo "enter your user password"
passwd tom

link -sf /usr/share/zoneinfo/US/Eastern /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "archery" > /etc/hostname

systemctl enable NetworkManager

# grub

grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# install everything

pacman -S xorg xorg-xinit firefox texlive texlive-lang polybar git bspwm sxhkd

git clone https://github.com/snoworls/config
git clone https://git.suckless.org/dmenu

cd config
mv st ~/
mkdir ~/.config
mkdir ~/.config/polybar
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
chmod +x internett.sh bat.sh
mv polybar/config.ini polybar/internett.sh polybar/bat.sh ~/.config/polybar
mv bspwm/bspwmrc ~/.config/bspwm
mv sxhkd/sxhkdrc ~/.config/sxhkd

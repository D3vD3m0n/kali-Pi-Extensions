# Use colors, but only if connected to a terminal, and that terminal
# supports them.
  RED=$(printf '\033[31m')
  GREEN=$(printf '\033[32m')
  YELLOW=$(printf '\033[33m')
  BLUE=$(printf '\033[34m')
  BOLD=$(printf '\033[1m')
  RESET=$(printf '\033[m')  RED=$(printf '\033[31m')
  GREEN=$(printf '\033[32m')
  YELLOW=$(printf '\033[33m')
  BLUE=$(printf '\033[34m')
  BOLD=$(printf '\033[1m')
  RESET=$(printf '\033[m')
  
  
sudo apt-get install v86d hwinfo -y
sudo hwinfo --framebuffer
echo "---------------------------------------------------------------"
echo "Please enter the best resolution from the list above"
echo "It usualy looks like this >>Mode 0x0323: 1024x768 (+4096), 24 bits<<"
echo "And you have to enter it like this >>1024x768-24<<"
echo "---------------------------------------------------------------"
read resolution
sed 's/GRUB\_CMDLINE\_LINUX\_DEFAULT\=\"quiet\ splash\"/GRUB\_CMDLINE\_LINUX\_DEFAULT\=\"quiet\ splash\ nomodeset\ video\=uvesafb\:mode\_option\='$resolution'\,mtrr\=3\,scroll\=ywrap\"/g' /etc/default/grub > ./newgrub
sudo mv -f ./newgrub /etc/default/grub
sed 's/\#GRUB\_GFXMODE\=640x480/GRUB\_GFXMODE\='$resolution'/g' /etc/default/grub > ./newgrub
sudo mv -f ./newgrub /etc/default/grub
sudo echo "uvesafb mode_option=$resolution mtrr=3 scroll=ywrap" | sudo tee -a /etc/initramfs-tools/modules
echo FRAMEBUFFER=y | sudo tee /etc/initramfs-tools/conf.d/splash
sudo update-grub2
sudo update-initramfs -u
echo "The resolution should be fixed after a reboot"
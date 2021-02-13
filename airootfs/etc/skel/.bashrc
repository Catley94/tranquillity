#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#Alias for update-grub
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#Start neofetch
neofetch

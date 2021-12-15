#!/bin/bash

# Typo
bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

rouge=$(	tput setaf 1)
vert=$(		tput setaf 2)
jaune=$(	tput setaf 3)
bleu=$(		tput setaf 4)
violet=$(	tput setaf 5)
cyan=$(		tput setaf 6)
gris=$(		tput setaf 7)

# Fonctions
shw_norm () { echo -en "${bold}$(tput setaf 9)${@}${reset}";	}
shw_info () { echo -en "${bold}${cyan}${@}${reset}";		}
shw_OK ()   { echo -en "${bold}${vert}OK!${@}${reset}";		}
shw_warn () { echo -en "${bold}${violet}${@}${reset}";		}
shw_err ()  { echo -en "${bold}${rouge}${@}${reset}";		}
gris() 	    { echo -en "${bold}${gris}${@}${reset}";		}
header()    { echo -e "${bold}${jaune}$*${reset}";		}
headerU()   { echo -e "${underline}${bold}${jaune}$*${reset}";  }

clear && echo -e "\n\n"
header "======================================================="
header "===          Setting up your Raspberry Pi           ==="
headerU "=======================================================\n"

if [ $# -eq 0 ]
  then
    shw_warn "No arguments supplied, please choose the roles to install\n"
    shw_warn "exiting...\n"
    exit 1
fi

sudo apt update
sudo apt install python3-pip git -y
sudo pip install --upgrade pip
sudo python3 -m pip install ansible

installdir="/tmp/pi-$RANDOM"
mkdir $installdir

git clone https://github.com/atao/raspberrypi-setup.git $installdir
if [ ! -d $installdir ]; then
    shw_err "git cloned failed\n"
    shw_err "exiting...\n"
    exit 1
else
    cd $installdir
    ansible-playbook playbook.yml -i localhost --tags $1
fi

shw_info "cleaning up...\n\n"

rm -Rfv /tmp/$installdir

shw_OK " Enjoy!\n"

exit 0

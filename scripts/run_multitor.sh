#!/bin/bash
###########################################
# Run Multitor
###########################################
# auteur : atao
VERSION="2020.03.17"
# licence type  : Creative Commons Attribution-NoDerivatives 4.0 (International)
# licence info  : http://creativecommons.org/licenses/by-nd/4.0/
###########################################

bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

rouge=$(        tput setaf 1)
vert=$(         tput setaf 2)
jaune=$(        tput setaf 3)
bleu=$(         tput setaf 4)
violet=$(       tput setaf 5)
cyan=$(         tput setaf 6)
gris=$(         tput setaf 8)
blanc=$(        tput setaf 7)
#base=$(                tput reset)

# Fonctions
shw_norm () { echo -en "${bold}${@}${reset}";   }
shw_info () { echo -en "${bold}${cyan}${@}${reset}";            }
shw_OK ()   { echo -en "${bold}${vert}OK!${@}${reset}";         }
shw_warn () { echo -en "${bold}${violet}${@}${reset}";          }
shw_err ()  { echo -en "${bold}${rouge}${@}${reset}";           }
gris()      { echo -en "${bold}${gris}${@}${reset}";            }
header()    { echo -e "${bold}${jaune}$*${reset}";              }
headerU()   { echo -e "${underline}${bold}${jaune}$*${reset}";  }

# debut du script
clear && echo -e "\n\n"
header  "****************************************************************************"
header  "***   Run Multitor (v${VERSION}) ***"
headerU  "****************************************************************************"

gris "\n\tProject : https://github.com/trimstray/multitor\n"

# Vérification execution en tant que 'root'
shw_norm "\n\t::: execution en tant que root... " 
if [[ $EUID -ne 0 ]]; then
        sudo "$0" "$@" || (shw_err "Ce script doit être executé avec les droits 'root'. Arrêt du script.\n" ; exit 1)
else
        shw_OK
fi

# kill all multitor processes
shw_norm "\n\nkill all multitor processes\n\n"
sudo multitor -k

# Start multitor processes
shw_norm "\nStart multitor processes : \n"
sudo multitor --init 8 --user debian-tor --socks-port 9000 --control-port 9900 --proxy privoxy --haproxy

shw_norm "Bye!\n"
exit 0

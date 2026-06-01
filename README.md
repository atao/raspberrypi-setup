# Raspberry Pi Setup

[![YAML Lint](https://github.com/atao/raspberrypi-setup/actions/workflows/main.yml/badge.svg)](https://github.com/atao/raspberrypi-setup/actions/workflows/main.yml)

This [Ansible](https://www.ansible.com/) playbook is designed to rapidly set up your Raspberry Pi.

It's compatible with all models. It has been successfully tested on multiple models, including the Pi Zero W, Pi Zero 2W, and Pi 4B, among others. The playbook should work well on both Debian and Debian-based distributions.

## Roles

Choose which components to install by using tags. Each tag installs specific packages and configurations :

#### Roles installation :

|Tag|Description|Notes|
| ------------- | ------------- | ------------- |
|**standard**, **std**|Core installation and configuration| [standard packages](roles/standard/vars/main.yml), [bashrc](roles/standard/tasks/main.yml), [vimrc](roles/standard/templates/vimrc.j2)|
|**ap**|start a hotspot when no Ethernet cable is plugged in|Useful for mobile use to access tools. &rarr; _[AP config file](roles/ap/vars/main.yml)_ (Access with ssh \$USER@10.0.0.1)|
|**display**|Configure display with [LCD-show](https://github.com/goodtft/LCD-show)|Need to modify [this file](roles/display/tasks/main.yml) to configure the correct display.|
|**docker**|Docker installation|Container runtime environment|
|**jackit**|[jackit](https://github.com/insecurityofthings/jackit) installation|Exploit Code for [Mousejack](https://bastille.net/research/vulnerabilities-mousejack/)
|~~**multitor**~~|~~install a proxy with multiple TOR instances with load-balancing ([trimstray/multitor](https://github.com/trimstray/multitor))~~|~~[Known issues](https://github.com/atao/raspberrypi-setup/blob/main/roles/multitor/README.md)~~|
|**tor**|Tor installation|See [README](roles/tor/README.md)|
|**rfid**|RFID tools installation|Tools ([libnfc](https://github.com/nfc-tools/libnfc), [mfoc](https://github.com/nfc-tools/mfoc), [mfcuk](https://github.com/nfc-tools/mfcuk)) and keys from [MifareClassicTool](https://github.com/ikarus23/MifareClassicTool/tree/master/Mifare%20Classic%20Tool/app/src/main/assets/key-files) &rarr; _See [Notes](roles/rfid/README.md)_|
|**sdr**|SDR tools installation|[rtl_433](https://github.com/merbanan/rtl_433), [rtl_sdr](https://github.com/merbanan/rtl_sdr)|
|**web**|Nginx and Certbot installation||
|**wifi**|Wifi and GPS tools installation|Wireless security testing and wardriving|

#### Containers installation :
|Tag|Description|Notes|
| ------------- | ------------- | ------------- |
|**jd2**|docker container for JDownloader 2 [jlesage/jdownloader-2](https://github.com/jlesage/docker-jdownloader-2)|See [Configuration tips'](roles/containers/README.md)|
|**portainer**|Portainer CE - a lightweight service delivery platform for containerized applications [portainer/portainer-ce](https://hub.docker.com/r/portainer/portainer-ce)|Containers manager|
|**proxy**|[Rotating Tor HTTP proxy container](https://github.com/zhaow-de/rotating-tor-http-proxy)|Provides one HTTP proxy endpoint with many concurrent tunnels to the Tor network. |

## Standalone

To setup directly from the Pi, run the following command :
Before run command you must setup your Pi with [Raspberry Pi Imager](https://www.raspberrypi.org/software/).

Next run command :

```
curl -s https://raw.githubusercontent.com/atao/raspberrypi-setup/main/install.sh | bash -s -- all
```

## Ansible

To setup run the following command :

```
git clone https://github.com/atao/raspberrypi-setup.git
cd raspberrypi-setup
sudo ansible-playbook playbook.yml -i hosts --tags all -K
```

List playbook tasks :
```
sudo ansible-playbook playbook.yml -i hosts --list-tasks
```

## Examples
Install only some tags :
```
curl -s https://raw.githubusercontent.com/atao/raspberrypi-setup/main/install.sh | bash -s -- standard,proxy,rfid,docker,web,jd2
```

## Debug
Yaml lint
```
yamllint playbook.yml roles/
```
Check syntax :
```
--syntax-check
```

--

Inspired from [geerlingguy / mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook) and [nico2che / mac-setup](https://github.com/nico2che/mac-setup)

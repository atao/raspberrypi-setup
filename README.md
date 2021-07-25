
[![Ansible Lint](https://github.com/atao/raspberrypi-setup/actions/workflows/main.yml/badge.svg)](https://github.com/atao/raspberrypi-setup/actions/workflows/main.yml)

# Raspberry Pi Zero W Setup

This is an [Ansible](https://www.ansible.com/) playbook to quickly setup my Raspberry Pi Zero W.

## Standalone

To setup directly from the Pi, run the following command :
Before run command you must setup your Pi with [Raspberry Pi Imager](https://www.raspberrypi.org/software/) and install git and ansible.

`apt update ; apt install git ansible`

Next run command :

```
curl -s https://raw.githubusercontent.com/atao/raspberrypi-setup/main/install.sh | /bin/bash
```
## Ansible

To setup run the following command :

`ansible-playbook playbook.yml -i hosts --ask-pass -u pi -k --tags all`

## Roles

You can choose what you want to install with tags :

- **setup** install standard packages
- **jackit** install [jackit](https://github.com/insecurityofthings/jackit) for exploit code for Mousejack
- **multitor** install a proxy with multiple TOR instances with load-balancing ([trimstray/multitor](https://github.com/trimstray/multitor))
- **rfid** install RFID tools for NFC (libnfc, mfoc, mfcuk)
- **hacking** install hacking tools like sqlmap and Wifi tools.


Inspired from [nico2che / mac-setup](https://github.com/nico2che/mac-setup)

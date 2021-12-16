
[![Ansible Lint](https://github.com/atao/raspberrypi-setup/actions/workflows/main.yml/badge.svg)](https://github.com/atao/raspberrypi-setup/actions/workflows/main.yml)

# Raspberry Pi Setup

This is an [Ansible](https://www.ansible.com/) playbook to quickly setup my Raspberry Pi.
Work with (B, B+, 2B, 3B, 3B+, 4B, Zero W, Zero 2W, 400)

Successfully tested with Pi Zero W, Pi Zero 2W and Pi 4B.

## Standalone

To setup directly from the Pi, run the following command :
Before run command you must setup your Pi with [Raspberry Pi Imager](https://www.raspberrypi.org/software/).

Next run command :

```
 curl -s https://raw.githubusercontent.com/atao/raspberrypi-setup/main/install.sh | bash -s -- all
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
- **wifi** install Wifi tools.

--

Inspired from [nico2che / mac-setup](https://github.com/nico2che/mac-setup)

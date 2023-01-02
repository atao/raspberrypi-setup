# Raspberry Pi Setup

[![YAML Lint](https://github.com/atao/raspberrypi-setup/actions/workflows/main.yml/badge.svg)](https://github.com/atao/raspberrypi-setup/actions/workflows/main.yml)

This is an [Ansible](https://www.ansible.com/) playbook to quickly setup my Raspberry Pi.
Work with (B, B+, 2B, 3B, 3B+, 4B, Zero W, Zero 2W, 400)

It should be working well on Debian distribution and Debian based distributions.

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
- **rfid** install RFID tools ([libnfc](https://github.com/nfc-tools/libnfc), [mfoc](https://github.com/nfc-tools/mfoc), [mfcuk](https://github.com/nfc-tools/mfcuk)) and keys from [MifareClassicTool](https://github.com/ikarus23/MifareClassicTool/tree/master/Mifare%20Classic%20Tool/app/src/main/assets/key-files)
- **wifi** install Wifi tools.
- **display** Configure my display with [LCD-show](https://github.com/goodtft/LCD-show)

_You will need to modify [this file](roles/display/tasks/main.yml) to configure the correct display._

For Examples you can install only :
```
 curl -s https://raw.githubusercontent.com/atao/raspberrypi-setup/main/install.sh | bash -s -- setup,multitor,rfid
```

--

Inspired from [nico2che / mac-setup](https://github.com/nico2che/mac-setup)

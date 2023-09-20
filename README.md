# Raspberry Pi Setup

[![YAML Lint](https://github.com/atao/raspberrypi-setup/actions/workflows/main.yml/badge.svg)](https://github.com/atao/raspberrypi-setup/actions/workflows/main.yml)

This [Ansible](https://www.ansible.com/) playbook is designed to rapidly set up your Raspberry Pi.

It's compatible with all models. It has been successfully tested on multiple models, including the Pi Zero W, Pi Zero 2W, and Pi 4B, among others. The playbook should work well on both Debian and Debian-based distributions.

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
ansible-playbook playbook.yml -i hosts --tags all
```

## Roles

You can choose what you want to install with tags :

- **setup** install standard packages
- **jackit** install [jackit](https://github.com/insecurityofthings/jackit) for exploit code for Mousejack
- **multitor** install a proxy with multiple TOR instances with load-balancing ([trimstray/multitor](https://github.com/trimstray/multitor)) -- [Know issues](https://github.com/atao/raspberrypi-setup/blob/main/roles/multitor/README.md)
- **rfid** install RFID tools ([libnfc](https://github.com/nfc-tools/libnfc), [mfoc](https://github.com/nfc-tools/mfoc), [mfcuk](https://github.com/nfc-tools/mfcuk)) and keys from [MifareClassicTool](https://github.com/ikarus23/MifareClassicTool/tree/master/Mifare%20Classic%20Tool/app/src/main/assets/key-files)
- **wifi** install Wifi and GPS tools for wardriving
- **display** configure my display with [LCD-show](https://github.com/goodtft/LCD-show)
- **docker** install Docker

_You will need to modify [this file](roles/display/tasks/main.yml) to configure the correct display._

For Examples you can install only :
```
 curl -s https://raw.githubusercontent.com/atao/raspberrypi-setup/main/install.sh | bash -s -- setup,multitor,rfid,docker
```

## Debug
```
ansible-lint playbook.yml
```
Run with option :
```
--syntax-check
```
If you test it in WSL run this command before :
```
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
sudo apt install curl
```
--

Inspired from [nico2che / mac-setup](https://github.com/nico2che/mac-setup)

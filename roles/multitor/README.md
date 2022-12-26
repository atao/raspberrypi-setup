**Issues with multitor**

See issues on project :
* [Multitor directory: ownership bug #3](https://github.com/trimstray/multitor/issues/3)
* [bad multitor directory owner #19](https://github.com/trimstray/multitor/issues/19)

`[!] bad multitor directory owner`

Run this :

`sudo chown debian-tor:debian-tor -R /var/lib/multitor`

---

**Issues with script check_multitor.py** ([Python Requests](https://requests.readthedocs.io/en/latest/))

[urllib3.exceptions.LocationParseError: Failed to parse #5476](https://github.com/psf/requests/issues/5476)

Fix with :

`python -m pip install six==1.15.0`

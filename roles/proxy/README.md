I chose to remove [multitor](../multitor/tasks/main.yml) from the project.
It's replaced by the "proxy" tag that will install Tor and others.

An alternative way to change your ip quickly, run commands :

```
watch python check_tor.py
watch -n 60 sudo service tor reload
```
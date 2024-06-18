I chose to remove [multitor](../multitor/tasks/main.yml) from the project.
It's replaced by the "proxy" tag that will install Tor.

An alternative way to change your ip quickly, run commands :

```
watch python check_tor.py
watch -n 60 sudo service tor reload
```

You can also install [Rotating Tor HTTP proxy container](https://github.com/zhaow-de/rotating-tor-http-proxy) with tag **proxy**.
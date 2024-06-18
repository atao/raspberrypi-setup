**Configuration**

Once the JDownloader container has been graphically launched for the first time and you've logged in to your [My-JDownloader](https://my.jdownloader.org/login.html) account.

Find informations
```bash
sudo docker ps -a
```
output :
```bash
CONTAINER ID   IMAGE                   COMMAND   CREATED         STATUS         PORTS                                        NAMES
9faa323f6f5f   jlesage/jdownloader-2   "/init"   3 minutes ago   Up 3 minutes   3129/tcp, 5900/tcp, 0.0.0.0:5800->5800/tcp   jdownloader-2
```

Stop the container
```bash
sudo docker stop <ID>
```

Change the [main.yml](container/tasks/main.yml) file as follows:

```YAML
auto_remove: false
"JDOWNLOADER_HEADLESS": "1"
```

Run the playbook again with the jd2 tag, to create the container once more.

```bash
ansible-playbook playbook.yml -i hosts --tags jd2
```

Now you can start and stop it, but your My-JDownloader account will always be present at each launch.

```bash
sudo docker start <ID>
sudo docker stop <ID>
```

The container may take some time to appear in My-JDownloader's interface.

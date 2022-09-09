#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests
from lxml import html

proxies = {"http": "socks5://localhost:9000", "https": "socks5://localhost:9000"}

r = requests.Session()
r.proxies.update(proxies)
try:
    response = r.get("https://check.torproject.org", proxies=proxies)
except Exception as e:
    print(e)
    exit(2)

if response.status_code == 200:
    tree = html.fromstring(response.text)
    data = tree.xpath('//div[@class="content"]')
    for p in data:
        print(p.xpath('.//h1/text()')[0].strip())
        print(p.xpath('.//p/text()')[0],p.xpath('.//p/strong/text()')[0])
else:
    print("Request error")
    exit(2)
    

#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests
from lxml import html

proxies = {"http": "socks5://localhost:9000", "https": "socks5://localhost:9000"}
# proxies = set()

r = requests.Session()
r.proxies.update(proxies)
response = r.get("https://check.torproject.org", proxies=proxies)
tree = html.fromstring(response.text)
data = tree.xpath('//div[@class="content"]')
for p in data:
    print(p.xpath('.//h1/text()')[0].strip())
    print(p.xpath('.//p/text()')[0],p.xpath('.//p/strong/text()')[0])
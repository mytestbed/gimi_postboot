#!/bin/bash

# Upgrade RC to latest
gem install omf_rc --no-ri --no-rdoc

# Touch topology file
echo "
192.168.1.8
192.168.1.9
" > /etc/topology.txt

# Patch RC config
echo "
---
uri: amqp://gimi3.casa.umass.edu
environment: production
debug: false
resources:
- type: node
  uid: $host-$slice

add_default_factories: false

factories:
  load: [
    'omf_rc/resource_proxy/node',
    'omf_rc/resource_proxy/net',
    'omf_rc/resource_proxy/wlan',
    'omf_rc/resource_proxy/application'
  ]
  defaults:
    node:
      topo_file: '/etc/topology.txt'

instrumentation:
   oml-domain: 'omf_rc_edges'
   oml-collect: 'tcp:srv.mytestbed.net:3003'
" > /etc/omf_rc/config.yml

# Ansible Consul Role


## Installation

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```yml
---
consul_version: 1.0.3

```

An instance might be defined through:

```yml
# enable ui
consul_is_ui: true
# start as a server
consul_is_server: true
# name datacenter
consul_datacenter: test
# bootstrap
consul_bootstrap: true
# name the node
consul_node_name: vagrant
# bind to ip
consul_bind_address: "{{ ansible_default_ipv4['address'] }}"
# encrypt using string from consul keygen
consul_encrypt: "X4SYOinf2pTAcAHRhpj7dA=="
```

## Enable TLS encryption

See [https://www.consul.io/docs/agent/encryption.html](https://www.consul.io/docs/agent/encryption.html) for details.

These files will be created on your Consul host:

```yml
consul_cert_file: "{{ consul_home }}/cert/consul.crt"
consul_key_file: "{{ consul_home }}/cert/consul.key"
consul_ca_file: "{{ consul_home }}/cert/ca.crt"
```

When you provide these vars. You should use Ansible Vault to encrypt these vars or perhaps pass them on the command line.


## Telemetry Variables
Consul has excellent [telemetry support](https://www.consul.io/docs/agent/telemetry.html). To enable it, use any of the following variables:

```yml
# if you want Consul to send metrics to a statsd instance
consul_statsd_address: "127.0.0.1:8125"
```

## DNS Variables
Consul provides the ability to use it as a [DNS resolver](https://www.consul.io/docs/agent/dns.html) for service and node lookups. To enable [dns_config](https://www.consul.io/docs/agent/options.html#dns_config) with the below default values, set the `consul_dns_config` variable to `true`

```yml
consul_dns_allow_stale: false
consul_recursors:
  - 8.8.8.8
  - 8.8.4.4
```
## Cross-origin Resource Sharing
Consul allows adding headers to the HTTP API responses, to enable [CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) set the `consul_cors_support` variable to `true`

```yml
consul_cors_support: true
```
## Shutdown behavior
Consul may be configured to perform (or not) cluster leave when it recieves TERM/INT signals.


## Handlers


## Example to register consul services


## Testing



## Contributing


## License
Copyright (c) Matthew Finlayson under the Apache license.

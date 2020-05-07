[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-prometheus.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-prometheus)
# Ansible role `prometheus`

An Ansible role for install prometheus. Specifically, the responsibilities of this role are to:

- install and configure prometheus

## Requirements

- Ansible 2.9+

## Role Variables

| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `openio_prometheus_namespace` | `"{{ namespace \| d('OPENIO') }}"` | OpenIO Namespace |
| `openio_prometheus_maintenance_mode` | `"{{ openio_maintenance_mode \| d(false) }}"` | Maintenance mode |
| `openio_prometheus_bind_address` | `"{{ openio_bind_mgmt_address \| d(ansible_default_ipv4.address) }}"` | Binding IP address |
| `openio_prometheus_bind_port` | `6900` | Binding port |
| `openio_prometheus_log_level` | `"info"` | Log level |
| `openio_prometheus_storage_rentention` | `"30d"` | Storage retention |
| `openio_prometheus_scrape_interval` | `"10s"` | Scrape interval |
| `openio_prometheus_scrape_timeout` | `"10s"` | Scrape Timeout |
| `openio_prometheus_netdata_enabled` | `true` | Scrape netdata ? |
| `openio_prometheus_netdata_group` | `"netdata"` | Netdata group in the inventory |
| `openio_prometheus_netdata_bind_port` | `6921` | Port to use if `openio_netdata_bind_port` is not defined for the target |
| `openio_prometheus_netdata_interval` | `"{{ openio_prometheus_scrape_interval }}"` | Specific scrape interval |
| `openio_prometheus_oio_exporter_enabled` | `true` | Scrape oio-exporter ? |
| `openio_prometheus_oio_exporter_group` | `"oio_exporter"` | Oio-exporter group in the inventory|
| `openio_prometheus_oio_exporter_bind_port` | `6920` | Port to use if `openio_oio_exporter_bind_port` is not defined for the target |
| `openio_prometheus_oio_exporter_interval` | `"{{ openio_prometheus_scrape_interval }}"` | Specific scrape interval |
| `openio_prometheus_alertmanager_enabled` | `true` | Scape alertmanager ? |
| `openio_prometheus_alertmanager_group` | `"alertmanager"` | Alertmanager group in the inventory |
| `openio_prometheus_alertmanager_bind_port` | `6902` | Port to use if `openio_alertmanager_bind_port` is not defined for the target |

## Dependencies
- https://github.com/open-io/ansible-role-openio-service

## Example Playbook

```yaml
- hosts: all
  gather_facts: true
  become: true

  tasks:
    - include_role:
        name: prometheus
```

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section.

Pull requests are also very welcome.
The best way to submit a PR is by first creating a fork of this Github project, then creating a topic branch for the suggested change and pushing that branch to your own fork.
Github can then easily create a PR based on that branch.

## License
Copyright (C) 2015-2020 OpenIO SAS

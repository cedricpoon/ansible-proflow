# proflow
![build-deploy](https://github.com/cedricpoon/ansible-proflow/workflows/build-deploy/badge.svg)
![lint](https://github.com/cedricpoon/ansible-proflow/workflows/lint/badge.svg)

Currently Ansible does not contain any kind of conventions for role provisioning / deprovisioning, which leads to either fragmented adoption, or simply no support, on the mentioned flow control.

This collection aims to regulate ansible role on provisioning flow for different states (i.e. provision as present and deprovision as absent).

## Philosophy
An `EXTRA_VARS` naming `state` will be used in any custom playbook for signposting the provisioning flow among roles

### `state=present`
This will serve as positive flow for role provisioning. It is also a default state for the role which applied proflow.

### `state=absent`
This will serve as negative flow for role de-provisioning. Optional.

## Usage
### Installation
```sh
ansible-galaxy collection install cedricpoon.proflow
```

### Applying via `apply.yml`
```sh
ansible-playbook /directory/to/collection/cedricpoon/proflow/apply.yml
```
#### `EXTRA_VARS` in `apply.yml`
| Variable  | Description                                                                            | Default | Remarks                                                                       |
|-----------|----------------------------------------------------------------------------------------|---------|-------------------------------------------------------------------------------|
| `current` | Indicates whenever `main.yml` applies to current working directory or roles underneath | `yes`   | -                                                                             |
| `targets` | A list for remote role folders for applying `main.yml`                                 | `[]`    | Empty list for applying to all role folders. Only used when `current == 'no'` |

## API
Proflow will provide and maintain a standardized `main.yml` through playbook `apply.yml`. You need to maintain `main.xxx.yml` for subscription to different provision approaches (e.g. present). All `main.xxx.yml` should be lazily loaded by proflow's `main.yml` (i.e. Not loaded not running without exceptions, if file not exists).

| File             | Description                         |
|------------------|-------------------------------------|
| `main.present.yml` | Positively provisioning the role    |
| `main.absent.yml`  | Negatively de-provisioning the role |

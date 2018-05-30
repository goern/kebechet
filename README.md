Kebechet
--------

I'm Kebechet, goddess of freshness. I will keep your dependencies fresh and up-to-date.



# Deploying the Bot

## Prerequisites

A SSH key pair at `kebechet_github`, create it using something like `ssh-keygen -C "Kebechet's SSH key for GitHub" -f kebechet_github -N ''`.

A config file at `config/thoth.yaml`.

## Deploy

```shell
ansible-playbook \
    --extra-vars=THOTH_FRONTEND_NAMESPACE=aicoe-prod-bots \
    --extra-vars=THOTH_INFRA_NAMESPACE=aicoe-prod-bots \
    --extra-vars=GITHUB_AUTH_TOKEN=123ganzviele \
    playbooks/provision.yaml`
```

## Verify the Deployment

`ansible-playbook --extra-vars=THOTH_FRONTEND_NAMESPACE=aicoe-prod-bots playbooks/validate.yaml `
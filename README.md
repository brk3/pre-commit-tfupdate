# Overview

This repo contains a pre-commit hook for [tfupdate](https://github.com/minamijoyo/tfupdate), similar
to what's offered by [antonbabenko/pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform).

It allows for *auto update of modules and non core providers*, both of which are a limitation in
`tfupdate` (https://github.com/minamijoyo/tfupdate/issues/65) and hence [antonbabenko/pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform).

# Usage

### Providers

Assume you have a terraform config with the following:
```
terraform {
  required_version = "1.4.6"

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.2.0"
    }
  }
}
```

To update this to the latest verison of `mrparkers/keycloak`, place the
following in your `.pre-commit-config.yaml`:

```
- repo: https://github.com/brk3/pre-commit-tfupdate
  rev: 0.0.2
  hooks:
    - id: tfupdate
      name: Auto update mrparkers/keycloak provider
      args: [tfregistryProvider, provider, mrparkers/keycloak, keycloak]
```

### Modules

Assume you have a terraform config with the following:
```
module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "3.1.0"

  ...
}
```

To update this to the latest version of `terraform-aws-modules/rds/aws`, place
the following in your `.pre-commit-config.yaml`:

```
- repo: https://github.com/brk3/pre-commit-tfupdate
  rev: 0.0.2
  hooks:
    - id: tfupdate
      name: Auto update terraform-aws-modules/rds/aws module
      args: [tfregistryModule, module, terraform-aws-modules/rds/aws, terraform-aws-modules/rds/aws]
```

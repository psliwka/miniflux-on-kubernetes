Miniflux on Kubernetes
======================

Bootstrap
---------

* Go to https://kubesail.com/ and create and account
* Request your domain validation at https://kubesail.com/domains
* Make sure that values in [terraform.tfvars](terraform.tfvars) are correct for your setup
* Run `terraform init && terraform apply`
* Init DB credentials: `kubectl create secret generic postgres --from-literal=password=$(pwgen -s 20 1)`
* Deploy Postgres: `kubectl apply -f postgres.yaml`

TODOs
-----

* Configure quotas

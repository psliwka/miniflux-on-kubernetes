Miniflux on Kubernetes
======================

Bootstrap
---------

* Go to https://kubesail.com/ and create and account
* Request your domain validation at https://kubesail.com/domains
* Make sure that values in [terraform.tfvars](terraform.tfvars) are correct for your setup
* Run `terraform init && terraform apply`
* Configure your `kubectl` to use https://kubesail.com/config
* Init DB credentials: `kubectl create secret generic postgres --from-literal=password=$(pwgen -s 20 1)`
* Deploy Postgres: `kubectl apply -f postgres.yaml`
* Deploy Miniflux: `kubectl apply -f miniflux.yaml`

Decommissioning
---------------

```sh
kubectl delete -f miniflux.yaml -f postgres.yaml
kubectl delete secret postgres
terraform destroy
```

TODOs
-----

* Configure quotas

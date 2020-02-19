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
* Restore DB backup, should you have any
* Deploy Miniflux: `kubectl apply -f miniflux.yaml`

Restoring backup
----------------

```sh
kubectl cp backup.sql postgres-xxxxxxxxxx-xxxxx:/tmp/
kubectl exec postgres-xxxxxxxxxx-xxxxx -it -- psql -U miniflux -d miniflux2 -f /tmp/backup.sql
```

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

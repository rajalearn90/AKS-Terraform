1) Create key vault
2) Create service principle and get the client id, secret, object Id
3) Ceate the secrets in the Kay vault to store the above Id's and secret
4) Create the ssh key and add that as well to the Kay vault
5) Provide access to the key_vault for the Service principle created above (also provide access to the admin user as well)
Above all using the Power shell except the Service Principle creation

6) Then create the Terrafrom script to automate the cluster creation and add the service principle to the Cluster

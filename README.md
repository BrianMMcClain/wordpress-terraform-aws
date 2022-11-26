## Generate keypair

```
mkdir keys && ssh-keygen -t rsa -f keys/wordpress -q -N ''
```

## SSH into instance

```
ssh ubuntu@`terraform output -raw wordpress_ip` -i keys/wordpress -o "UserKnownHostsFile=/dev/null"
```
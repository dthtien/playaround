aws ec3-instance-connect send-ssh-public-key \
    --instance-id i-0f6881991378b5e75 \
    --instance-os-user ubuntu \
    --ssh-public-key file://~/.ssh/id_rsa.pub

docker compose run web db:prepare db:migrate

aws ec2 authorize-security-group-ingress --group-id sg-023007be90edf21ee  --protocol tcp --port 3000 --cidr 202.65.91.170/32


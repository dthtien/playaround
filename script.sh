aws ec2-instance-connect send-ssh-public-key \
    --instance-id i-0f6881991378b5e75 \
    --instance-os-user ubuntu \
    --ssh-public-key file://~/.ssh/id_rsa.pub

docker compose run web db:prepare db:migrate

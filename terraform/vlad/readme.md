# volterra skg example from vlad
<!-- markdownlint-disable no-inline-html -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-enable no-inline-html -->


## troubleshooting

Saw where the terraform destroy would fail, due to deleting resources out of order.
requires manual removal of IGW, and configmaps from terraform statefile.

```bash
#https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html
aws configure
output=json
#https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-vpcs.html
aws ec2 describe-vpcs | jq .Vpcs[].VpcId
#https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-internet-gateways.html
aws ec2 describe-internet-gateways | jq .InternetGateways[].InternetGatewayId
#https://docs.aws.amazon.com/cli/latest/reference/ec2/detach-internet-gateway.html
aws ec2 detach-internet-gateway --internet-gateway-id igw-075613734354e65bf --vpc-id vpc-016099c773a747475
#https://docs.aws.amazon.com/cli/latest/reference/ec2/delete-internet-gateway.html
aws ec2 delete-internet-gateway --internet-gateway-id igw-075613734354e65bf
```

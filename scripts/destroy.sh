#!/bin/bash

eksctl delete cluster \
--name talentsphere-eks \
--region us-east-1

cd terraform

terraform destroy -auto-approve

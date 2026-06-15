#!/bin/bash

eksctl utils associate-iam-oidc-provider \
--cluster talentsphere-eks \
--approve

eksctl create addon \
--name aws-ebs-csi-driver \
--cluster talentsphere-eks \
--force

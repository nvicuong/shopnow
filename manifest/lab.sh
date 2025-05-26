eksctl --profile mfa create cluster --name shopnow-cluster --region ap-southeast-1 --without-nodegroup

aws --profile mfa eks update-kubeconfig --region ap-southeast-1 --name shopnow-cluster

kubectl config use-context shopnow-cluster

kubectl cluster-info

eksctl --profile mfa create nodegroup --cluster=shopnow-cluster --region=ap-southeast-1 --name=my-node-group --node-type=t3.medium --nodes=2 --nodes-min=2 --nodes-max=2 --managed

kubectl get nodes

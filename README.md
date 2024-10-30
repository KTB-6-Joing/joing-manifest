# joing-manifest

## helm 설치 목록

- [metrics-server](https://artifacthub.io/packages/helm/metrics-server/metrics-server)
- [nginx ingress controller](https://docs.nginx.com/nginx-ingress-controller/installation/installing-nic/installation-with-helm/) -> AWS ALB
- [aws ingress controller](https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/lbc-helm.html), [github repo](https://github.com/aws/eks-charts/blob/master/stable/aws-load-balancer-controller/README.md)
  - --set vpcId=... 직접 설정

## manifest 설치 목록

- [jenkins](https://www.jenkins.io/doc/book/installing/kubernetes)

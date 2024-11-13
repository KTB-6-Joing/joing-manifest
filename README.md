# joing-manifest

## helm 설치 목록

- [metrics-server](https://artifacthub.io/packages/helm/metrics-server/metrics-server)
- [nginx ingress controller](https://docs.nginx.com/nginx-ingress-controller/installation/installing-nic/installation-with-helm/) -> AWS ALB로 대체
- [aws ingress controller](https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/lbc-helm.html), [github repo](https://github.com/aws/eks-charts/blob/master/stable/aws-load-balancer-controller/README.md)
  - --set vpcId=... 직접 설정
- [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)
  - monitoring ns에 설치
  - helm install prometheus-stack prometheus-community/kube-prometheus-stack -n monitoring
- [argocd](https://artifacthub.io/packages/helm/argo/argo-cd)
  - helm install argo-cd argo/argo-cd --version 7.7.1 -n argocd

## manifest 설치 목록

- [jenkins](https://www.jenkins.io/doc/book/installing/kubernetes)
- [cluster-autoscaler](https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/autoscaling.html)
  - jenkins agent spot instance 활용
    - stateless
    - 비용 절감
    - Kaniko 활용으로 DinD, Docker 종속 문제 해결

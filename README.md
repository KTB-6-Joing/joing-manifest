# joing-manifest

## helm 설치 목록

- [metrics-server](https://artifacthub.io/packages/helm/metrics-server/metrics-server)
- [nginx ingress controller](https://docs.nginx.com/nginx-ingress-controller/installation/installing-nic/installation-with-helm/) -> AWS ALB로 대체
- [aws ingress controller](https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/lbc-helm.html), [github repo](https://github.com/aws/eks-charts/blob/master/stable/aws-load-balancer-controller/README.md)
  - --set vpcId=... 직접 설정
- [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)
  - monitoring ns에 설치
  - `helm install prometheus-stack prometheus-community/kube-prometheus-stack -n monitoring`
- [argocd](https://artifacthub.io/packages/helm/argo/argo-cd)
  - `helm install argo-cd argo/argo-cd --version 7.7.1 -n argocd`
  - 대상 그룹 헬스체크 HTTPS -> HTTP 로드밸런서로 ELB 설정
  - [argocd-image-updater](https://argocd-image-updater.readthedocs.io/en/stable/install/installation/#method-1-installing-as-kubernetes-workload-in-argo-cd-namespace) 추가 설치
- [loki-stack](https://artifacthub.io/packages/helm/grafana/loki-stack)
  - `helm install loki-stack grafana/loki-stack --values ./loki-stack/values.yaml -n monitoring`
  - efk에서 elasticsearch가 최소 1.3Gi 이상의 메모리 소모
    - 기존 사용하는 grafana 재활용 + loki&fluent-bit로 리소스 최적화
    - grafana 활용을 위해 monitoring ns에 설치

## manifest 설치 목록

- [jenkins](https://www.jenkins.io/doc/book/installing/kubernetes)
  - jenkins agent spot instance 활용
    - stateless
    - 비용 절감
    - Kaniko 활용으로 DinD, Docker 종속 문제 해결
- [cluster-autoscaler](https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/autoscaling.html)
  - [Migrating from Cluster Autoscaler](https://karpenter.sh/docs/getting-started/migrating-from-cas/#remove-cas)
    - 리소스 과사용으로 보류

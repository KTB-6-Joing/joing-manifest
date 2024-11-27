### 초기 EFK 스택으로 로그 수집 계획

- ElasticSearch의 메모리 사용량 과부하 + FluentBit 활용으로도 감당이 어려움
- 이미 Prometheus + Grafana를 활용하고 있음

## Loki 활용

- 로그 수집에 필요한 리소스만 활용 가능 (검색 불필요)
- GUI (Kibana) Grafana 활용으로 리소스 최적화 가능
- Loki와 호환성이 높은 Promtail도 고려했지만 리소스 최적화가 목표이므로 FluentBit 활용 예정

### loki-stack

- loki와 promtail, fluentbit, filebeat부터 grafana까지 연동이 가능한 helm chart
- 기존 grafana 활용으로 loki와 fluentbit만 설정
- elasticserarch - 1.3Gi 이상 -> loki-stack - 100Mi 이하

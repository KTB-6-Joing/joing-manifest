### 초기 EFK 스택으로 로그 수집 계획

- ElasticSearch의 메모리 사용량 과부하 + FluentBit 활용으로도 감당이 어려움
- 이미 Prometheus + Grafana를 활용하고 있음

## Loki 활용

- 로그 수집에 필요한 리소스만 활용 가능 (검색 불필요)
- GUI (Kibana) Grafana 활용으로 리소스 최적화 가능
- Loki와 호환성이 높은 Promtail 활용
- 추후 리소스 사용량 최적화를 위해 FluentBit 활용 예정

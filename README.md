# Observability Stack — Prometheus, Grafana & CloudWatch

A full observability stack combining Prometheus, Grafana, Alertmanager, and AWS CloudWatch to monitor infrastructure health, application metrics, and log patterns. Built custom dashboards and alerting rules simulating real-world reliability monitoring for deployment health visibility.

## Stack Overview

```
┌──────────────────────────────────────────────────┐
│                    Grafana :3000                  │
│            (Dashboards & Visualization)           │
└─────────────────────┬────────────────────────────┘
                      │ queries
          ┌───────────┴──────────┐
          │                      │
┌─────────▼────────┐   ┌────────▼────────┐
│   Prometheus     │   │  AWS CloudWatch  │
│   :9090          │   │  (custom metrics)│
└─────────┬────────┘   └─────────────────┘
          │ scrapes
  ┌───────┴────────────────┐
  │                        │
┌─▼──────────┐   ┌────────▼──────┐
│ Node       │   │ App Endpoints │
│ Exporter   │   │ (custom /metrics)|
│ :9100      │   └───────────────┘
└────────────┘
          │ alerts
┌─────────▼────────┐
│  Alertmanager    │
│  :9093           │
│  → Email / Slack │
└──────────────────┘
```

## Repo Structure

```
observability-stack/
├── prometheus/
│   ├── prometheus.yml          # Main Prometheus config
│   ├── rules/                  # Alerting rules
│   └── targets/                # Static scrape targets
├── grafana/
│   ├── dashboards/             # Pre-built dashboard JSON
│   └── datasources/            # Datasource provisioning
├── alertmanager/
│   └── alertmanager.yml        # Alert routing config
├── cloudwatch/
│   └── cloudwatch-agent.json   # CloudWatch agent config
├── docker/
│   └── docker-compose.yml      # Full stack deployment
└── scripts/
    ├── setup.sh                # One-command stack setup
    └── simulate-load.sh        # Load simulation for testing alerts
```

## Quick Start

```bash
# Clone and start the full stack
git clone https://github.com/dtighiltferhat/observability-stack
cd observability-stack

# Start all services
docker compose -f docker/docker-compose.yml up -d

# Access dashboards
# Grafana:      http://localhost:3000  (admin/admin)
# Prometheus:   http://localhost:9090
# Alertmanager: http://localhost:9093
```

## Dashboards Included

| Dashboard | Metrics Covered |
|---|---|
| Infrastructure Overview | CPU, memory, disk, network per node |
| Application Health | Request rate, latency, error rate, pod count |
| Deployment Status | Pod restarts, rollout status, replica health |
| Alert Overview | Active alerts, firing history, silence management |

## Alerting Rules

| Alert | Condition | Severity |
|---|---|---|
| HighCPU | CPU > 80% for 5m | warning |
| CriticalCPU | CPU > 95% for 2m | critical |
| PodCrashLooping | restart count > 5 in 10m | critical |
| APIEndpointDown | endpoint unreachable for 1m | critical |
| HighMemory | memory > 85% for 5m | warning |

## Author

**Djamal Tighilt Ferhat** — DevOps & Cloud Engineer
[github.com/dtighiltferhat](https://github.com/dtighiltferhat)

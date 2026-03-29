#!/bin/bash
# scripts/simulate-load.sh
# Simulates CPU/memory load to test alerting rules

set -e

DURATION=${1:-60}  # seconds
echo "Simulating load for ${DURATION} seconds to trigger alerts..."
echo "Watch Prometheus at http://localhost:9090/alerts"
echo "Watch Grafana at http://localhost:3000"
echo ""

# CPU load — spawn one process per core
CPU_CORES=$(nproc)
echo "Spawning ${CPU_CORES} CPU stress processes..."
for i in $(seq 1 $CPU_CORES); do
    yes > /dev/null &
done

# Wait for duration
sleep "$DURATION"

# Kill all yes processes
echo "Stopping load simulation..."
pkill -f "yes" || true
echo "Done. Check Alertmanager at http://localhost:9093 for fired alerts."

#!/bin/bash
# Deploy all 10 EventBridge rules for T4H Autonomous OS
# Run from any terminal with AWS CLI + admin access

aws cloudformation deploy \
  --stack-name t4h-eventbridge \
  --template-file "$(dirname "$0")/t4h-eventbridge.yaml" \
  --region ap-southeast-2

echo ""
echo "Deployed 10 EventBridge rules:"
echo "  t4h-daily-harvest      → autonomy-controller    (6:00am AEST daily)"
echo "  t4h-hourly-govern      → autonomy-controller    (every hour)"
echo "  t4h-dataops-daily      → autonomy-worker-dataops (6:30am AEST)"
echo "  t4h-financeops-daily   → autonomy-worker-financeops (7:00am AEST)"
echo "  t4h-taskops-daily      → autonomy-worker-taskops (7:30am AEST)"
echo "  t4h-websiteops-daily   → autonomy-worker-websiteops (8:00am AEST)"
echo "  trojanoz-governor-hourly → trojanoz-governor    (every 2h)"
echo "  trojanoz-scorer-daily  → trojanoz-scoring-agent (9:00am AEST)"
echo "  t4h-signal-ingest      → t4h-ingest-signal      (every 30 min)"
echo "  holoorg-harvest-daily  → holoorg-signal-harvester (5:00am AEST)"


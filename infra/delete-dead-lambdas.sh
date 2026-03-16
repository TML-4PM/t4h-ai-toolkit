#!/bin/bash
# BATCH DELETE: 37 dead/stub Lambda functions (tiny stubs, pre-2026-01-01)
REGION="ap-southeast-2"
for fn in mcp-bridge-drive mcp-bridge-gmail mcp-bridge-calendar mcp-bridge-gpt mcp-bridge-notion troy-social-analytics troy-research-hub troy-content-archive troy-compliance-scanner troy-dash-live troy-portfolio-sync troy-metrics-collector troy-market-intel troy-screenshot troy-gpt-proxy troy-code-deployer intel-deepmind intel-figure-ai intel-spacex intel-synchron supabase-sql master-intelligence-orchestrator motherbox-worker motherbox-worker-gpt gcbat-intelligence fleet-commander bridge bridge-automations eventbridge-manager spm-get-drills spm-submit-artefact spm-builder-register spm-issue-credential spm-verify-credential oaft-metrics oaft-upload; do
  echo -n "  Deleting $fn... "
  aws lambda delete-function --function-name "$fn" --region $REGION 2>&1 && echo "OK" || echo "SKIP"
done
echo "Done."

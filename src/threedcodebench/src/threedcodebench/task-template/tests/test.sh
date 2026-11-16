#!/bin/bash
# Re-executes the agent's script in a fresh Blender process and scores it with
# the upstream 3DCodeBench helpers (see evaluate.py).
#   /logs/verifier/reward.txt    executability (0 or 1)
#   /logs/verifier/metrics.json  per-stage statuses + Chamfer distances
mkdir -p /logs/verifier

blender-python /tests/evaluate.py --instance "{{INSTANCE}}"
rc=$?

if [ ! -s /logs/verifier/reward.txt ]; then
  echo 0 > /logs/verifier/reward.txt
fi
exit $rc

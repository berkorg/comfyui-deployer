#!/bin/bash

# Must exit and fail to build if any command fails
set -eo pipefail

source /opt/ai-dock/bin/build/layer0/common.sh

source /opt/ai-dock/bin/build/layer0/nvidia.sh

source /opt/ai-dock/bin/build/layer0/clean.sh
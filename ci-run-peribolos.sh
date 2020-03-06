#/usr/bin/env sh

set -euo pipefail

cd $(go env GOPATH)/src/k8s.io/test-infra/prow/cmd/peribolos
go build .

./peribolos --github-endpoint=http://ghproxy --github-endpoint=https://api.github.com --github-token-path=/etc/github/oauth --config-path=$(go env GOPATH)/src/github.com/loodse-labs/limitcheck/loodse.yaml \
--fix-org --fix-org-members --fix-teams --fix-team-members --required-admins=scheeles --required-admins=fairhaven --required-admins=kubermatic-bot --tokens=1200 # --confirm

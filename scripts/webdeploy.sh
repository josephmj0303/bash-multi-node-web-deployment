
---

# `scripts/webdeploy.sh` (Portfolio-Cleaned)

```bash
#!/bin/bash
set -e
set -o pipefail

USR="devops"
HOSTS_FILE="inventory/remhosts"
SCRIPT="scripts/multios_websetup.sh"

for host in $(cat $HOSTS_FILE); do
    echo "=============================================="
    echo "Deploying to $host"

    scp $SCRIPT $USR@$host:/tmp/

    ssh $USR@$host sudo bash /tmp/multios_websetup.sh

    ssh $USR@$host sudo rm -f /tmp/multios_websetup.sh

    echo "Deployment completed on $host"
    echo "=============================================="
done

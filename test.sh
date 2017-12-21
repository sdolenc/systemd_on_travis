#!/bin/bash
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

# Determine the appropriate github branch to clone using Travis environment variables
BRANCH=${TRAVIS_PULL_REQUEST_BRANCH:-$TRAVIS_BRANCH}
echo "BRANCH=$BRANCH"

docker exec -i stepdo0 /bin/bash -s <<EOF

# Rely on command's return result
set -ex

systemctl > /dev/null && echo "success!"

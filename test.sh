#!/usr/bin/env bash
# Licensed under the MIT license. See LICENSE file on the project webpage for details.

# Determine the appropriate github branch to clone using Travis environment variables
BRANCH=${TRAVIS_PULL_REQUEST_BRANCH:-$TRAVIS_BRANCH}
echo "BRANCH=$BRANCH"

# Connect to container
docker exec -i stepdo0 /bin/bash -s <<EOF

echo

# test systemd
if systemctl > /dev/null ; then
    echo "success: has systemd"d
else
    echo "FAILURE: no systemd"
    exit 1
fi

echo

# test networking
apt update
if apt-get clean; apt-get -d --reinstall install apt | grep "Download complete" ; then
    echo "success: has networking"
else
    echo "FAILURE: no networking"
    exit 1
fi

EOF

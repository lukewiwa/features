#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "args" cat /usr/local/share/wait-for-it-entrypoint.sh | grep 'wait-for-it.sh --host=localhost --port=80 --timeout=1 --strict'

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults

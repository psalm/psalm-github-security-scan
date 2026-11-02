ARG PSALM_VERSION=latest

# The general Psalm action (https://github.com/psalm/psalm-github-actions) with the security scan's defaults
FROM ghcr.io/psalm/psalm-github-actions:${PSALM_VERSION}

LABEL "repository"="https://github.com/psalm/psalm-github-security-scan"

ENV INPUT_SECURITY_ANALYSIS=true \
    INPUT_COMPOSER_REQUIRE_DEV=true \
    INPUT_REPORT_FILE=results.sarif

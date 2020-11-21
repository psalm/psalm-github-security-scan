#!/bin/sh -l
set -e

REPORT_FILE="results.sarif"
if [ ! -z "$INPUT_REPORT_FILE" ]; then
    REPORT_FILE="$INPUT_REPORT_FILE"
fi

if test -f "composer.json"; then
    IGNORE_PLATFORM_REQS=""
    if [ "$CHECK_PLATFORM_REQUIREMENTS" = "false" ] || [ "$INPUT_COMPOSER_CHECK_PLATFORM_REQUIREMENTS" = "false" ]; then
        IGNORE_PLATFORM_REQS="--ignore-platform-reqs"
    fi

    NO_DEV="--no-dev"
    if [ "$REQUIRE_DEV" = "true" ] || [ "$INPUT_COMPOSER_REQUIRE_DEV" = "true"  ]; then
        NO_DEV=""
    fi

    COMPOSER_COMMAND="composer install --no-scripts --no-progress $NO_DEV $IGNORE_PLATFORM_REQS"
    echo "::group::$COMPOSER_COMMAND"
    $COMPOSER_COMMAND
    echo "::endgroup::"
else 
    echo "composer.json not found in repo, skipping Composer installation"
fi

/composer/vendor/bin/psalm --version
/composer/vendor/bin/psalm --output-format=github --taint-analysis --report=$REPORT_FILE $*

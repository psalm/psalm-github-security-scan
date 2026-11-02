# Psalm Github Security Scan

Run [Psalm’s Security Analysis](https://psalm.dev/docs/security_analysis/) as a Github action and send its results to GitHub code scanning.

This is the [general Psalm action](https://github.com/psalm/psalm-github-actions) with `security_analysis: true`, `composer_require_dev: true` and `report_file: results.sarif` preset, and accepts all of its inputs.

```yaml
name: Psalm Security Scan

on: [push, pull_request]

jobs:
  psalm-security-scan:
    name: Psalm
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Psalm Security Scan
        uses: docker://ghcr.io/psalm/psalm-security-scan

      - name: Import Security Analysis results into GitHub Security Code Scanning
        uses: github/codeql-action/upload-sarif@v3
        with:
          sarif_file: results.sarif
```

## Specify Psalm version

You can also specify a version, including the latest alpha/beta/rc. `latest` is the latest stable release (Psalm 7).

```diff
-        uses: docker://ghcr.io/psalm/psalm-security-scan
+        uses: docker://ghcr.io/psalm/psalm-security-scan:7.0.0
```

To stay on Psalm 6:

```diff
-        uses: docker://ghcr.io/psalm/psalm-security-scan
+        uses: docker://ghcr.io/psalm/psalm-security-scan:6.20.6
```

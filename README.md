# Psalm Github Security Scan

Run [Psalm’s Security Analysis](https://psalm.dev/docs/security_analysis/) as a Github action (a more general version [can be found here](https://github.com/psalm/psalm-github-actions)).

```yaml
name: Psalm Security Scan

on: [push, pull_request]

jobs:
  psalm-security-scan:
    name: Psalm
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Psalm Security Scan
        uses: docker://ghcr.io/psalm/psalm-security-scan
        
      - name: Import Security Analysis results into GitHub Security Code Scanning
        uses: github/codeql-action/upload-sarif@v2
        with:
          sarif_file: results.sarif
```

## Specify Psalm version

You can also specify a version.

```diff
-        uses: docker://ghcr.io/psalm/psalm-security-scan
+        uses: docker://ghcr.io/psalm/psalm-security-scan:5.7.7
```

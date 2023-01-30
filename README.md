# Psalm Github Security Scan

Run [Psalm’s Security Analysis](https://psalm.dev/docs/security_analysis/) as a Github action (a more general version [can be found here](https://github.com/psalm/psalm-github-actions)).

```yaml
name: Psalm Security Scan

on: [push, pull_request]

jobs:
  psalm:
    name: Psalm
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Psalm Security Scan
        uses: docker://ghcr.io/austenstone/psalm-security-scan
        
      - name: Upload Security Analysis results to GitHub
        uses: github/codeql-action/upload-sarif@v2
        with:
          sarif_file: results.sarif
```

## Specify Psalm version

You can also specify a version.

```diff
-        uses: docker://ghcr.io/psalm/psalm-security-scan
+        uses: docker://ghcr.io/psalm/psalm-security-scan:4.2.1
```

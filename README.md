# Psalm Github Security Scan

Run [Psalm’s Security Analysis](https://psalm.dev/docs/security_analysis/) as a Github action (a more general version [can be found here](https://github.com/psalm/psalm-github-actions)).

```yaml
name: Static analysis

on: [push, pull_request]

jobs:
  psalm:
    name: Psalm
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Psalm Security Scan
        uses: docker://vimeo/psalm-github-security-scan
        
      - name: Upload Security Analysis results to GitHub
        uses: github/codeql-action/upload-sarif@v1
        with:
          sarif_file: results.sarif
```

## Specify Psalm version

You can also specify a version.

```diff
-        uses: docker://vimeo/psalm-github-security-scan
+        uses: docker://vimeo/psalm-github-security-scan:4.2.0
```

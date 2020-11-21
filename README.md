# Psalm Github Security Scan

Run Psalm’s taint analysis as a github action. This is a streamlined version of https://github.com/psalm/psalm-github-actions.

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

```

## Specify Psalm version

You can also specify a version.

```diff
       - name: Psalm
-        uses: docker://vimeo/psalm-github-security-scan
+        uses: docker://vimeo/psalm-github-security-scan:4.2.0
```

### Send security output to GitHub Security tab

GitHub allows you to [send security issues to a separate part of the site](https://docs.github.com/en/free-pro-team@latest/github/finding-security-vulnerabilities-and-errors-in-your-code/sarif-support-for-code-scanning) that can be restricted to members of your team.

Use the following config:

```diff
       - name: Psalm
         uses: docker://vimeo/psalm-github-security-scan
+      - name: Upload Security Analysis results to GitHub
+        uses: github/codeql-action/upload-sarif@v1
+        with:
+          sarif_file: results.sarif
```

# ✏️ action-github-changelog-generator

Automatically generate change log from your tags, issues, labels and pull requests on GitHub,
using [github-changelog-generator](https://github.com/github-changelog-generator/github-changelog-generator)'s
[Docker image](https://github.com/github-changelog-generator/docker-github-changelog-generator).

## Inputs

Unless otherwise stated, the inputs are the same as in 
[github-changelog-generator](https://github.com/github-changelog-generator/github-changelog-generator/wiki/Advanced-change-log-generation-examples).

The following options are not available to use with this action: `require`, `version`, `help`, `no-*` options.

## Outputs

### `changelog`

Contents of generated change log.

## Example usage

```yaml
uses: heinrichreimer/github-changelog-generator-action@v1
with:
  token: ${{ secrets.GITHUB_TOKEN }}
```

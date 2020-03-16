[![License](https://img.shields.io/github/license/heinrichreimer/action-github-changelog-generator.svg?style=flat-square)](LICENSE)
[![Last commit](https://img.shields.io/github/last-commit/heinrichreimer/action-github-changelog-generator.svg?style=flat-square)](https://github.com/heinrichreimer/action-github-changelog-generator/commits)
[![Latest tag](https://img.shields.io/github/tag/heinrichreimer/action-github-changelog-generator.svg?style=flat-square)](https://github.com/heinrichreimer/action-github-changelog-generator/releases)
[![Issues](https://img.shields.io/github/issues/heinrichreimer/action-github-changelog-generator.svg?style=flat-square)](https://github.com/heinrichreimer/action-github-changelog-generator/issues)
[![Pull requests](https://img.shields.io/github/issues-pr/heinrichreimer/action-github-changelog-generator.svg?style=flat-square)](https://github.com/heinrichreimer/action-github-changelog-generator/pulls)

# ✏️ action-github-changelog-generator

Automatically generate change log from your tags, issues, labels and pull requests on GitHub,
using [github-changelog-generator](https://github.com/github-changelog-generator/github-changelog-generator)'s
[Docker image](https://github.com/github-changelog-generator/docker-github-changelog-generator).

This action also makes the changelog available to other actions as [output](#outputs).

## Example usage

```yaml
uses: heinrichreimer/github-changelog-generator-action@v2.1.1
with:
  token: ${{ secrets.GITHUB_TOKEN }}
```

## Inputs

<dl>
  <dt><code>repo</code></dt>
  <dd>Target GitHub repo in the form of organization/repository.</dd>

  <dt><code>user</code></dt>
  <dd>Username of the owner of target GitHub repo.</dd>

  <dt><code>project</code></dt>
  <dd>Name of project on GitHub.</dd>

  <dt><code>token</code></dt>
  <dd>To make more than 50 requests per hour your GitHub token is required.</dd>

  <dt><code>dateFormat</code></dt>
  <dd>Date format.</dd>

  <dt><code>output</code></dt>
  <dd>Output file.</dd>

  <dt><code>base</code></dt>
  <dd>Optional base file to append generated changes to.</dd>

  <dt><code>headerLabel</code></dt>
  <dd>Set up custom header label.</dd>

  <dt><code>configureSections</code></dt>
  <dd>Define your own set of sections which overrides all default sections.</dd>

  <dt><code>addSections</code></dt>
  <dd>Add new sections but keep the default sections.</dd>

  <dt><code>frontMatter</code></dt>
  <dd>Add YAML front matter. Formatted as JSON because it's easier to add on the command line.</dd>

  <dt><code>issues</code></dt>
  <dd>Include closed issues in changelog.</dd>

  <dt><code>issuesWoLabels</code></dt>
  <dd>Include closed issues without labels in changelog.</dd>

  <dt><code>pullRequests</code></dt>
  <dd>Include pull-requests in changelog.</dd>

  <dt><code>prWoLabels</code></dt>
  <dd>Include pull requests without labels in changelog.</dd>

  <dt><code>filterByMilestone</code></dt>
  <dd>Use milestone to detect when issue was resolved.</dd>

  <dt><code>author</code></dt>
  <dd>Add author of pull request at the end.</dd>

  <dt><code>usernamesAsGithubLogins</code></dt>
  <dd>Use GitHub tags instead of Markdown links for the author of an issue or pull-request.</dd>

  <dt><code>unreleasedOnly</code></dt>
  <dd>Generate log from unreleased closed issues only.</dd>

  <dt><code>unreleased</code></dt>
  <dd>Add to log unreleased closed issues.</dd>

  <dt><code>unreleasedLabel</code></dt>
  <dd>Include compare link (Full Changelog) between older version and newer version.</dd>

  <dt><code>includeLabels</code></dt>
  <dd>Of the labeled issues, only include the ones with the specified labels.</dd>

  <dt><code>excludeLabels</code></dt>
  <dd>Issues with the specified labels will be excluded from changelog.</dd>

  <dt><code>issueLineLabels</code></dt>
  <dd>The specified labels will be shown in brackets next to each matching issue. Use "ALL" to show all labels.</dd>

  <dt><code>excludeTags</code></dt>
  <dd>Changelog will exclude specified tags.</dd>

  <dt><code>excludeTagsRegex</code></dt>
  <dd>Apply a regular expression on tag names so that they can be excluded.</dd>

  <dt><code>sinceTag</code></dt>
  <dd>Changelog will start after specified tag.</dd>

  <dt><code>dueTag</code></dt>
  <dd>Changelog will end before specified tag.</dd>

  <dt><code>maxIssues</code></dt>
  <dd>Maximum number of issues to fetch from GitHub.</dd>

  <dt><code>releaseUrl</code></dt>
  <dd>The URL to point to for release links, in printf format (with the tag as variable).</dd>

  <dt><code>githubSite</code></dt>
  <dd>The Enterprise GitHub site where your project is hosted.</dd>

  <dt><code>githubApi</code></dt>
  <dd>The enterprise endpoint to use for your GitHub API.</dd>

  <dt><code>simpleList</code></dt>
  <dd>Create a simple list from issues and pull requests.</dd>

  <dt><code>futureRelease</code></dt>
  <dd>Put the unreleased changes in the specified release number.</dd>

  <dt><code>releaseBranch</code></dt>
  <dd>Limit pull requests to the release branch, such as master or release.</dd>

  <dt><code>httpCache</code></dt>
  <dd>Use HTTP Cache to cache GitHub API requests (useful for large repos).</dd>

  <dt><code>cacheFile</code></dt>
  <dd>Filename to use for cache.</dd>

  <dt><code>cacheLog</code></dt>
  <dd>Filename to use for cache log.</dd>

  <dt><code>sslCaFile</code></dt>
  <dd>Path to cacert.pem file.</dd>

  <dt><code>verbose</code></dt>
  <dd>Run verbosely.</dd>

  <dt><code>breakingLabel</code></dt>
  <dd>Set up custom label for breaking changes section.</dd>

  <dt><code>breakingLabels</code></dt>
  <dd>Issues with these labels will be added to a new section, called "Breaking changes".</dd>

  <dt><code>enhancementLabel</code></dt>
  <dd>Set up custom label for enhancements section.</dd>

  <dt><code>enhancementLabels</code></dt>
  <dd>Issues with the specified labels will be added to "Implemented enhancements" section.</dd>

  <dt><code>bugsLabel</code></dt>
  <dd>Set up custom label for bug-fixes section.</dd>

  <dt><code>bugLabels</code></dt>
  <dd>Issues with the specified labels will be added to "Fixed bugs" section.</dd>

  <dt><code>deprecatedLabel</code></dt>
  <dd>Set up custom label for deprecated section.</dd>

  <dt><code>deprecatedLabels</code></dt>
  <dd>Issues with the specified labels will be added to a section called "Deprecated".</dd>

  <dt><code>removedLabel</code></dt>
  <dd>Set up custom label for removed section.</dd>

  <dt><code>removedLabels</code></dt>
  <dd>Issues with the specified labels will be added to a section called "Removed".</dd>

  <dt><code>securityLabel</code></dt>
  <dd>Set up custom label for security section.</dd>

  <dt><code>securityLabels</code></dt>
  <dd>Issues with the specified labels will be added to a section called "Security fixes".</dd>

  <dt><code>issuesLabel</code></dt>
  <dd>Set up custom label for closed-issues section.</dd>

  <dt><code>prLabel</code></dt>
  <dd>Set up custom label for pull requests section.</dd>

  <dt><code>onlyLastTag</code></dt>
  <dd>Changelog will only show last tag. <em>Default: <code>false</code></em></dd>

  <dt><code>stripHeaders</code></dt>
  <dd>Strip headers and only show changes. <em>Default: <code>false</code></em></dd>

  <dt><code>stripGeneratorNotice</code></dt>
  <dd>Strip generator notice. <em>Default: <code>false</code></em></dd>
</dl>

Unless otherwise stated, the inputs' defaults are described 
[here](https://github.com/github-changelog-generator/github-changelog-generator/wiki/Advanced-change-log-generation-examples).

## Outputs

<dl>
  <dt><code>changelog</code></dt>
  <dd>Contents of generated change log.</dd>
</dl>

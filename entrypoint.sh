#!/bin/bash

# Set repository from GitHub, if not set.
if [ -z "$INPUT_REPO" ]; then INPUT_REPO="$GITHUB_REPOSITORY"; fi
# Set user input from repository, if not set.
if [ -z "$INPUT_USER" ]; then INPUT_USER=$(echo "$INPUT_REPO" | cut --delimiter="/" --fields="1" ); fi
# Set project input from repository, if not set.
if [ -z "$INPUT_PROJECT" ]; then INPUT_PROJECT=$(echo "$INPUT_REPO" | cut --delimiter="/" --fields="2-" ); fi

# Build arguments.
istrue () {
  case $1 in
    "true"|"yes"|"y") return 0;;
    *) return 1;;
  esac
}
if [ -n "$INPUT_USER" ]; then ARG_USER="--user $INPUT_USER"; fi
if [ -n "$INPUT_PROJECT" ]; then ARG_PROJECT="--project $INPUT_PROJECT"; fi
if [ -n "$INPUT_TOKEN" ]; then ARG_TOKEN="--token $INPUT_TOKEN"; fi
if [ -n "$INPUT_DATE_FORMAT" ]; then ARG_DATE_FORMAT="--date-format $INPUT_DATE_FORMAT"; fi
if [ -n "$INPUT_OUTPUT" ]; then ARG_OUTPUT="--output $INPUT_OUTPUT"; fi
if [ -n "$INPUT_BASE" ]; then ARG_BASE="--base $INPUT_BASE"; fi
if [ -n "$INPUT_HEADER_LABEL" ]; then ARG_HEADER_LABEL="--header-label $INPUT_HEADER_LABEL"; fi
if [ -n "$INPUT_CONFIGURE_SECTIONS" ]; then ARG_CONFIGURE_SECTIONS="--configure-sections $INPUT_CONFIGURE_SECTIONS"; fi
if [ -n "$INPUT_ADD_SECTIONS" ]; then ARG_ADD_SECTIONS="--add-sections $INPUT_ADD_SECTIONS"; fi
if [ -n "$INPUT_FRONT_MATTER" ]; then ARG_FRONT_MATTER="--front-matter $INPUT_FRONT_MATTER"; fi
if istrue "$INPUT_ISSUES"; then ARG_ISSUES="--issues"; else ARG_ISSUES="--no-issues"; fi
if istrue "$INPUT_ISSUES_WO_LABELS"; then ARG_ISSUES_WO_LABELS="--issues-wo-labels"; else ARG_ISSUES_WO_LABELS="--no-issues-wo-labels"; fi
if istrue "$INPUT_PULL_REQUESTS"; then ARG_PULL_REQUESTS="--pull-requests"; else ARG_PULL_REQUESTS="--no-pull-requests"; fi
if istrue "$INPUT_PR_WO_LABELS"; then ARG_PR_WO_LABELS="--pr-wo-labels"; else ARG_PR_WO_LABELS="--no-pr-wo-labels"; fi
if istrue "$INPUT_FILTER_BY_MILESTONE"; then ARG_FILTER_BY_MILESTONE="--filter-by-milestone"; else ARG_FILTER_BY_MILESTONE="--no-filter-by-milestone"; fi
if istrue "$INPUT_AUTHOR"; then ARG_AUTHOR="--author"; else ARG_AUTHOR="--no-author"; fi
if istrue "$INPUT_USERNAMES_AS_GITHUB_LOGINS"; then ARG_USERNAMES_AS_GITHUB_LOGINS="--usernames-as-github-logins"; fi
if istrue "$INPUT_UNRELEASED_ONLY"; then ARG_UNRELEASED_ONLY="--unreleased-only"; fi
if istrue "$INPUT_UNRELEASED"; then ARG_UNRELEASED="--unreleased"; else ARG_ISSUES="--no-unreleased"; fi
if [ -n "$INPUT_UNRELEASED_LABEL" ]; then ARG_UNRELEASED_LABEL="--unreleased-label $INPUT_UNRELEASED_LABEL"; fi
if istrue "$INPUT_COMPARE_LINK"; then ARG_COMPARE_LINK="--compare-link"; else ARG_COMPARE_LINK="--no-compare-link"; fi
if [ -n "$INPUT_INCLUDE_LABELS" ]; then ARG_INCLUDE_LABELS="--include-labels $INPUT_INCLUDE_LABELS"; fi
if [ -n "$INPUT_EXCLUDE_LABELS" ]; then ARG_EXCLUDE_LABELS="--exclude-labels $INPUT_EXCLUDE_LABELS"; fi
if [ -n "$INPUT_ISSUE_LINE_LABELS" ]; then ARG_ISSUE_LINE_LABELS="--issue-line-labels $INPUT_ISSUE_LINE_LABELS"; fi
if [ -n "$INPUT_EXCLUDE_TAGS" ]; then ARG_EXCLUDE_TAGS="--exclude-tags $INPUT_EXCLUDE_TAGS"; fi
if [ -n "$INPUT_EXCLUDE_TAGS_REGEX" ]; then ARG_EXCLUDE_TAGS_REGEX="--exclude-tags-regex $INPUT_EXCLUDE_TAGS_REGEX"; fi
if [ -n "$INPUT_SINCE_TAG" ]; then ARG_SINCE_TAG="--since-tag $INPUT_SINCE_TAG"; fi
if [ -n "$INPUT_DUE_TAG" ]; then ARG_DUE_TAG="--due-tag $INPUT_DUE_TAG"; fi
if [ -n "$INPUT_MAX_ISSUES" ]; then ARG_MAX_ISSUES="--max-issues $INPUT_MAX_ISSUES"; fi
if [ -n "$INPUT_RELEASE_URL" ]; then ARG_RELEASE_URL="--release-url $INPUT_RELEASE_URL"; fi
if [ -n "$INPUT_GITHUB_SITE" ]; then ARG_GITHUB_SITE="--github-site $INPUT_GITHUB_SITE"; fi
if [ -n "$INPUT_GITHUB_API" ]; then ARG_GITHUB_API="--github-api $INPUT_GITHUB_API"; fi
if istrue "$INPUT_SIMPLE_LIST"; then ARG_SIMPLE_LIST="--simple-list"; fi
if [ -n "$INPUT_FUTURE_RELEASE" ]; then ARG_FUTURE_RELEASE="--future-release $INPUT_FUTURE_RELEASE"; fi
if [ -n "$INPUT_RELEASE_BRANCH" ]; then ARG_RELEASE_BRANCH="--release-branch $INPUT_RELEASE_BRANCH"; fi
if istrue "$INPUT_HTTP_CACHE"; then ARG_HTTP_CACHE="--http-cache"; fi
if [ -n "$INPUT_CACHE_FILE" ]; then ARG_CACHE_FILE="--cache-file $INPUT_CACHE_FILE"; fi
if [ -n "$INPUT_CACHE_LOG" ]; then ARG_CACHE_LOG="--cache-log $INPUT_CACHE_LOG"; fi
if [ -n "$INPUT_SSL_CA_FILE" ]; then ARG_SSL_CA_FILE="--ssl-ca-file $INPUT_SSL_CA_FILE"; fi
if istrue "$INPUT_VERBOSE"; then ARG_VERBOSE="--verbose"; else ARG_VERBOSE="--no-verbose"; fi
if [ -n "$INPUT_BREAKING_LABEL" ]; then ARG_BREAKING_LABEL="--breaking-label $INPUT_BREAKING_LABEL"; fi
if [ -n "$INPUT_BREAKING_LABELS" ]; then ARG_BREAKING_LABELS="--breaking-labels $INPUT_BREAKING_LABELS"; fi
if [ -n "$INPUT_ENHANCEMENT_LABEL" ]; then ARG_ENHANCEMENT_LABEL="--enhancement-label $INPUT_ENHANCEMENT_LABEL"; fi
if [ -n "$INPUT_ENHANCEMENT_LABELS" ]; then ARG_ENHANCEMENT_LABELS="--enhancement-labels $INPUT_ENHANCEMENT_LABELS"; fi
if [ -n "$INPUT_BUGS_LABEL" ]; then ARG_BUGS_LABEL="--bugs-label $INPUT_BUGS_LABEL"; fi
if [ -n "$INPUT_BUG_LABELS" ]; then ARG_BUG_LABELS="--bug-labels $INPUT_BUG_LABELS"; fi
if [ -n "$INPUT_DEPRECATED_LABEL" ]; then ARG_DEPRECATED_LABEL="--deprecated-label $INPUT_DEPRECATED_LABEL"; fi
if [ -n "$INPUT_DEPRECATED_LABELS" ]; then ARG_DEPRECATED_LABELS="--deprecated-labels $INPUT_DEPRECATED_LABELS"; fi
if [ -n "$INPUT_REMOVED_LABEL" ]; then ARG_REMOVED_LABEL="--removed-label $INPUT_REMOVED_LABEL"; fi
if [ -n "$INPUT_REMOVED_LABELS" ]; then ARG_REMOVED_LABELS="--removed-labels $INPUT_REMOVED_LABELS"; fi
if [ -n "$INPUT_SECURITY_LABEL" ]; then ARG_SECURITY_LABEL="--security-label $INPUT_SECURITY_LABEL"; fi
if [ -n "$INPUT_SECURITY_LABELS" ]; then ARG_SECURITY_LABELS="--security-labels $INPUT_SECURITY_LABELS"; fi
if [ -n "$INPUT_ISSUES_LABEL" ]; then ARG_ISSUES_LABEL="--issues-label $INPUT_ISSUES_LABEL"; fi
if [ -n "$INPUT_PR_LABEL" ]; then ARG_PR_LABEL="--pr-label $INPUT_PR_LABEL"; fi

# Generate change log.
# shellcheck disable=SC2086 # We specifically want to allow word splitting.
github_changelog_generator \
  $ARG_USER \
  $ARG_PROJECT \
  $ARG_TOKEN \
  $ARG_DATE_FORMAT \
  $ARG_OUTPUT \
  $ARG_BASE \
  $ARG_HEADER_LABEL \
  $ARG_CONFIGURE_SECTIONS \
  $ARG_ADD_SECTIONS \
  $ARG_FRONT_MATTER \
  $ARG_ISSUES \
  $ARG_ISSUES_WO_LABELS \
  $ARG_PULL_REQUESTS \
  $ARG_PR_WO_LABELS \
  $ARG_FILTER_BY_MILESTONE \
  $ARG_AUTHOR \
  $ARG_USERNAMES_AS_GITHUB_LOGINS \
  $ARG_UNRELEASED_ONLY \
  $ARG_UNRELEASED \
  $ARG_UNRELEASED_LABEL \
  $ARG_COMPARE_LINK \
  $ARG_INCLUDE_LABELS \
  $ARG_EXCLUDE_LABELS \
  $ARG_ISSUE_LINE_LABELS \
  $ARG_EXCLUDE_TAGS \
  $ARG_EXCLUDE_TAGS_REGEX \
  $ARG_SINCE_TAG \
  $ARG_DUE_TAG \
  $ARG_MAX_ISSUES \
  $ARG_RELEASE_URL \
  $ARG_GITHUB_SITE \
  $ARG_GITHUB_API \
  $ARG_SIMPLE_LIST \
  $ARG_FUTURE_RELEASE \
  $ARG_RELEASE_BRANCH \
  $ARG_HTTP_CACHE \
  $ARG_CACHE_FILE \
  $ARG_CACHE_LOG \
  $ARG_SSL_CA_FILE \
  $ARG_VERBOSE \
  $ARG_BREAKING_LABEL \
  $ARG_BREAKING_LABELS \
  $ARG_ENHANCEMENT_LABEL \
  $ARG_ENHANCEMENT_LABELS \
  $ARG_BUGS_LABEL \
  $ARG_BUG_LABELS \
  $ARG_DEPRECATED_LABEL \
  $ARG_DEPRECATED_LABELS \
  $ARG_REMOVED_LABEL \
  $ARG_REMOVED_LABELS \
  $ARG_SECURITY_LABEL \
  $ARG_SECURITY_LABELS \
  $ARG_ISSUES_LABEL \
  $ARG_PR_LABEL

# Save change log to outputs.
FILE="CHANGELOG.md"
if [ -n "$INPUT_OUTPUT" ]; then FILE="$INPUT_OUTPUT"; fi
if [[ -e "$FILE" ]]; then CHANGELOG="$(cat CHANGELOG.md)"; fi
export CHANGELOG
echo ::set-output name=changelog::"${CHANGELOG}"

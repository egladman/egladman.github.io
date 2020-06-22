#!/bin/bash -e

url="$1"
[[ -n "$url" ]] || exit 1

readonly tmp_dir="$(mktemp -d)"
readonly git_origin="$(git config  --get remote.origin.url)"
readonly git_branch="master"

cp -r site/* "${tmp_dir}"
printf '%s\n' "$url" > "${tmp_dir}"/CNAME

pushd "$tmp_dir"
git init
git add .
git commit -m "Site updated at $(date)"
git remote add origin "${git_origin}"
git push origin master:refs/heads/"${git_branch}" --force
popd

rm -rf "$tmp_dir"

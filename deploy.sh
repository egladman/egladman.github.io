#!/bin/bash -e

readonly tmp_dir="$(mktemp -d)"
readonly git_origin="$(git config  --get remote.origin.url)"
readonly git_branch="master"

cp -r site/* "${tmp_dir}"
cp CNAME "${tmp_dir}"

pushd "${tmp_dir}"
git init
git add .
git commit -m "Site updated at $(date)"
git remote add origin "${git_origin}"
git push origin master:refs/heads/"${git_branch}" --force
popd

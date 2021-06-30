#!/usr/bin/env bash

# Needs to be in order of dependencies, i.e. ds-test first and then up the tree
# but whatevs

# todo: construct this dependency ordering automatically
pkgs="ds-test
ds-note
ds-auth
ds-exec
ds-math
erc20
ds-thing
ds-stop
ds-token
ds-roles
ds-guard
ds-vault
ds-value
ds-cache
"

for pkg in $pkgs; do
    echo "================================="
    echo "$pkg"
    echo "================================="
    echo ""
    pushd lib/$pkg
    git fetch
    git checkout master
    git reset --hard origin/master
    rm -rf lib
    git checkout lib
    dapp upgrade
    dapp update
    git push origin master
    popd
    dapp update $pkg
    dapp update
    dapp upgrade $pkg
done


# -- each pkg
# update to origin/master
# upgrade all submodules (not recursive)
# recursive checkout
# push to origin/master

# -- top level
# checkout local pkg
# upgrade pkg


dapp update

pushd dappsys
git pull
git submodule update --init --checkout --remote
git add --all
git commit -m "update dappsys"
git push
popd


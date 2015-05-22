#!/usr/bin/env bash

# "Borrowed" from laravel/settler repository

## Cleanup for build
vagrant destroy -f
rm -rf .vagrant

## build virtualbox provider base image
time vagrant up --provider virtualbox 2>&1 | tee virtualbox-build-output.log
vagrant halt
vagrant package --base `ls ~/VirtualBox\ VMs | grep vagrantops` --output virtualbox.box

## View directory when running
ls -lh virtualbox.box

## Cleanup for next build
vagrant destroy -f
rm -rf .vagrant
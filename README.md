# Pixl8 Commandbox Commands

## Purpose

The purpose of this package is to provide common Pixl8 devops commands to the box commandline.

## Current commands

* `pixl8 mis setCredentials` - you will be supplied an API key from MIS
* `pixl8 mis setEndpoint` - used to set the MIS endpoint (see internal Pixl8 Documentation)
* `pixl8 mis publish <zipfile>` - used to publish packages

## Forgebox endpoint

This package adds a custom forgebox endpoint `pixl8`. The idea here is that you will be able to install private pixl8 packages using:

```
box install pixl8:preside-ext-some-ext@^5.45.3
```

This adds the benefit of local package caching and smart version resolution along with our own private repository of packages.

## Installation

This package should be installed to local CommandBox installations with:

```
box install pixl8/pixl8-commandbox-commands.git#stable
```

## Other features

As of CommandBox 5.1.0, `box install` in a project will overwrite any package (e.g. a Preside extension) where the current version does not match the installed version number - including downgrades.

This means that if your project has an extension which is a Git repo, rather than a built release, it will always get overwritten, which is not ideal.

This module adds protection against this, so if the existing package is a Git repo, it will _never_ be overwritten.
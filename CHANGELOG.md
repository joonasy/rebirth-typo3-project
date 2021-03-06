# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.0.4] - 2020-01-22

- Automatically delete unnecessary files & git init with `$ make bootstrap`
- Automatically install extension node_modules
- Automatically add .env.example -> .env
- Automatically add extension .env.example -> .env
- Tweaked instructions, updated deps
- Don't ignore `web/typo3conf/ext/*` by default to keep things simple
- Run extension build automatically in start

## [0.0.3] - 2019-10-08

- Yarn -> Npm
- Add missing .editorconfig

## [0.0.2] - 2018-11-23

* Remove extension related installations
* Better composer installation
* Add better method for working with the extension. Use git instead of composer.

## [0.0.1] - 2018-11-09

* Init project. These type of boilerplates were used to generate with [generator-rebirth](https://github.com/joonasy/generator-rebirth) which removed the feature in [0.6.0](https://github.com/joonasy/generator-rebirth/blob/master/CHANGELOG.md). That generator is now only used to create themes.

# Rebirth — TYPO3 Development Environment

This is a modern TYPO3 stack designed to work with [Rebirth](https://github.com/joonasy/rebirth) that helps you get started with the best development tools and project structure.

## Features

* Easy TYPO3 configuration with environment specific files
* Environment variables with [Dotenv](https://github.com/vlucas/phpdotenv) & [dotenv](https://github.com/motdotla/dotenv#readme) for deployments
* Uses composer for installing extensions. Includes useful extensions out of the box.
* Automatic TYPO3 installation to remote location
* Scripts for deploying databases and assets to remote locations
* Scripts for pulling assets and databases from remote locations

## Requirements

* GNU/Linux/Unix with Docker ([Docker toolbox](https://www.docker.com/products/docker-toolbox), [Vagrant](https://www.vagrantup.com/downloads.html) VM with Docker, [native Linux with Docker](http://docs.docker.com/linux/step_one/) or [Docker for Mac](https://docs.docker.com/docker-for-mac/)).
* [docker-compose](https://github.com/docker/compose)
* [Node.js](http://nodejs.org/)
* [Yarn](https://yarnpkg.com)

## Quick start

Quickly install with [create-project](https://github.com/mafintosh/create-project). Add your values to the following one-liner: 

```
$ npx create-project my-project-dir-dev joonasy/rebirth-typo3-dev --human-name="My Project" --extension-dir=my-extension-dir --author=joonasy --production-url=https://my-project.com --wpml-user-id="=8365..." --wpml-key="=gxNTN8dHlwZ..." --acf-key="=9wZXJ8ZGF0..."
```

After the installation is done jump to phase 3 in the next section.

## Getting started

This development template assumes that you are using [Rebirth](https://github.com/joonasy/rebirth) to develop your extension. However it is not required and you may use any extension you like.

**1. Clone this git repository and create your project folder**

    $ git clone https://github.com/joonasy/rebirth-typo3-dev.git my-project-dir-dev

**2. Replace all of the following variables in all the project files with _machine readable format_**

* `{{name}}`: This is your project name (e.g. `my-project-dir-dev`; It's recommended to use same name as your project folders name which you created above. This should also be used for git urls).   
* `{{human-name}}`: This is your project human readable name (e.g. `My Project`).
* `{{extension-dir}}`: This will be your extension directory which will be generated later (e.g. `myextension`)
* `{{author}}`: Author of this project (e.g. `joonasy`)
* `{{production-url}}`: Website url of the project in which the app will be published (e.g. `https://project-name.com`) 

**3. Install extension with Rebirth Yeoman generator**

If you don't want to use Rebirth you can skip this step.

1. Navigate to `web/typo3conf/ext/`
2. Create your extension with [Rebirth Yeoman Generator](https://github.com/joonasy/generator-rebirth) and make sure the previously added {{extension-dir}} matches with the generated project name. 

```
$ yarn global add generator-rebirth
$ npx yo rebirth [extension-dir] --project=typo3
```

**4. Install all the dependencies and kickstart the project**

1. Copy `.env.example` to `.env` and setup your environment variables
2. Make sure docker is running as the following command will require it

```
$ make start
```

Crab a cup of :coffee: as the installation process may take a while. If you are not able to run these please refer to the [Makefile](Makefile) and run the commands manually.

After the installation is done, navigate to [PROJECT.md](PROJECT.md) to learn about further installation process and available commands.

**5. Recommended actions**

1. Require your extension repository in [web/composer.json](web/composer.json) so it gets installed in further installation processes:

```
...
"repositories": [
  {
    "type": "vcs",
    "url": "git@bitbucket.org:{{author}}/{{extension-dir}}.git"
  }
],
"require-dev": {
  "{{author}}/{{extension-dir}}": "*@dev"
}
...
```

2. Make sure `PROJECT.md` contains correct information such as correct remote git links
3. Delete the following files 
    - This `README.md` 
    - Rename `PROJECT.md` to `README.md`
    - `CHANGELOG.md`
    - `.git` folder
4. Git init your fresh new project and remember to init your extension as well

Happy developing! 

## Changelog

See [CHANGELOG.md](/CHANGELOG.md)

## Useful information

### `web/typo3conf/ext` is ignored

By default `web/typo3conf/ext` is ignored by git because we don't want this development repository to track extension related changes nor we want to use submodules. This is recommended practice since things may get messy if we have multiple extensions in a single project. If for some reason you want to track these changes, add `!web/typo3conf/ext` to `.gitignore`.
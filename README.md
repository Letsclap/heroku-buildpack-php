# Heroku PHP buildpack

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks) for PHP applications.  
This buildpack automatically installs the PHP extensions [curve25519](https://github.com/Letsclap/curve25519-php) and [protobuf](https://github.com/Letsclap/php-protobuf).

It uses Composer for dependency management, supports PHP or HHVM (experimental) as runtimes, and offers a choice of Apache2 or Nginx web servers.

## Usage

You'll need to use at least an empty `composer.json` in your application.

    echo '{}' > composer.json
    git add composer.json
    git commit -m "add composer.json for PHP app detection"

If you also have files from other frameworks or languages that could trigger another buildpack to detect your application as one of its own, e.g. a `package.json` which might cause your code to be detected as a Node.js application even if it is a PHP application, then you need to manually set your application to use this buildpack:

    heroku buildpacks:set https://github.com/tomclaus/heroku-buildpack-php

Please refer to [Dev Center](https://devcenter.heroku.com/categories/php) for further usage instructions.


# Docker CI builds image with [Node], [PHP] and [Composer]

This Docker image is based on the official node LTS images which use Debian Stretch.

* PHP 7.3 is built on node:10-stretch
* Earlier versions use node:8-stretch

It is intended for running Continuous Integration and deployment builds for PHP applications with Node dependencies for compiling static assets. It also features [AWS cli] for interacting with AWS Services.

[Node]: https://nodejs.org/
[PHP]: https://php.net/
[Composer]: https://getcomposer.org/
[AWS cli]: https://aws.amazon.com/cli/

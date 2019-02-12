# Sentry Command Line Interface Orb

[![CircleCI Build](https://circleci.com/gh/PicturePipe/sentry-cli-orb.svg?style=shield&circle-token=a980080f2b43f3d71c43a4caffb644b3cac8d86c)](https://circleci.com/gh/PicturePipe/sentry-cli-orb "CircleCI Build")
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovateapp.com/ "Renovate enabled")

CircleCI [orb](https://circleci.com/orbs/) to manage your Sentry projects with [sentry-cli](https://github.com/getsentry/sentry-cli/).

## Releasing a New Orb Version

When creating a new release the version number of the orb must be incremented. The[`circleci` CLI](https://circleci-public.github.io/circleci-cli/)
uses [Semantic Versioning](https://semver.org/). So the Semantic Version segments `major`, `minor`or `patch` can be used (see [`circleci orb publish promote`](https://circleci-public.github.io/circleci-cli/circleci_orb_publish_promote.html)).

1.  Wait for CircleCI to pass and publish the development orb to the registry.
2.  Check which was the last semantic release of the orb:
    ```console
    circleci orb info picturepipe/sentry-cli
    ```
3.  Decide which version you want to release. You have to set the last argument in the next step
    accordingly!
4.  Promote the development version of the orb to a semantic release:
    ```console
    circleci orb publish promote picturepipe/sentry-cli [major|minor|patch]
    ```

## License

Distributed under the MIT license.

Copyright 2019 reelport GmbH

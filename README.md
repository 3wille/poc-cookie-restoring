# Proof-of-Concept: Cookie Restoring
[![DOI](https://zenodo.org/badge/115822159.svg)](https://zenodo.org/badge/latestdoi/115822159)

This is a proof of concept developed for my bachelor thesis. It restores cookies, probably deleted by a user, by tracking the IP addresses used for requests. This could be a tracking method used for connections over IPv6 as IPv6 addresses can be considered to be device pseudonyms for a limited time.

## Installation

This is a Ruby-on-Rails application. To start it, you need a ruby interpreter (preferably MRI >= 2.3). You need to install bundler with ``gem install bundler``. After that, in the project directory run ``bundle install`` to install all dependencies.

## Running

To run the application just execute:

```
bundle exec rails server -b "[::1]" -p 3000
```

I use this on a server with Caddy. A Caddyfile is provided in this repository.

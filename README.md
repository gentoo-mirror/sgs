# sgs - overlay

*sgs - overlay* is Simeon Simeonov's personal Gentoo overlay.

The main purpose is to present unofficial ports (ebuilds) to the users of
Gentoo GNU/Linux.


## Ports / ebuilds

The following ports are currently available:

* dev-python/etoolkit - a simple toolkit for defining and setting environment
variables in a flexible and secure way - https://github.com/blackm0re/etoolkit

* dev-python/pyotp2289 - a pure Python 3 implementation of "A One-Time
Password System" - RFC-2289. - https://github.com/blackm0re/pyotp2289

* mail-client/sylpheed - Sylpheed fork that implements features and fixes not
present in the official Sylpheed release - https://github.com/blackm0re/sylpheed

* www-servers/ngus - is a minimalist HTTP server written in pure Python and
intended for receiving file uploads - https://github.com/blackm0re/ngus

* x11-misc/i3lock-extended - a fork of i3lock offering some additional features
and niceties - https://github.com/blackm0re/i3lock-extended

* x11-terms/terminator - contains a "single tab patch" that propagates events
like 'next_tab', 'swicth_tab', etc instead of consuming them when only a single
tab is used on the terminal


## Setup

   ```bash
   eselect repository add sgs
   ```


## Author

Simeon Simeonov - sgs @ LiberaChat

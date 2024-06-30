# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1 verify-sig

DESCRIPTION="A pure Python 3 implementation of RFC-2289 - 'A One-Time Password System'"
HOMEPAGE="https://github.com/blackm0re/pyotp2289"
MY_PN="pyotp2289"
MY_P="${MY_PN}-${PV}"

SRC_URI="
	https://github.com/blackm0re/pyotp2289/releases/download/v${PV}/${MY_P}.tar.gz
	verify-sig? ( https://github.com/blackm0re/pyotp2289/releases/download/v${PV}/${MY_P}.tar.gz.asc )
"

S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"

KEYWORDS="amd64 arm arm64 ppc ppc64 x86"

BDEPEND="
	verify-sig? ( sec-keys/openpgp-keys-simeonsimeonov )
"

distutils_enable_tests pytest

VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/simeonsimeonov.asc

python_install_all() {
	distutils-r1_python_install_all
}

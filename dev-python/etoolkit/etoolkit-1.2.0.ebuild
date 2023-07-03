# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1 verify-sig

DESCRIPTION="A simple toolkit for setting environment variables in a flexible way"
HOMEPAGE="https://github.com/blackm0re/etoolkit"
MY_PN="etoolkit"
MY_P="${MY_PN}-${PV}"

SRC_URI="
	https://github.com/blackm0re/etoolkit/releases/download/${PV}/${MY_P}.tar.gz
	verify-sig? ( https://github.com/blackm0re/etoolkit/releases/download/${PV}/${MY_P}.tar.gz.asc )
"

KEYWORDS="amd64 arm arm64 ppc ppc64 sparc x86"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="
	>=dev-python/cryptography-3.2.0[${PYTHON_USEDEP}]
"
BDEPEND="
	verify-sig? ( sec-keys/openpgp-keys-simeonsimeonov )
"

distutils_enable_tests pytest

VERIFY_SIG_OPENPGP_KEY_PATH=${BROOT}/usr/share/openpgp-keys/simeonsimeonov.asc

python_test() {
	epytest -s
}

python_install_all() {
	distutils-r1_python_install_all
}

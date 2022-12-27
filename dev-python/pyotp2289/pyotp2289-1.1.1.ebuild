# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="A pure Python 3 implementation of RFC-2289 - 'A One-Time Password System'"
HOMEPAGE="https://github.com/blackm0re/pyotp2289"
MY_PN="pyotp2289"
MY_P="${MY_PN}-${PV}"

SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"
KEYWORDS="amd64 arm arm64 ppc ppc64 x86 ~amd64-linux ~x86-linux"
S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"

distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all
}

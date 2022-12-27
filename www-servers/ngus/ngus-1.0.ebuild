# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="A minimalist HTTP server written in pure Python and intended for receiving file uploads"
HOMEPAGE="https://github.com/blackm0re/ngus"
MY_PN="ngus"
MY_P="${MY_PN}-${PV}"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"
KEYWORDS="amd64 arm arm64 ppc ppc64 x86 amd64-linux x86-linux"
S="${WORKDIR}/${MY_P}"

RESTRICT="test"

LICENSE="GPL-3+"
SLOT="0"

# DEPEND="
# 	dev-python/setuptools[${PYTHON_USEDEP}]
#     "

python_install_all() {
	distutils-r1_python_install_all
}

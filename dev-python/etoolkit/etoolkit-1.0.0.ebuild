# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{7,8,9,10} )

inherit distutils-r1

DESCRIPTION="A simple toolkit for setting environment variables in a flexible way"
HOMEPAGE="https://github.com/blackm0re/etoolkit"
MY_PN="etoolkit"
MY_P="${MY_PN}-${PV}"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"
KEYWORDS="amd64 arm ~arm64 ppc ppc64 x86 ~amd64-linux ~x86-linux"
S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		${RDEPEND}
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	PYTHONPATH=${S}:${PYTHONPATH} \
		pytest -vv -p no:httpbin || die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	distutils-r1_python_install_all
}

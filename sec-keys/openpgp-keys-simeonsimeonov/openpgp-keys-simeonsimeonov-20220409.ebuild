# Copyright 2022 Simeon Simeonov
# Distributed under the terms of the GNU General Public License v3

EAPI=8

DESCRIPTION="OpenPGP keys used by Simeon Simeonov"
HOMEPAGE="https://github.com/blackm0re"
SRC_URI="https://simeon.simeonov.no/sgs.gpg"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86"

S=${WORKDIR}

src_install() {
	local files=( ${A} )
	insinto /usr/share/openpgp-keys
	newins - simeonsimeonov.asc < <(cat "${files[@]/#/${DISTDIR}/}" || die)
}

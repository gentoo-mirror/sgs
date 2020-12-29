# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit toolchain-funcs

DESCRIPTION="i3lock-extended - i3lock fork with additional functionality"
HOMEPAGE="https://simeon.simeonov.no"
SRC_URI="https://simeon.simeonov.no/programs/i3lock_extended/downloads/${P}.tar.xz"

LICENSE="GPL-3+ BSD"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~ppc64 ~x86"

RDEPEND="
	>=x11-libs/libxkbcommon-0.5.0[X]
	dev-libs/libev
	sys-libs/pam
	x11-libs/cairo[X,xcb(+)]
	x11-libs/libxcb[xkb]
	x11-libs/xcb-util
	x11-libs/xcb-util-xrm
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"
DOCS=( CHANGELOG README.md )

src_prepare() {
	default

	sed -i -e 's:login:system-auth:g' pam/${PN} || die
}

src_configure() {
	tc-export CC
	default
}

src_install() {
	default
	doman ${PN}.1
}

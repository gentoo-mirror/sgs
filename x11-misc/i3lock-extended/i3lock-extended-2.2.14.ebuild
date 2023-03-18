# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson verify-sig

DESCRIPTION="i3lock-extended - i3lock fork with additional functionality"
HOMEPAGE="https://github.com/blackm0re/i3lock-extended"
SRC_URI="
	https://github.com/blackm0re/i3lock-extended/releases/download/${PV}/${P}.tar.xz
	verify-sig? ( https://github.com/blackm0re/i3lock-extended/releases/download/${PV}/${P}.tar.xz.asc )
"

LICENSE="GPL-3+ BSD"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~ppc64 ~riscv x86"

RDEPEND="
	dev-libs/libev
	sys-libs/pam
	x11-libs/cairo[X,xcb(+)]
	x11-libs/libxcb
	x11-libs/libxkbcommon[X]
	x11-libs/xcb-util
	x11-libs/xcb-util-image
	x11-libs/xcb-util-xrm"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
	verify-sig? ( sec-keys/openpgp-keys-simeonsimeonov )
"

VERIFY_SIG_OPENPGP_KEY_PATH=${BROOT}/usr/share/openpgp-keys/simeonsimeonov.asc

src_prepare() {
	default

	sed -i -e 's:login:system-auth:g' pam/${PN} || die
}

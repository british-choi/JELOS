# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)
# Copyright (C) 2022-present Fewtarius

PKG_NAME="mpv"
PKG_VERSION="af9b53f3a3831531504906882efce0d979506ed3"
PKG_LICENSE="GPLv2+"
PKG_SITE="https://github.com/mpv-player/mpv"
PKG_URL="${PKG_SITE}/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain ffmpeg SDL2 luajit libass uchardet waf:host"
PKG_LONGDESC="Video player based on MPlayer/mplayer2 https://mpv.io"

if [ ! "${OPENGL}" = "no" ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGL} glu libglvnd"
  PKG_MESON_OPTS_TARGET+=" -Dgl=enabled -Degl=disabled"
fi

if [ "${OPENGLES_SUPPORT}" = yes ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  PKG_MESON_OPTS_TARGET+=" -Dgl=disabled -Degl=enabled"
fi

<<<<<<< HEAD
pre_configure_target() {
  cp -f ${TOOLCHAIN}/bin/waf ${PKG_BUILD}
}

configure_target() {
  cd ${PKG_BUILD}
  ${PKG_BUILD}/waf configure --enable-sdl2 --enable-sdl2-gamepad --enable-pulse --disable-libbluray --enable-uchardet ${PKG_WAF_OPTS}
}

make_target() {
  ${PKG_BUILD}/waf build
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp ./build/mpv ${INSTALL}/usr/bin
}
=======
>>>>>>> b720f4cfc7d9788432dde132a818145e33107878

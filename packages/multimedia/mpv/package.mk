# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)
# Copyright (C) 2022-present Fewtarius

PKG_NAME="mpv"
PKG_VERSION="f4210f84906c3b00a65fba198c8127b6757b9350" #0.36.0
PKG_LICENSE="GPLv2+"
PKG_SITE="https://github.com/mpv-player/mpv"
PKG_URL="${PKG_SITE}/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain ffmpeg SDL2 luajit libass uchardet waf:host"
PKG_LONGDESC="Video player based on MPlayer/mplayer2 https://mpv.io"
PKG_TOOLCHAIN="manual"

if [ ! "${OPENGL}" = "no" ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGL} glu libglvnd"
  PKG_WAF_OPTS=" --enable-gl --disable-egl"
fi

if [ "${OPENGLES_SUPPORT}" = yes ]; then
  PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  PKG_WAF_OPTS=" --disable-gl --enable-egl"
fi

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

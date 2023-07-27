# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2023-present Youngjun Choi (https://github.com/british-choi)

PKG_NAME="uchardet"
PKG_VERSION="0.0.8"
PKG_LICENSE="LGPLv2.1"
PKG_SITE="https://www.freedesktop.org/wiki/Software/uchardet"
PKG_URL="https://www.freedesktop.org/software/${PKG_NAME}/releases/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="uchardet is an encoding detector library, which takes a sequence of bytes in an unknown character encoding and attempts to determine the encoding of the text. Returned encoding names are iconv-compatible."


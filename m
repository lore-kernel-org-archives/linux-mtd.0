From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-sh@vger.kernel.org
Subject: [PATCH 00/15] Enable compilation of various Renesas drivers with
 COMPILE_TEST
Date: Wed, 27 Nov 2013 02:18:22 +0100
Message-Id: <1385515117-23664-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-fbdev@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Russell King <linux@arm.linux.org.uk>,
 Vinod Koul <vinod.koul@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Eduardo Valentin <eduardo.valentin@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
 Chris Ball <cjb@laptop.org>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Samuel Ortiz <samuel@sortiz.org>, linux-pm@vger.kernel.org,
 Ian Molton <ian@mnementh.co.uk>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-spi@vger.kernel.org, iommu@lists.linux-foundation.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dmaengine@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 Mauro Carvalho Chehab <m.chehab@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This patch series enables driver compilation with COMPILE_TEST for various
Renesas drivers. The approach taken here is to split the Kconfig depends line
in two, with compile dependencies (if any) on one line and runtime
dependencies (as a list of the platforms on which the hardware can be found)
on another line. The runtime dependencies line is extended with
|| COMPILE_TEST to enable test compilation. This clearly identifies compile
dependencies, and allow test compilation while not clobbering the
configuration menu with useless options in the normal case.

The patches are based on top of v3.13-rc1. To avoid build warnings or errors
during bisection the following patches sent to linux-sh and appropriate
mailing lists should be applied first:

serial: sh-sci: Fix warnings due to improper casts and printk formats
DMA: shdma: Fix warnings due to improper casts and printk formats
DMA: shdma: Fix warnings due to declared but unused symbols
DMA: shdma: Make sh_dmae_pm static
v4l: sh_vou: Fix warnings due to improper casts and printk formats
mmc: sh_mmcif: Factorize DMA channel request and configuration code
mmc: sh_mmcif: Fix compilation warning on 64-bit platforms
mtd: sh_flctl: Fix warnings due to improper casts
fbdev: sh_mobile_lcdcfb: Don't use plain 0 as NULL pointer
spi: sh-msiof: Fix warnings due to improper casts
spi: rcar: Fix uninitialized variable warning
spi: rcar: Fix pointer cast in the remove function

For convenience I've pushed the whole series and its prerequisites to my git
tree at

	git://linuxtv.org/pinchartl/fbdev.git clocks/ccf/multiarch-drivers

The patches will need to go through their respective subsystem's trees. To
help me tracking the mainlining state I'd appreciate if the respective
maintainers could notify me when applying the patches to their trees. Before
doing so I'd like to get an ack from Mark Brown and/or Russell King on the
approach.

Cc: dmaengine@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-pm@vger.kernel.org
Cc: linux-pwm@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: Chris Ball <cjb@laptop.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Eduardo Valentin <eduardo.valentin@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Ian Molton <ian@mnementh.co.uk>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Samuel Ortiz <samuel@sortiz.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Vinod Koul <vinod.koul@intel.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Zhang Rui <rui.zhang@intel.com>

Laurent Pinchart (15):
  i2c: shmobile/rcar: Restrict non-COMPILE_TEST compilation
  input: sh_keysc: Restrict non-COMPILE_TEST compilation
  serial: sh-sci: Restrict non-COMPILE_TEST compilation
  iommu: shmobile: Enable driver compilation with COMPILE_TEST
  DMA: shdma: Enable driver compilation with COMPILE_TEST
  v4l: sh_vou: Enable driver compilation with COMPILE_TEST
  mmc: sdhi: Enable driver compilation with COMPILE_TEST
  mmc: sh_mmcif: Enable driver compilation with COMPILE_TEST
  mtd: sh_flctl: Enable driver compilation with COMPILE_TEST
  irda: sh_irda: Enable driver compilation with COMPILE_TEST
  pwm: pwm-renesas-tpu: Enable driver compilation with COMPILE_TEST
  thermal: rcar-thermal: Enable driver compilation with COMPILE_TEST
  fbdev: sh-mobile-lcdcfb: Enable driver compilation with COMPILE_TEST
  spi: sh-msiof: Enable driver compilation with COMPILE_TEST
  sh: intc: Enable driver compilation with COMPILE_TEST

 drivers/dma/sh/Kconfig         | 2 +-
 drivers/i2c/busses/Kconfig     | 4 ++--
 drivers/input/keyboard/Kconfig | 2 +-
 drivers/iommu/Kconfig          | 1 +
 drivers/media/platform/Kconfig | 3 ++-
 drivers/mmc/host/Kconfig       | 6 ++++--
 drivers/mtd/nand/Kconfig       | 2 +-
 drivers/net/irda/Kconfig       | 3 ++-
 drivers/pwm/Kconfig            | 2 +-
 drivers/sh/intc/Kconfig        | 2 +-
 drivers/spi/Kconfig            | 3 ++-
 drivers/thermal/Kconfig        | 2 +-
 drivers/tty/serial/Kconfig     | 3 ++-
 drivers/video/Kconfig          | 8 +++++---
 14 files changed, 26 insertions(+), 17 deletions(-)

-- 
Regards,

Laurent Pinchart

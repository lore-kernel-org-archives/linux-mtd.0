Received: from mail-qk0-f176.google.com ([209.85.220.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAOVG-0003cP-Gf
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 20:21:07 +0000
Received: by qkhu186 with SMTP id u186so38030100qkh.0
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jul 2015 13:20:45 -0700 (PDT)
From: Cory Tusar <cory.tusar@pid1solutions.com>
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org, shawnguo@kernel.org,
 kernel@pengutronix.de, han.xu@freescale.com, dwmw2@infradead.org,
 computersforpeace@gmail.com
Cc: stefan@agner.ch, linux@arm.linux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, andrew@lunn.ch,
 Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [RFC PATCH 0/7] fsl-quadspi: Allow additional device combinations.
Date: Wed,  1 Jul 2015 16:20:02 -0400
Message-Id: <1435782010-9809-1-git-send-email-cory.tusar@pid1solutions.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series fixes and extends the fsl-quadspi driver to allow for
non-contiguous and non-homogeneous SPI NOR device layouts.  The current
driver assumes that attached devices are all of the same type, and are
populated "in order" beginning with QSPIn_A_CS0.

The updated driver and DT changes make use of the 'reg' property
for each flash to determine the interface and chip select to which each
device is attached.

Patchset was tested on a custom VF610-based board with a single SPI NOR
connected to QSPI0_B_CS0, and also on a Rev. H TWR board with dual SPI
NOR devices connected to QSPI0_A_CS0 and QSPI0_B_CS0.  MTD tests passed
for all devices (readtest, speedtest, and stresstest), and independent
access to both devices was verified on the TWR system.

Regards,
-Cory


Cory Tusar (7):
  ARM: dts: vf610: Add missing QuadSPI register mapping and names.
  ARM: dts: vfxxx: Include support for qspi1 functionality.
  mtd: fsl-quadspi: Support both 24- and 32-bit addressed commands.
  mtd: fsl-quadspi: Use per-device clk_rate.
  mtd: fsl-quadspi: Allow non-contiguous flash layouts.
  mtd: spi-nor: Add support for Micron MT25QL02GC serial flash.
  ARM: dts: vf610-twr: Enable QSPI and map flash devices.

 .../devicetree/bindings/mtd/fsl-quadspi.txt        |  15 +-
 arch/arm/boot/dts/vf610-twr.dts                    |  39 +++
 arch/arm/boot/dts/vfxxx.dtsi                       |  16 +-
 drivers/mtd/spi-nor/fsl-quadspi.c                  | 313 +++++++++++----------
 drivers/mtd/spi-nor/spi-nor.c                      |   1 +
 5 files changed, 232 insertions(+), 152 deletions(-)

-- 
2.3.6

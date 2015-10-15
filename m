Received: from mail-ob0-f172.google.com ([209.85.214.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmmTW-0000ro-Bn
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 17:37:59 +0000
Received: by obbwb3 with SMTP id wb3so44621828obb.0
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2015 10:37:37 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: linux-kernel@vger.kernel.org, rogerq@ti.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org, nsekhar@ti.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, tony@atomide.com
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v2 0/5] mtd: nand: Fix support for NAND DMA prefetch
Date: Thu, 15 Oct 2015 12:37:23 -0500
Message-Id: <1444930648-19313-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NAND DMA prefetch has been broken for awhile and seems to have only
worked for SDMA based devices

This patchset fixes DMA prefetch to work on both EDMA and SDMA devices

Test on:
am335x gp evm
am437x gp evm
am37x gp evm

This patchset depends on Roger Quadros recent v4 GPMC/NAND patchset
https://github.com/rogerq/linux.git
branch: for-v4.4/gpmc-v4

Franklin S Cooper Jr (5):
  mtd: nand: omap2: Support parsing dma channel information from DT
  mtd: nand: omap2: Start dma request before enabling prefetch
  mtd: nand: omap2: Fix high memory dma prefetch transfer
  ARM: dts: am437x/am33xx/omap/dm816x: Add gpmc dma channel
  ARM: OMAP2+: Update GPMC and NAND DT binding documentation

 .../bindings/memory-controllers/omap-gpmc.txt      |  7 +++++-
 .../devicetree/bindings/mtd/gpmc-nand.txt          |  2 ++
 arch/arm/boot/dts/am33xx.dtsi                      |  2 ++
 arch/arm/boot/dts/am4372.dtsi                      |  2 ++
 arch/arm/boot/dts/dm816x.dtsi                      |  2 ++
 arch/arm/boot/dts/omap3.dtsi                       |  2 ++
 arch/arm/boot/dts/omap4.dtsi                       |  2 ++
 arch/arm/boot/dts/omap5.dtsi                       |  2 ++
 drivers/mtd/nand/omap2.c                           | 27 +++++++++-------------
 9 files changed, 31 insertions(+), 17 deletions(-)

-- 
2.6.1

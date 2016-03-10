Received: from mail-ob0-f194.google.com ([209.85.214.194])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adrtV-0001cc-8y
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 04:08:14 +0000
Received: by mail-ob0-f194.google.com with SMTP id hc1so5304664obb.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Mar 2016 20:07:52 -0800 (PST)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: nsekhar@ti.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 rogerq@ti.com, tony@atomide.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v3 0/6] mtd: nand: Fix support for NAND DMA prefetch
Date: Wed,  9 Mar 2016 22:07:35 -0600
Message-Id: <1457582861-20619-1-git-send-email-fcooper@ti.com>
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

This rev is pretty much the same as v2 which was blocked due to
dependencies to Roger's update GPMC/NAND rework.

This updated rev removes this dependency.

Also it fixes an issue that was introduced when the eDMA driver was
recently updated.

Links to rev 2 patchset:
https://patchwork.kernel.org/patch/7408691/
https://patchwork.kernel.org/patch/7408681/
https://patchwork.kernel.org/patch/7408661/
https://patchwork.kernel.org/patch/7408641/
https://patchwork.kernel.org/patch/7408621/

Franklin S Cooper Jr (6):
  memory: omap-gpmc: Store handle to GPMC dev
  ARM: dts: am437x/am33xx: Fix GPMC dma properties
  mtd: nand: omap2: Support parsing dma channel information from DT
  mtd: nand: omap2: Start dma request before enabling prefetch
  mtd: nand: omap2: Fix high memory dma prefetch transfer
  ARM: OMAP2+: Update GPMC and NAND DT binding documentation

 Documentation/devicetree/bindings/bus/ti-gpmc.txt  |  7 +++++-
 .../devicetree/bindings/mtd/gpmc-nand.txt          |  2 +-
 arch/arm/boot/dts/am33xx.dtsi                      |  2 +-
 arch/arm/boot/dts/am4372.dtsi                      |  2 +-
 drivers/memory/omap-gpmc.c                         |  1 +
 drivers/mtd/nand/omap2.c                           | 27 +++++++++-------------
 include/linux/platform_data/mtd-nand-omap2.h       |  2 ++
 7 files changed, 23 insertions(+), 20 deletions(-)

-- 
2.7.0

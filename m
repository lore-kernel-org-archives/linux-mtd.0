Received: from mail-ob0-f193.google.com ([209.85.214.193])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZloZ5-00065h-RY
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 01:39:44 +0000
Received: by obbbh8 with SMTP id bh8so231529obb.0
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 18:39:22 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: linux-kernel@vger.kernel.org, rogerq@ti.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org, nsekhar@ti.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, tony@atomide.com
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 0/5] mtd: nand: Fix support for NAND DMA Prefetch 
Date: Mon, 12 Oct 2015 20:38:53 -0500
Message-Id: <1444700338-27582-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NAND dma prefetch has been broken for awhile and seems to have only
worked for sdma based devices.

This patchset fixes DMA prefetch to work on both edma and sdma devices

Tested on:
am335x general purpose evm
am437x general purpose evm
am37x general purpose evm

This patchset depends on Roger Quadros recent v4 GPMC/NAND patchset

https://github.com/rogerq/linux.git
branch: for-v4.4/gpmc-v4

Franklin S Cooper Jr (5):
  mtd: nand: omap2: Support parsing dma channel information from DT
  mtd: nand: omap2: Start dma request before enabling prefetch
  mtd: nand: omap2: Fix high memory dma prefetch transfer
  ARM: dts: am437x/am33xx/omap3/dm816x: Add gpmc dma channel
  ARM: OMAP2+: Update gpmc and nand DT binding documentation

 .../bindings/memory-controllers/omap-gpmc.txt      |  7 ++++++-
 .../devicetree/bindings/mtd/gpmc-nand.txt          |  2 ++
 arch/arm/boot/dts/am33xx.dtsi                      |  2 ++
 arch/arm/boot/dts/am4372.dtsi                      |  2 ++
 arch/arm/boot/dts/dm816x.dtsi                      |  2 ++
 arch/arm/boot/dts/omap3.dtsi                       |  2 ++
 drivers/mtd/nand/omap2.c                           | 24 ++++++++--------------
 7 files changed, 25 insertions(+), 16 deletions(-)

-- 
2.6.1

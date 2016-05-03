Received: from mail-ob0-f193.google.com ([209.85.214.193])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axeSq-0007LA-PL
 for linux-mtd@lists.infradead.org; Tue, 03 May 2016 17:50:29 +0000
Received: by mail-ob0-f193.google.com with SMTP id o7so1091129obl.2
 for <linux-mtd@lists.infradead.org>; Tue, 03 May 2016 10:50:07 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: robh+dt@kernel.org, boris.brezillon@free-electrons.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, tony@atomide.com,
 rogerq@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 0/2] mtd: nand: omap2: Add EDMA support for NAND DMA prefetch
Date: Tue,  3 May 2016 12:50:04 -0500
Message-Id: <1462297806-11555-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset includes the required patches to enable NAND DMA prefetch
support when using the EDMA.

This patchset depends on my previous patchset to enable NAND DMA prefetch
using the SDMA and Roger's GPMC and NAND rework. Both of these patchsets
are apart of Boris' NAND next patch. Therefore, these patches are also
built on top of this branch.

Also the following patches that fixes GPMC's DMA property are required
and pulled into other trees but are not currently apart of the above
branch:
https://patchwork.ozlabs.org/patch/596014/
https://patchwork.ozlabs.org/patch/596012/

Cooper Jr., Franklin (2):
  mtd: nand: omap2: Support parsing dma channel information from DT
  ARM: OMAP2+: Update GPMC and NAND DT binding documentation

 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt | 7 ++++++-
 Documentation/devicetree/bindings/mtd/gpmc-nand.txt                | 2 +-
 drivers/mtd/nand/omap2.c                                           | 4 +++-
 3 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.7.0

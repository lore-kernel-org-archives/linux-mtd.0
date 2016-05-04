Received: from mail-ob0-f196.google.com ([209.85.214.196])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ay1e5-0004lq-Ho
 for linux-mtd@lists.infradead.org; Wed, 04 May 2016 18:35:38 +0000
Received: by mail-ob0-f196.google.com with SMTP id n2so3429066obo.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2016 11:35:17 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: robh+dt@kernel.org, boris.brezillon@free-electrons.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, rogerq@ti.com,
 tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, nsekhar@ti.com
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v2 0/2] mtd: nand: omap2: Add EDMA support for NAND DMA
 prefetch
Date: Wed,  4 May 2016 13:34:42 -0500
Message-Id: <1462386884-16380-1-git-send-email-fcooper@ti.com>
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

Version 2 changes:
Switched to the new dma_request_chan api which is now preferred.
Add performance numbers to the commit.

Franklin S Cooper Jr (2):
  mtd: nand: omap2: Support parsing dma channel information from DT
  ARM: OMAP2+: Update GPMC and NAND DT binding documentation

 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt | 7 ++++++-
 Documentation/devicetree/bindings/mtd/gpmc-nand.txt                | 2 +-
 drivers/mtd/nand/omap2.c                                           | 7 ++-----
 3 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.7.0

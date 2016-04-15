Received: from mail-oi0-f65.google.com ([209.85.218.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arAMy-0004YA-GN
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 20:29:36 +0000
Received: by mail-oi0-f65.google.com with SMTP id v67so15056584oie.0
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2016 13:29:15 -0700 (PDT)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, tony@atomide.com, rogerq@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 0/2] mtd: nand: omap2: Fix SDMA support for NAND DMA prefetch
Date: Fri, 15 Apr 2016 15:28:57 -0500
Message-Id: <1460752139-12742-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NAND DMA prefetch for SDMA based devices has been broken for awhile. This
patchset fixes it so SOCs that use the SDMA can make use of the NAND
DMA prefetch.

I've decided to split this patchset from the slightly larger patchset that
included EDMA support. Adding EDMA support will be added in a later
patchset.

Tested using the latest master on:
am37 gp evm

Due to a silicon issue Dra7 SoCs are unable to use NAND DMA prefetch.

Cooper Jr., Franklin (2):
  mtd: nand: omap2: Start dma request before enabling prefetch
  mtd: nand: omap2: Fix high memory dma prefetch transfer

 drivers/mtd/nand/omap2.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

-- 
2.7.0

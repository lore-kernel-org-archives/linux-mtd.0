Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1egVsz-0006xp-VL
 for linux-mtd@lists.infradead.org; Tue, 30 Jan 2018 13:23:43 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Miquel Raynal <miquel.raynal@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] mtd: nand: MTD_NAND_MARVELL should depend on HAS_DMA
Date: Tue, 30 Jan 2018 14:23:21 +0100
Message-Id: <1517318601-14793-1-git-send-email-geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If NO_DMA=y:

    ERROR: "bad_dma_ops" [drivers/mtd/nand/marvell_nand.ko] undefined!

Add a dependency on HAS_DMA to fix this.

Fixes: 02f26ecf8c772751 ("mtd: nand: add reworked Marvell NAND controller driver")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index e6b8c59f2c0da7c0..736ac887303c88ba 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -328,7 +328,7 @@ config MTD_NAND_MARVELL
 	tristate "NAND controller support on Marvell boards"
 	depends on PXA3xx || ARCH_MMP || PLAT_ORION || ARCH_MVEBU || \
 		   COMPILE_TEST
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM && HAS_DMA
 	help
 	  This enables the NAND flash controller driver for Marvell boards,
 	  including:
-- 
2.7.4

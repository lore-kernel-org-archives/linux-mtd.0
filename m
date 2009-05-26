Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8tpS-00019B-AJ
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 10:24:29 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] Blackfin NFC Driver: fix hang when using NAND on
	BF527-EZKITs
Date: Tue, 26 May 2009 06:24:14 -0400
Message-Id: <1243333454-673-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1243333454-673-1-git-send-email-vapier@gentoo.org>
References: <1243333454-673-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, Cliff Cai <cliff.cai@analog.com>,
	Bryan Wu <cooloney@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Cliff Cai <cliff.cai@analog.com>

The DMAs have different bit sizes on BF52x and BF54x.  From the PHRM:

"The 16-bit DMA Access Bus (DAB) connects the DMA controller to the
on-chip peripherals, PPI, SPI, Ethernet MAC, the SPORTs, NFC,
HOSTDP and the UARTs."

32-bit DMA won't work for BF52x.

Signed-off-by: Cliff Cai <cliff.cai@analog.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/nand/bf5xx_nand.c |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 2ab42d2..8506e7e 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -496,11 +496,20 @@ static void bf5xx_nand_dma_rw(struct mtd_info *mtd,
 	/* setup DMA register with Blackfin DMA API */
 	set_dma_config(CH_NFC, 0x0);
 	set_dma_start_addr(CH_NFC, (unsigned long) buf);
+
+/* The DMAs have different size on BF52x and BF54x */
+#ifdef CONFIG_BF52x
+	set_dma_x_count(CH_NFC, (page_size >> 1));
+	set_dma_x_modify(CH_NFC, 2);
+	val = DI_EN | WDSIZE_16;
+#endif
+
+#ifdef CONFIG_BF54x
 	set_dma_x_count(CH_NFC, (page_size >> 2));
 	set_dma_x_modify(CH_NFC, 4);
-
-	/* setup write or read operation */
 	val = DI_EN | WDSIZE_32;
+#endif
+	/* setup write or read operation */
 	if (is_read)
 		val |= WNR;
 	set_dma_config(CH_NFC, val);
-- 
1.6.3.1

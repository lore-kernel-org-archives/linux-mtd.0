Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lexg3-0008Us-Un
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 20:26:55 +0000
Message-Id: <200903042001.n24K1TEu028750@imap1.linux-foundation.org>
Subject: [patch 01/15] mtd: Blackfin NFC Driver: do not clobber DMAC1_PERIMUX
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 04 Mar 2009 12:01:29 -0800
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	cooloney@kernel.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

Only set DMAC1_PERIMUX once we have requested and been granted the dma
channel to prevent breaking other peripherals in the error case

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/bf5xx_nand.c |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff -puN drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-do-not-clobber-dmac1_perimux drivers/mtd/nand/bf5xx_nand.c
--- a/drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-do-not-clobber-dmac1_perimux
+++ a/drivers/mtd/nand/bf5xx_nand.c
@@ -552,7 +552,6 @@ static void bf5xx_nand_dma_write_buf(str
 static int bf5xx_nand_dma_init(struct bf5xx_nand_info *info)
 {
 	int ret;
-	unsigned short val;
 
 	/* Do not use dma */
 	if (!hardware_ecc)
@@ -560,13 +559,6 @@ static int bf5xx_nand_dma_init(struct bf
 
 	init_completion(&info->dma_completion);
 
-#ifdef CONFIG_BF54x
-	/* Setup DMAC1 channel mux for NFC which shared with SDH */
-	val = bfin_read_DMAC1_PERIMUX();
-	val &= 0xFFFE;
-	bfin_write_DMAC1_PERIMUX(val);
-	SSYNC();
-#endif
 	/* Request NFC DMA channel */
 	ret = request_dma(CH_NFC, "BF5XX NFC driver");
 	if (ret < 0) {
@@ -574,6 +566,12 @@ static int bf5xx_nand_dma_init(struct bf
 		return ret;
 	}
 
+#ifdef CONFIG_BF54x
+	/* Setup DMAC1 channel mux for NFC which shared with SDH */
+	bfin_write_DMAC1_PERIMUX(bfin_read_DMAC1_PERIMUX() & ~1);
+	SSYNC();
+#endif
+
 	set_dma_callback(CH_NFC, (void *) bf5xx_nand_dma_irq, (void *) info);
 
 	/* Turn off the DMA channel first */
_

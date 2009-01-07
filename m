Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKbT3-0001EN-9l
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 16:41:17 +0000
Received: by wf-out-1314.google.com with SMTP id 28so10155932wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jan 2009 08:41:16 -0800 (PST)
Sender: Bryan Wu <cooloney.lkml@gmail.com>
From: Bryan Wu <cooloney@kernel.org>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Blackfin NFC Driver: do not clobber DMAC1_PERIMUX
Date: Thu,  8 Jan 2009 00:41:57 +0800
Message-Id: <1231346519-28603-2-git-send-email-cooloney@kernel.org>
In-Reply-To: <1231346519-28603-1-git-send-email-cooloney@kernel.org>
References: <1231346519-28603-1-git-send-email-cooloney@kernel.org>
Cc: Bryan Wu <cooloney@kernel.org>, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

only set DMAC1_PERIMUX once we have requested and been granted the dma
channel to prevent breaking other peripherals in the error case

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/nand/bf5xx_nand.c |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 9af2a2c..5c6056e 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -552,7 +552,6 @@ static void bf5xx_nand_dma_write_buf(struct mtd_info *mtd,
 static int bf5xx_nand_dma_init(struct bf5xx_nand_info *info)
 {
 	int ret;
-	unsigned short val;
 
 	/* Do not use dma */
 	if (!hardware_ecc)
@@ -560,13 +559,6 @@ static int bf5xx_nand_dma_init(struct bf5xx_nand_info *info)
 
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
@@ -574,6 +566,12 @@ static int bf5xx_nand_dma_init(struct bf5xx_nand_info *info)
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
-- 
1.5.6

Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8tpR-000190-NL
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 10:24:24 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] Blackfin NFC Driver: remove pointless return value in
	bf5xx_nand_dma_rw
Date: Tue, 26 May 2009 06:24:13 -0400
Message-Id: <1243333454-673-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, Bryan Wu <cooloney@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/nand/bf5xx_nand.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 4c2a67c..2ab42d2 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -458,7 +458,7 @@ static irqreturn_t bf5xx_nand_dma_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int bf5xx_nand_dma_rw(struct mtd_info *mtd,
+static void bf5xx_nand_dma_rw(struct mtd_info *mtd,
 				uint8_t *buf, int is_read)
 {
 	struct bf5xx_nand_info *info = mtd_to_nand_info(mtd);
@@ -512,8 +512,6 @@ static int bf5xx_nand_dma_rw(struct mtd_info *mtd,
 	else
 		bfin_write_NFC_PGCTL(0x2);
 	wait_for_completion(&info->dma_completion);
-
-	return 0;
 }
 
 static void bf5xx_nand_dma_read_buf(struct mtd_info *mtd,
-- 
1.6.3.1

Received: from smtp5-g21.free.fr ([212.27.42.5])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MLFUy-0003ws-ES
	for linux-mtd@lists.infradead.org; Mon, 29 Jun 2009 11:58:19 +0000
From: ebenard@free.fr
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Fix 2k pagesize NAND on i.MX27
Date: Mon, 29 Jun 2009 13:58:01 +0200
Message-Id: <1246276681-7377-1-git-send-email-ebenard@free.fr>
Cc: s.hauer@pengutronix.de, Eric Benard <ebenard@eukrea.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Benard <ebenard@eukrea.com>

This patch allows i.MX27 to support 2k pagesize NAND flash.
We are using a 1.8V NAND flash which datasheet (unfortunatly only
available under NDA) says :
Page size: x8: 2,112 bytes (2,048 + 64 bytes).
Without this patch, all sectors are marked as bad eraseblock.

Signed-off-by: Eric Benard <ebenard@eukrea.com>
Acked-by : Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 76beea4..65b26d5 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -857,6 +857,17 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 	}
 }
 
+/* Define some generic bad / good block scan pattern which are used
+ * while scanning a device for factory marked good / bad blocks. */
+static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+
+static struct nand_bbt_descr smallpage_memorybased = {
+	.options = NAND_BBT_SCAN2NDPAGE,
+	.offs = 5,
+	.len = 1,
+	.pattern = scan_ff_pattern
+};
+
 static int __init mxcnd_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
@@ -973,7 +984,10 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 	}
 
-	host->pagesize_2k = (mtd->writesize == 2048) ? 1 : 0;
+	if (mtd->writesize == 2048) {
+		host->pagesize_2k = 1;
+		this->badblock_pattern = &smallpage_memorybased;
+	}
 
 	if (this->ecc.mode == NAND_ECC_HW) {
 		switch (mtd->oobsize) {
-- 
1.6.0.4

Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0bz4-0004tR-MV
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 14:16:15 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/19] Revert "mtd: mxc_nand: fix 2KiB pagesize NAND on i.MX27"
Date: Wed, 21 Oct 2009 16:13:08 +0200
Message-Id: <1256134406-25251-2-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Eric Benard <ebenard@eukrea.com>,
	Vladimir Barinov <vova.barinov@gmail.com>,
	mathieu.berland@eads.com, jbe@pengutronix.de, sha@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This reverts commit 71b7d0d90d536ae4e70929cc59a1a9f6ba457c6c.
---
 drivers/mtd/nand/mxc_nand.c |   16 +---------------
 1 files changed, 1 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 65b26d5..76beea4 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -857,17 +857,6 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 	}
 }
 
-/* Define some generic bad / good block scan pattern which are used
- * while scanning a device for factory marked good / bad blocks. */
-static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
-
-static struct nand_bbt_descr smallpage_memorybased = {
-	.options = NAND_BBT_SCAN2NDPAGE,
-	.offs = 5,
-	.len = 1,
-	.pattern = scan_ff_pattern
-};
-
 static int __init mxcnd_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
@@ -984,10 +973,7 @@ static int __init mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 	}
 
-	if (mtd->writesize == 2048) {
-		host->pagesize_2k = 1;
-		this->badblock_pattern = &smallpage_memorybased;
-	}
+	host->pagesize_2k = (mtd->writesize == 2048) ? 1 : 0;
 
 	if (this->ecc.mode == NAND_ECC_HW) {
 		switch (mtd->oobsize) {
-- 
1.6.5

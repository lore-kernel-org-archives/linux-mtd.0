Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMggx-00014s-Nm
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:03:05 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/21] mtd: nand: pxa3xx: Configure detected pages-per-block
Date: Thu, 19 Sep 2013 13:01:30 -0300
Message-Id: <1379606505-2529-7-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of relying in the bootloader's value for the NDCR (NAND control
register), set the appropriate bits, corresponding to the detected
pages-per-block number.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 86c343e..996a47d 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -71,14 +71,19 @@
 #define NDCR_PAGE_SZ		(0x1 << 24)
 #define NDCR_NCSX		(0x1 << 23)
 #define NDCR_ND_MODE		(0x3 << 21)
-#define NDCR_NAND_MODE   	(0x0)
 #define NDCR_CLR_PG_CNT		(0x1 << 20)
 #define NDCR_STOP_ON_UNCOR	(0x1 << 19)
 #define NDCR_RD_ID_CNT_MASK	(0x7 << 16)
 #define NDCR_RD_ID_CNT(x)	(((x) << 16) & NDCR_RD_ID_CNT_MASK)
 
 #define NDCR_RA_START		(0x1 << 15)
-#define NDCR_PG_PER_BLK		(0x1 << 14)
+
+#define NDCR_PG_PER_BLK_32	(0x0 << 13)
+#define NDCR_PG_PER_BLK_64	(0x2 << 13)
+#define NDCR_PG_PER_BLK_128	(0x1 << 13)
+#define NDCR_PG_PER_BLK_256	(0x3 << 13)
+#define NDCR_PG_PER_BLK_MASK	(0x3 << 13)
+
 #define NDCR_ND_ARB_EN		(0x1 << 12)
 #define NDCR_INT_MASK           (0xFFF)
 
@@ -948,7 +953,7 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
 
 	ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
 	ndcr |= (host->col_addr_cycles == 2) ? NDCR_RA_START : 0;
-	ndcr |= (f->page_per_block == 64) ? NDCR_PG_PER_BLK : 0;
+	ndcr |= (f->page_per_block == 64) ? NDCR_PG_PER_BLK_64 : 0;
 	ndcr |= (f->page_size == 2048) ? NDCR_PAGE_SZ : 0;
 	ndcr |= (f->flash_width == 16) ? NDCR_DWIDTH_M : 0;
 	ndcr |= (f->dfc_width == 16) ? NDCR_DWIDTH_C : 0;
@@ -1074,6 +1079,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd->priv;
 	uint32_t id = -1;
 	uint64_t chipsize;
+	unsigned int pages_per_blk;
 	int i, ret, num;
 
 	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
@@ -1149,6 +1155,28 @@ KEEP_CONFIG:
 	if (nand_scan_ident(mtd, 1, def))
 		return -ENODEV;
 
+	pages_per_blk = mtd->erasesize / mtd->writesize;
+
+	/* Configure the pages-per-block */
+	switch (pages_per_blk) {
+	case 32:
+		info->reg_ndcr |= NDCR_PG_PER_BLK_32;
+		break;
+	case 64:
+		info->reg_ndcr |= NDCR_PG_PER_BLK_64;
+		break;
+	case 128:
+		info->reg_ndcr |= NDCR_PG_PER_BLK_128;
+		break;
+	case 256:
+		info->reg_ndcr |= NDCR_PG_PER_BLK_256;
+		break;
+	default:
+		dev_warn(&info->pdev->dev,
+			 "unsupported pages-per-block number (%d)\n",
+			 pages_per_blk);
+	}
+
 	/* 1-step ECC over the entire detected page size */
 	chip->ecc.mode = NAND_ECC_HW;
 	chip->ecc.size = mtd->writesize;
-- 
1.8.1.5

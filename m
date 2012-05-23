Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SX5Og-0001vf-HA
 for linux-mtd@lists.infradead.org; Wed, 23 May 2012 06:50:15 +0000
Received: by pbbrq13 with SMTP id rq13so10636502pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 May 2012 23:50:13 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: nand: kill NAND_NO_READRDY
Date: Tue, 22 May 2012 23:50:00 -0700
Message-Id: <1337755800-21085-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Ivan Djelic <ivan.djelic@parrot.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Johan Gunnarsson <johan.gunnarsson@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to its documentation, the NAND_NO_READRDY option is always used
when autoincrement is not supported. Autoincrement support was recently
dropped, so we can drop this options as well (defaulting to "no read ready
check").

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    1 -
 drivers/mtd/nand/fsl_ifc_nand.c  |    1 -
 drivers/mtd/nand/nand_base.c     |   17 -----------------
 drivers/mtd/nand/nand_ids.c      |    4 ++--
 drivers/mtd/nand/pxa3xx_nand.c   |    1 -
 include/linux/mtd/nand.h         |    6 ------
 6 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 7842938..1d8d111 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -805,7 +805,6 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	chip->bbt_md = &bbt_mirror_descr;
 
 	/* set up nand options */
-	chip->options = NAND_NO_READRDY;
 	chip->bbt_options = NAND_BBT_USE_FLASH;
 
 	chip->controller = &elbc_fcm_ctrl->controller;
diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 9602c1b..c5d7f38 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -805,7 +805,6 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	out_be32(&ifc->ifc_nand.ncfgr, 0x0);
 
 	/* set up nand options */
-	chip->options = NAND_NO_READRDY;
 	chip->bbt_options = NAND_BBT_USE_FLASH;
 
 
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d47586c..61805e7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1565,14 +1565,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 					oobreadlen -= toread;
 				}
 			}
-
-			if (!(chip->options & NAND_NO_READRDY)) {
-				/* Apply delay or wait for ready/busy pin */
-				if (!chip->dev_ready)
-					udelay(chip->chip_delay);
-				else
-					nand_wait_ready(mtd);
-			}
 		} else {
 			memcpy(buf, chip->buffers->databuf + col, bytes);
 			buf += bytes;
@@ -1837,14 +1829,6 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 		len = min(len, readlen);
 		buf = nand_transfer_oob(chip, buf, ops, len);
 
-		if (!(chip->options & NAND_NO_READRDY)) {
-			/* Apply delay or wait for ready/busy pin */
-			if (!chip->dev_ready)
-				udelay(chip->chip_delay);
-			else
-				nand_wait_ready(mtd);
-		}
-
 		readlen -= len;
 		if (!readlen)
 			break;
@@ -2915,7 +2899,6 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 		*busw = NAND_BUSWIDTH_16;
 
 	chip->options &= ~NAND_CHIPOPTIONS_MSK;
-	chip->options |= NAND_NO_READRDY & NAND_CHIPOPTIONS_MSK;
 
 	pr_info("ONFI flash detected\n");
 	return 1;
diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 509a9f6..e04c675 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -70,7 +70,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	 * These are the new chips with large page size. The pagesize and the
 	 * erasesize is determined from the extended id bytes
 	 */
-#define LP_OPTIONS (NAND_SAMSUNG_LP_OPTIONS | NAND_NO_READRDY)
+#define LP_OPTIONS NAND_SAMSUNG_LP_OPTIONS
 #define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
 
 	/* 512 Megabit */
@@ -157,7 +157,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	 * writes possible, but not implemented now
 	 */
 	{"AND 128MiB 3,3V 8-bit",	0x01, 2048, 128, 0x4000,
-	 NAND_IS_AND | NAND_NO_READRDY | NAND_4PAGE_ARRAY | BBT_AUTO_REFRESH},
+	 NAND_IS_AND | NAND_4PAGE_ARRAY | BBT_AUTO_REFRESH},
 
 	{NULL,}
 };
diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 252aaef..afc4681 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1005,7 +1005,6 @@ KEEP_CONFIG:
 	chip->ecc.size = host->page_size;
 	chip->ecc.strength = 1;
 
-	chip->options |= NAND_NO_READRDY;
 	if (host->reg_ndcr & NDCR_DWIDTH_M)
 		chip->options |= NAND_BUSWIDTH_16;
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 53dcf49..a81ac89 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -185,12 +185,6 @@ typedef enum {
  * This happens with the Renesas AG-AND chips, possibly others.
  */
 #define BBT_AUTO_REFRESH	0x00000080
-/*
- * Chip does not require ready check on read. True
- * for all large page devices, as they do not support
- * autoincrement.
- */
-#define NAND_NO_READRDY		0x00000100
 /* Chip does not allow subpage writes */
 #define NAND_NO_SUBPAGE_WRITE	0x00000200
 

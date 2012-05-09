Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SS3t5-00073v-Ia
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 10:39:03 +0000
Received: by wgbds1 with SMTP id ds1so64868wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 09 May 2012 03:06:40 -0700 (PDT)
Date: Wed, 9 May 2012 13:06:35 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: nand: remove 'sndcmd' parameter of
 'read_oob/read_oob_raw'
Message-ID: <20120509130635.32973038@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As of [mtd: nand: remove autoincrement 'sndcmd' code], the
NAND_CMD_READ0 command is issued unconditionally.

Thus, read_oob/read_oob_raw's 'sndcmd' argument is no longer needed, as
well as their return code.

Remove the 'sndcmd' parameter, and set the return code to 0.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
 drivers/mtd/nand/cafe_nand.c           |    4 ++--
 drivers/mtd/nand/denali.c              |    5 ++---
 drivers/mtd/nand/docg4.c               |    2 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    8 ++------
 drivers/mtd/nand/nand_base.c           |   19 +++++++------------
 drivers/mtd/nand/r852.c                |    9 +++------
 include/linux/mtd/nand.h               |    5 ++---
 7 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 3a6c88d..41371ba 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -364,11 +364,11 @@ static int cafe_nand_write_oob(struct mtd_info *mtd,
 
 /* Don't use -- use nand_read_oob_std for now */
 static int cafe_nand_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
-			      int page, int sndcmd)
+			      int page)
 {
 	chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
 	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
-	return 1;
+	return 0;
 }
 /**
  * cafe_nand_read_page_syndrome - [REPLACEABLE] hardware ecc syndrome based page read
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index a54c186..0650aaf 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1113,12 +1113,11 @@ static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 static int denali_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
-			   int page, int sndcmd)
+			   int page)
 {
 	read_oob_data(mtd, chip->oob_poi, page);
 
-	return 0; /* notify NAND core to send command to
-			   NAND device. */
+	return 0;
 }
 
 static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 1f8485d..a225e49 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -799,7 +799,7 @@ static int docg4_read_page(struct mtd_info *mtd, struct nand_chip *nand,
 }
 
 static int docg4_read_oob(struct mtd_info *mtd, struct nand_chip *nand,
-			  int page, int sndcmd)
+			  int page)
 {
 	struct docg4_priv *doc = nand->priv;
 	void __iomem *docptr = doc->virtadr;
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index dcf4152..9079ebf 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1070,7 +1070,7 @@ exit_auxiliary:
  * this driver.
  */
 static int gpmi_ecc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
-				int page, int sndcmd)
+				int page)
 {
 	struct gpmi_nand_data *this = chip->priv;
 
@@ -1093,11 +1093,7 @@ static int gpmi_ecc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->oob_poi[0] = chip->read_byte(mtd);
 	}
 
-	/*
-	 * Return true, indicating that the next call to this function must send
-	 * a command.
-	 */
-	return true;
+	return 0;
 }
 
 static int
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 14e9b32..4047d7c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1645,17 +1645,13 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @page: page number to read
- * @sndcmd: flag whether to issue read command or not
  */
 static int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
-			     int page, int sndcmd)
+			     int page)
 {
-	if (sndcmd) {
-		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
-		sndcmd = 0;
-	}
+	chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
 	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
-	return sndcmd;
+	return 0;
 }
 
 /**
@@ -1664,10 +1660,9 @@ static int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @page: page number to read
- * @sndcmd: flag whether to issue read command or not
  */
 static int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
-				  int page, int sndcmd)
+				  int page)
 {
 	uint8_t *buf = chip->oob_poi;
 	int length = mtd->oobsize;
@@ -1694,7 +1689,7 @@ static int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 	if (length > 0)
 		chip->read_buf(mtd, bufpoi, length);
 
-	return 1;
+	return 0;
 }
 
 /**
@@ -1831,9 +1826,9 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 
 	while (1) {
 		if (ops->mode == MTD_OPS_RAW)
-			chip->ecc.read_oob_raw(mtd, chip, page, 1);
+			chip->ecc.read_oob_raw(mtd, chip, page);
 		else
-			chip->ecc.read_oob(mtd, chip, page, 1);
+			chip->ecc.read_oob(mtd, chip, page);
 
 		len = min(len, readlen);
 		buf = nand_transfer_oob(chip, buf, ops, len);
diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 859ef31..8cb6277 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -539,14 +539,11 @@ exit:
  * nand_read_oob_syndrome assumes we can send column address - we can't
  */
 static int r852_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
-			     int page, int sndcmd)
+			     int page)
 {
-	if (sndcmd) {
-		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
-		sndcmd = 0;
-	}
+	chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
 	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
-	return sndcmd;
+	return 0;
 }
 
 /*
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c7755f45..57977c6 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -372,9 +372,8 @@ struct nand_ecc_ctrl {
 	int (*write_oob_raw)(struct mtd_info *mtd, struct nand_chip *chip,
 			int page);
 	int (*read_oob_raw)(struct mtd_info *mtd, struct nand_chip *chip,
-			int page, int sndcmd);
-	int (*read_oob)(struct mtd_info *mtd, struct nand_chip *chip, int page,
-			int sndcmd);
+			int page);
+	int (*read_oob)(struct mtd_info *mtd, struct nand_chip *chip, int page);
 	int (*write_oob)(struct mtd_info *mtd, struct nand_chip *chip,
 			int page);
 };
-- 
1.7.9

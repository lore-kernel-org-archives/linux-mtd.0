Received: from smtp.newsguy.com ([74.209.136.69])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVC6V-0004EA-Uz
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 01:03:24 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] backport mtd api change to nand, onenand infrastructure
Date: Mon, 28 Nov 2011 17:02:49 -0800
Message-Id: <1322528569-19734-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mike Dunn <mikedunn@newsguy.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Sukumar Ghorai <s-ghorai@ti.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Backport of the mtd api change to nand and onenand infrastructure code.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/nand/nand_base.c       |   19 ++++++++++++++++---
 drivers/mtd/nand/nand_bbt.c        |   11 ++++++++---
 drivers/mtd/onenand/onenand_base.c |    5 ++++-
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 35b4565..49598c7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1458,6 +1458,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	oob = ops->oobbuf;
 
 	while (1) {
+		__u32 prior_corrected = mtd->ecc_stats.corrected;
+
 		bytes = min(mtd->writesize - col, readlen);
 		aligned = (bytes == mtd->writesize);
 
@@ -1530,8 +1532,11 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			buf += bytes;
 		}
 
-		readlen -= bytes;
+		ops->max_bitflips =
+			max(ops->max_bitflips,
+			    mtd->ecc_stats.corrected - prior_corrected);
 
+		readlen -= bytes;
 		if (!readlen)
 			break;
 
@@ -1580,7 +1585,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
  * Get hold of the chip and call nand_do_read.
  */
 static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
-		     size_t *retlen, uint8_t *buf)
+		     size_t *retlen, uint8_t *buf, unsigned int *max_bitflips)
 {
 	struct nand_chip *chip = mtd->priv;
 	struct mtd_oob_ops ops;
@@ -1598,10 +1603,12 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ops.datbuf = buf;
 	ops.oobbuf = NULL;
 	ops.mode = 0;
+	ops.max_bitflips = 0;
 
 	ret = nand_do_read_ops(mtd, from, &ops);
 
 	*retlen = ops.retlen;
+	*max_bitflips = ops.max_bitflips;
 
 	nand_release_device(mtd);
 
@@ -1799,6 +1806,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	page = realpage & chip->pagemask;
 
 	while (1) {
+		__u32 prior_corrected = mtd->ecc_stats.corrected;
+
 		if (ops->mode == MTD_OPS_RAW)
 			sndcmd = chip->ecc.read_oob_raw(mtd, chip, page, sndcmd);
 		else
@@ -1820,6 +1829,10 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 				nand_wait_ready(mtd);
 		}
 
+		ops->max_bitflips =
+			max(ops->max_bitflips,
+			    mtd->ecc_stats.corrected - prior_corrected);
+
 		readlen -= len;
 		if (!readlen)
 			break;
@@ -1865,7 +1878,7 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	struct nand_chip *chip = mtd->priv;
 	int ret = -ENOTSUPP;
 
-	ops->retlen = 0;
+	ops->retlen = ops->max_bitflips = 0;
 
 	/* Do not allow reads past end of device */
 	if (ops->datbuf && (from + ops->len) > mtd->size) {
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 69148ae..4b1b707 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -191,6 +191,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 	from = ((loff_t)page) << this->page_shift;
 
 	while (totlen) {
+		unsigned int max_bitflips;
 		len = min(totlen, (size_t)(1 << this->bbt_erase_shift));
 		if (marker_len) {
 			/*
@@ -201,7 +202,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 			from += marker_len;
 			marker_len = 0;
 		}
-		res = mtd->read(mtd, from, len, &retlen, buf);
+		res = mtd->read(mtd, from, len, &retlen, buf, &max_bitflips);
 		if (res < 0) {
 			if (mtd_is_eccerr(res)) {
 				pr_info("nand_bbt: ECC error in BBT at "
@@ -293,12 +294,13 @@ static int scan_read_raw_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 {
 	size_t retlen;
 	size_t len;
+	unsigned int max_bitflips;
 
 	len = td->len;
 	if (td->options & NAND_BBT_VERSION)
 		len++;
 
-	return mtd->read(mtd, offs, len, &retlen, buf);
+	return mtd->read(mtd, offs, len, &retlen, buf, &max_bitflips);
 }
 
 /* Scan read raw data from flash */
@@ -753,10 +755,13 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 		/* Must we save the block contents? */
 		if (td->options & NAND_BBT_SAVECONTENT) {
+			unsigned int max_bitflips;
+
 			/* Make it block aligned */
 			to &= ~((loff_t)((1 << this->bbt_erase_shift) - 1));
 			len = 1 << this->bbt_erase_shift;
-			res = mtd->read(mtd, to, len, &retlen, buf);
+			res = mtd->read(mtd, to, len, &retlen, buf,
+					&max_bitflips);
 			if (res < 0) {
 				if (retlen != len) {
 					pr_info("nand_bbt: error reading block "
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a839473..27a140a 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1451,7 +1451,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
  * Read with ecc
 */
 static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
-	size_t *retlen, u_char *buf)
+			size_t *retlen, u_char *buf, unsigned int *max_bitflips)
 {
 	struct onenand_chip *this = mtd->priv;
 	struct mtd_oob_ops ops = {
@@ -1469,6 +1469,7 @@ static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	onenand_release_device(mtd);
 
 	*retlen = ops.retlen;
+	*max_bitflips = mtd_is_bitflip(ret) ? 1 : 0;
 	return ret;
 }
 
@@ -1505,6 +1506,8 @@ static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
 		ret = onenand_read_oob_nolock(mtd, from, ops);
 	onenand_release_device(mtd);
 
+	ops->max_bitflips = mtd_is_bitflip(ret) ? 1 : 0;
+
 	return ret;
 }
 
-- 
1.7.3.4

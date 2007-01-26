Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HASmk-0005zS-Pm
	for linux-mtd@lists.infradead.org; Fri, 26 Jan 2007 10:14:41 -0500
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext12.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l0QFCBfB015518
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2007 17:12:44 +0200
Message-ID: <45BA1A9D.60301@nokia.com>
Date: Fri, 26 Jan 2007 17:13:33 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] OneNAND: Add support for auto-placement of out-of-band
	data
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enable the use of oob operation mode MTD_OOB_AUTO with OneNAND.
Note that MTD_OOB_RAW is still not supported.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |  144 ++++++++++++++++++++++++++++++++---
 1 files changed, 131 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 65acb85..3d1a725 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -787,17 +787,61 @@ static int onenand_read(struct mtd_info 
 }
 
 /**
+ * onenand_transfer_auto_oob - [Internal] oob auto-placement transfer
+ * @param mtd		MTD device structure
+ * @param buf		destination address
+ * @param column	oob offset to read from
+ * @param thislen	oob length to read
+ */
+static int onenand_transfer_auto_oob(struct mtd_info *mtd, uint8_t *buf, int column,
+				int *thislen)
+{
+	struct onenand_chip *this = mtd->priv;
+	struct nand_oobfree *free;
+	int readcol = column;
+	int readend = column + *thislen;
+	int lastgap = 0, len = 0;
+	uint8_t *oob_buf = this->page_buf + mtd->writesize;
+
+	for (free = this->ecclayout->oobfree; free->length; ++free) {
+		if (readcol >= lastgap)
+			readcol += free->offset - lastgap;
+		if (readend >= lastgap)
+			readend += free->offset - lastgap;
+		lastgap = free->offset + free->length;
+	}
+	if (readend > mtd->oobsize)
+		readend = mtd->oobsize;
+	this->read_bufferram(mtd, ONENAND_SPARERAM, oob_buf + readcol,
+			     readcol, readend - readcol);
+	for (free = this->ecclayout->oobfree; free->length; ++free) {
+		int free_end = free->offset + free->length;
+		if (free->offset < readend && free_end > readcol) {
+			int st = max_t(int,free->offset,readcol);
+			int ed = min_t(int,free_end,readend);
+			int n = ed - st;
+			memcpy(buf, oob_buf + st, n);
+			len += n;
+			buf += n;
+		}
+	}
+	*thislen = len;
+	return 0;
+}
+
+/**
  * onenand_do_read_oob - [MTD Interface] OneNAND read out-of-band
  * @param mtd		MTD device structure
  * @param from		offset to read from
  * @param len		number of bytes to read
  * @param retlen	pointer to variable to store the number of read bytes
  * @param buf		the databuffer to put data
+ * @param mode		operation mode
  *
  * OneNAND read out-of-band data from the spare area
  */
 int onenand_do_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
-			size_t *retlen, u_char *buf)
+			size_t *retlen, u_char *buf, mtd_oob_mode_t mode)
 {
 	struct onenand_chip *this = mtd->priv;
 	int read = 0, thislen, column;
@@ -832,7 +876,10 @@ int onenand_do_read_oob(struct mtd_info 
 		ret = this->wait(mtd, FL_READING);
 		/* First copy data and check return value for ECC handling */
 
-		this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);
+		if (mode == MTD_OOB_AUTO)
+			onenand_transfer_auto_oob(mtd, buf, column, &thislen);
+		else
+			this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);
 
 		if (ret) {
 			DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_oob: read failed = 0x%x\n", ret);
@@ -871,10 +918,18 @@ out:
 static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
-	BUG_ON(ops->mode != MTD_OOB_PLACE);
-
+	switch (ops->mode)
+	{
+	case MTD_OOB_PLACE:
+	case MTD_OOB_AUTO:
+		break;
+	case MTD_OOB_RAW:
+		return -EINVAL; /* Not implemented yet */
+	default:
+		return -EINVAL;
+	}
 	return onenand_do_read_oob(mtd, from + ops->ooboffs, ops->ooblen,
-				   &ops->oobretlen, ops->oobbuf);
+				   &ops->oobretlen, ops->oobbuf, ops->mode);
 }
 
 #ifdef CONFIG_MTD_ONENAND_VERIFY_WRITE
@@ -1060,17 +1115,58 @@ static int onenand_write(struct mtd_info
 }
 
 /**
+ * onenand_fill_auto_oob - [Internal] oob auto-placement transfer
+ * @param mtd		MTD device structure
+ * @param oob_buf	oob buffer
+ * @param buf		source address
+ * @param column	oob offset to write to
+ * @param thislen	oob length to write
+ */
+static void onenand_fill_auto_oob(struct mtd_info *mtd, u_char *oob_buf,
+				  const u_char *buf, int column, int *thislen)
+{
+	struct onenand_chip *this = mtd->priv;
+	struct nand_oobfree *free;
+	int writecol = column;
+	int writeend = column + *thislen;
+	int lastgap = 0, len = 0;
+
+	for (free = this->ecclayout->oobfree; free->length; ++free) {
+		if (writecol >= lastgap)
+			writecol += free->offset - lastgap;
+		if (writeend >= lastgap)
+			writeend += free->offset - lastgap;
+		lastgap = free->offset + free->length;
+	}
+	if (writeend > mtd->oobsize)
+		writeend = mtd->oobsize;
+	for (free = this->ecclayout->oobfree; free->length; ++free) {
+		int free_end = free->offset + free->length;
+		if (free->offset < writeend && free_end > writecol) {
+			int st = max_t(int,free->offset,writecol);
+			int ed = min_t(int,free_end,writeend);
+			int n = ed - st;
+			memcpy(oob_buf + st, buf, n);
+			len += n;
+			buf += n;
+		}
+	}
+	*thislen = len;
+}
+
+/**
  * onenand_do_write_oob - [Internal] OneNAND write out-of-band
  * @param mtd		MTD device structure
  * @param to		offset to write to
  * @param len		number of bytes to write
  * @param retlen	pointer to variable to store the number of written bytes
  * @param buf		the data to write
+ * @param mode		operation mode
  *
  * OneNAND write out-of-band
  */
 static int onenand_do_write_oob(struct mtd_info *mtd, loff_t to, size_t len,
-				size_t *retlen, const u_char *buf)
+				size_t *retlen, const u_char *buf, mtd_oob_mode_t mode)
 {
 	struct onenand_chip *this = mtd->priv;
 	int column, ret = 0;
@@ -1103,7 +1199,10 @@ static int onenand_do_write_oob(struct m
 		/* We send data to spare ram with oobsize
 		 * to prevent byte access */
 		memset(this->page_buf, 0xff, mtd->oobsize);
-		memcpy(this->page_buf + column, buf, thislen);
+		if (mode == MTD_OOB_AUTO)
+			onenand_fill_auto_oob(mtd, this->page_buf, buf, column, &thislen);
+		else
+			memcpy(this->page_buf + column, buf, thislen);
 		this->write_bufferram(mtd, ONENAND_SPARERAM, this->page_buf, 0, mtd->oobsize);
 
 		this->command(mtd, ONENAND_CMD_PROGOOB, to, mtd->oobsize);
@@ -1116,7 +1215,7 @@ static int onenand_do_write_oob(struct m
 			goto out;
 		}
 
-		ret = onenand_verify_oob(mtd, buf, to, thislen);
+		ret = onenand_verify_oob(mtd, this->page_buf, to, thislen);
 		if (ret) {
 			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: verify failed %d\n", ret);
 			goto out;
@@ -1149,10 +1248,18 @@ out:
 static int onenand_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
-	BUG_ON(ops->mode != MTD_OOB_PLACE);
-
+	switch (ops->mode)
+	{
+	case MTD_OOB_PLACE:
+	case MTD_OOB_AUTO:
+		break;
+	case MTD_OOB_RAW:
+		return -EINVAL; /* Not implemented yet */
+	default:
+		return -EINVAL;
+	}
 	return onenand_do_write_oob(mtd, to + ops->ooboffs, ops->ooblen,
-				    &ops->oobretlen, ops->oobbuf);
+				    &ops->oobretlen, ops->oobbuf, ops->mode);
 }
 
 /**
@@ -1318,7 +1425,7 @@ static int onenand_default_block_markbad
 
         /* We write two bytes, so we dont have to mess with 16 bit access */
         ofs += mtd->oobsize + (bbm->badblockpos & ~0x01);
-        return onenand_do_write_oob(mtd, ofs , 2, &retlen, buf);
+        return onenand_do_write_oob(mtd, ofs , 2, &retlen, buf, MTD_OOB_PLACE);
 }
 
 /**
@@ -1612,7 +1719,7 @@ static int do_otp_lock(struct mtd_info *
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
 
-	ret = onenand_do_write_oob(mtd, from, len, retlen, buf);
+	ret = onenand_do_write_oob(mtd, from, len, retlen, buf, MTD_OOB_PLACE);
 
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
@@ -2020,6 +2127,7 @@ static void onenand_resume(struct mtd_in
  */
 int onenand_scan(struct mtd_info *mtd, int maxchips)
 {
+	int i;
 	struct onenand_chip *this = mtd->priv;
 
 	if (!this->read_word)
@@ -2091,6 +2199,16 @@ int onenand_scan(struct mtd_info *mtd, i
 	}
 
 	this->subpagesize = mtd->writesize >> mtd->subpage_sft;
+
+	/*
+	 * The number of bytes available for a client to place data into
+	 * the out of band area
+	 */
+	this->ecclayout->oobavail = 0;
+	for (i = 0; this->ecclayout->oobfree[i].length; i++)
+		this->ecclayout->oobavail +=
+			this->ecclayout->oobfree[i].length;
+
 	mtd->ecclayout = this->ecclayout;
 
 	/* Fill in remaining MTD driver data */
-- 
1.4.3

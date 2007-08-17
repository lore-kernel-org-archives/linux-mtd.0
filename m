Received: from [210.94.41.89] (helo=july7)
	by canuck.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1ILund-00086i-As
	for linux-mtd@lists.infradead.org; Fri, 17 Aug 2007 01:55:11 -0400
From: "Kyungmin Park" <kyungmin.park@samsung.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH] [MTD] [OneNAND] main read/write ops support for yaffs2
Date: Fri, 17 Aug 2007 14:55:05 +0900
Message-ID: <003601c7e093$2b2f6850$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[MTD] [OneNAND] main read/write ops support for yaffs2

Now we can use yaffs2 on OneNAND

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com
--
diff --git a/drivers/mtd/onenand/onenand_base.c
b/drivers/mtd/onenand/onenand_base.c
index 45bc143..40d8d6f 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -763,31 +763,83 @@ static void onenand_release_device(struct mtd_info
*mtd)
 }
 
 /**
- * onenand_read - [MTD Interface] Read data from flash
+ * onenand_transfer_auto_oob - [Internal] oob auto-placement transfer
+ * @param mtd		MTD device structure
+ * @param buf		destination address
+ * @param column	oob offset to read from
+ * @param thislen	oob length to read
+ */
+static int onenand_transfer_auto_oob(struct mtd_info *mtd, uint8_t *buf,
int column,
+				int thislen)
+{
+	struct onenand_chip *this = mtd->priv;
+	struct nand_oobfree *free;
+	int readcol = column;
+	int readend = column + thislen;
+	int lastgap = 0;
+	unsigned int i;
+	uint8_t *oob_buf = this->oob_buf;
+
+	free = this->ecclayout->oobfree;
+	for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES && free->length; i++,
free++) {
+		if (readcol >= lastgap)
+			readcol += free->offset - lastgap;
+		if (readend >= lastgap)
+			readend += free->offset - lastgap;
+		lastgap = free->offset + free->length;
+	}
+	this->read_bufferram(mtd, ONENAND_SPARERAM, oob_buf, 0,
mtd->oobsize);
+	free = this->ecclayout->oobfree;
+	for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES && free->length; i++,
free++) {
+		int free_end = free->offset + free->length;
+		if (free->offset < readend && free_end > readcol) {
+			int st = max_t(int,free->offset,readcol);
+			int ed = min_t(int,free_end,readend);
+			int n = ed - st;
+			memcpy(buf, oob_buf + st, n);
+			buf += n;
+		} else if (column == 0)
+			break;
+	}
+	return 0;
+}
+
+/**
+ * onenand_read_ops - [OneNAND Interface] OneNAND read main and/or
out-of-band
  * @param mtd		MTD device structure
  * @param from		offset to read from
- * @param len		number of bytes to read
- * @param retlen	pointer to variable to store the number of read
bytes
- * @param buf		the databuffer to put data
+ * @param ops:		oob operation description structure
  *
- * Read with ecc
-*/
-static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
-	size_t *retlen, u_char *buf)
+ * OneNAND read main and/or out-of-band data
+ */
+static int onenand_read_ops(struct mtd_info *mtd, loff_t from,
+				struct mtd_oob_ops *ops)
 {
 	struct onenand_chip *this = mtd->priv;
 	struct mtd_ecc_stats stats;
-	int read = 0, column;
-	int thislen;
+	size_t len = ops->len;
+	size_t ooblen = ops->ooblen;
+	u_char *buf = ops->datbuf;
+	u_char *oobbuf = ops->oobbuf;
+	int read = 0, column, thislen;
+	int oobread = 0, oobcolumn, thisooblen, oobsize;
 	int ret = 0, boundary = 0;
 	int writesize = this->writesize;
 
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read: from = 0x%08x, len = %i\n",
(unsigned int) from, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_ops: from = 0x%08x, len =
%i\n", (unsigned int) from, (int) len);
+
+	if (ops->mode == MTD_OOB_AUTO)
+		oobsize = this->ecclayout->oobavail;
+	else
+		oobsize = mtd->oobsize;
+
+	oobcolumn = from & (mtd->oobsize - 1);
 
 	/* Do not allow reads past end of device */
 	if ((from + len) > mtd->size) {
-		printk(KERN_ERR "onenand_read: Attempt read beyond end of
device\n");
-		*retlen = 0;
+		printk(KERN_ERR "onenand_read_ops: Attempt read beyond end
of device\n");
+		ops->retlen = 0;
+		ops->oobretlen = 0;
 		return -EINVAL;
 	}
 
@@ -832,6 +884,21 @@ static int onenand_read(struct mtd_info *mtd, loff_t
from, size_t len,
  		}
  		/* While load is going, read from last bufferRAM */
  		this->read_bufferram(mtd, ONENAND_DATARAM, buf, column,
thislen);
+
+		/* Read oob area if needed */
+		if (oobbuf) {
+			thisooblen = oobsize - oobcolumn;
+			thisooblen = min_t(int, thisooblen, ooblen -
oobread);
+
+			if (ops->mode == MTD_OOB_AUTO)
+				onenand_transfer_auto_oob(mtd, oobbuf,
oobcolumn, thisooblen);
+			else
+				this->read_bufferram(mtd, ONENAND_SPARERAM,
oobbuf, oobcolumn, thisooblen);
+			oobread += thisooblen;
+			oobbuf += thisooblen;
+			oobcolumn = 0;
+		}
+
  		/* See if we are done */
  		read += thislen;
  		if (read == len)
@@ -857,7 +924,8 @@ static int onenand_read(struct mtd_info *mtd, loff_t
from, size_t len,
 	 * fs driver will take care of that, because
 	 * retlen == desired len and result == -EBADMSG
 	 */
-	*retlen = read;
+	ops->retlen = read;
+	ops->oobretlen = oobread;
 
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;
@@ -869,55 +937,10 @@ static int onenand_read(struct mtd_info *mtd, loff_t
from, size_t len,
 }
 
 /**
- * onenand_transfer_auto_oob - [Internal] oob auto-placement transfer
- * @param mtd		MTD device structure
- * @param buf		destination address
- * @param column	oob offset to read from
- * @param thislen	oob length to read
- */
-static int onenand_transfer_auto_oob(struct mtd_info *mtd, uint8_t *buf,
int column,
-				int thislen)
-{
-	struct onenand_chip *this = mtd->priv;
-	struct nand_oobfree *free;
-	int readcol = column;
-	int readend = column + thislen;
-	int lastgap = 0;
-	unsigned int i;
-	uint8_t *oob_buf = this->oob_buf;
-
-	free = this->ecclayout->oobfree;
-	for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES && free->length; i++,
free++) {
-		if (readcol >= lastgap)
-			readcol += free->offset - lastgap;
-		if (readend >= lastgap)
-			readend += free->offset - lastgap;
-		lastgap = free->offset + free->length;
-	}
-	this->read_bufferram(mtd, ONENAND_SPARERAM, oob_buf, 0,
mtd->oobsize);
-	free = this->ecclayout->oobfree;
-	for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES && free->length; i++,
free++) {
-		int free_end = free->offset + free->length;
-		if (free->offset < readend && free_end > readcol) {
-			int st = max_t(int,free->offset,readcol);
-			int ed = min_t(int,free_end,readend);
-			int n = ed - st;
-			memcpy(buf, oob_buf + st, n);
-			buf += n;
-		} else if (column == 0)
-			break;
-	}
-	return 0;
-}
-
-/**
  * onenand_do_read_oob - [MTD Interface] OneNAND read out-of-band
  * @param mtd		MTD device structure
  * @param from		offset to read from
- * @param len		number of bytes to read
- * @param retlen	pointer to variable to store the number of read
bytes
- * @param buf		the databuffer to put data
- * @param mode		operation mode
+ * @param ops:		oob operation description structure
  *
  * OneNAND read out-of-band data from the spare area
  */
@@ -1007,10 +1030,39 @@ static int onenand_do_read_oob(struct mtd_info *mtd,
loff_t from,
 }
 
 /**
- * onenand_read_oob - [MTD Interface] NAND write data and/or out-of-band
+ * onenand_read - [MTD Interface] Read data from flash
+ * @param mtd		MTD device structure
+ * @param from		offset to read from
+ * @param len		number of bytes to read
+ * @param retlen	pointer to variable to store the number of read
bytes
+ * @param buf		the databuffer to put data
+ *
+ * Read with ecc
+*/
+static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
+	size_t *retlen, u_char *buf)
+{
+	struct mtd_oob_ops ops = {
+		.len	= len,
+		.ooblen	= 0,
+		.datbuf	= buf,
+		.oobbuf	= NULL,
+	};
+	int ret;
+
+	ret = onenand_read_ops(mtd, from, &ops);
+	*retlen = ops.retlen;
+
+	return ret;
+}
+
+/**
+ * onenand_read_oob - [MTD Interface] Read main and/or out-of-band
  * @param mtd:		MTD device structure
  * @param from:		offset to read from
  * @param ops:		oob operation description structure
+
+ * Read main and/or out-of-band
  */
 static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
@@ -1024,6 +1076,10 @@ static int onenand_read_oob(struct mtd_info *mtd,
loff_t from,
 	default:
 		return -EINVAL;
 	}
+
+	if (ops->datbuf)
+		return onenand_read_ops(mtd, from, ops);
+
 	return onenand_do_read_oob(mtd, from, ops);
 }
 
@@ -1148,7 +1204,6 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t
from,
  * @param mtd		MTD device structure
  * @param buf		the databuffer to verify
  * @param to		offset to read from
- *
  */
 static int onenand_verify_oob(struct mtd_info *mtd, const u_char *buf,
loff_t to)
 {
@@ -1176,7 +1231,6 @@ static int onenand_verify_oob(struct mtd_info *mtd,
const u_char *buf, loff_t to
  * @param buf          the databuffer to verify
  * @param addr         offset to read from
  * @param len          number of bytes to read and compare
- *
  */
 static int onenand_verify(struct mtd_info *mtd, const u_char *buf, loff_t
addr, size_t len)
 {
@@ -1222,27 +1276,72 @@ static int onenand_verify(struct mtd_info *mtd,
const u_char *buf, loff_t addr,
 #define NOTALIGNED(x)	((x & (this->subpagesize - 1)) != 0)
 
 /**
- * onenand_write - [MTD Interface] write buffer to FLASH
+ * onenand_fill_auto_oob - [Internal] oob auto-placement transfer
+ * @param mtd		MTD device structure
+ * @param oob_buf	oob buffer
+ * @param buf		source address
+ * @param column	oob offset to write to
+ * @param thislen	oob length to write
+ */
+static int onenand_fill_auto_oob(struct mtd_info *mtd, u_char *oob_buf,
+				  const u_char *buf, int column, int
thislen)
+{
+	struct onenand_chip *this = mtd->priv;
+	struct nand_oobfree *free;
+	int writecol = column;
+	int writeend = column + thislen;
+	int lastgap = 0;
+	unsigned int i;
+
+	free = this->ecclayout->oobfree;
+	for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES && free->length; i++,
free++) {
+		if (writecol >= lastgap)
+			writecol += free->offset - lastgap;
+		if (writeend >= lastgap)
+			writeend += free->offset - lastgap;
+		lastgap = free->offset + free->length;
+	}
+	free = this->ecclayout->oobfree;
+	for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES && free->length; i++,
free++) {
+		int free_end = free->offset + free->length;
+		if (free->offset < writeend && free_end > writecol) {
+			int st = max_t(int,free->offset,writecol);
+			int ed = min_t(int,free_end,writeend);
+			int n = ed - st;
+			memcpy(oob_buf + st, buf, n);
+			buf += n;
+		} else if (column == 0)
+			break;
+	}
+	return 0;
+}
+
+/**
+ * onenand_write_ops - [OneNAND Interface] write main and/or out-of-band
  * @param mtd		MTD device structure
  * @param to		offset to write to
- * @param len		number of bytes to write
- * @param retlen	pointer to variable to store the number of written
bytes
- * @param buf		the data to write
+ * @param ops		oob operation description structure
  *
- * Write with ECC
+ * Write main and/or oob with ECC
  */
-static int onenand_write(struct mtd_info *mtd, loff_t to, size_t len,
-	size_t *retlen, const u_char *buf)
+static int onenand_write_ops(struct mtd_info *mtd, loff_t to,
+				struct mtd_oob_ops *ops)
 {
 	struct onenand_chip *this = mtd->priv;
-	int written = 0;
+	int written = 0, column, thislen, subpage;
+	int oobwritten = 0, oobcolumn, thisooblen, oobsize;
+	size_t len = ops->len;
+	size_t ooblen = ops->ooblen;
+	const u_char *buf = ops->datbuf;
+	const u_char *oob = ops->oobbuf;
+	u_char *oobbuf;
 	int ret = 0;
-	int column, subpage;
 
 	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write: to = 0x%08x, len = %i\n",
(unsigned int) to, (int) len);
 
 	/* Initialize retlen, in case of early exit */
-	*retlen = 0;
+	ops->retlen = 0;
+	ops->oobretlen = 0;
 
 	/* Do not allow writes past end of device */
 	if (unlikely((to + len) > mtd->size)) {
@@ -1256,6 +1355,13 @@ static int onenand_write(struct mtd_info *mtd, loff_t
to, size_t len,
                 return -EINVAL;
         }
 
+	if (ops->mode == MTD_OOB_AUTO)
+		oobsize = this->ecclayout->oobavail;
+	else
+		oobsize = mtd->oobsize;
+
+	oobcolumn = to & (mtd->oobsize - 1);
+
 	column = to & (mtd->writesize - 1);
 
 	/* Grab the lock and see if the device is available */
@@ -1263,9 +1369,11 @@ static int onenand_write(struct mtd_info *mtd, loff_t
to, size_t len,
 
 	/* Loop until all data write */
 	while (written < len) {
-		int thislen = min_t(int, mtd->writesize - column, len -
written);
 		u_char *wbuf = (u_char *) buf;
 
+		thislen = min_t(int, mtd->writesize - column, len -
written);
+		thisooblen = min_t(int, oobsize - oobcolumn, ooblen -
oobwritten);
+
 		cond_resched();
 
 		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, thislen);
@@ -1279,7 +1387,25 @@ static int onenand_write(struct mtd_info *mtd, loff_t
to, size_t len,
 		}
 
 		this->write_bufferram(mtd, ONENAND_DATARAM, wbuf, 0,
mtd->writesize);
-		this->write_bufferram(mtd, ONENAND_SPARERAM, ffchars, 0,
mtd->oobsize);
+
+		if (oob) {
+			oobbuf = this->oob_buf;
+
+			/* We send data to spare ram with oobsize
+			 * to prevent byte access */
+			memset(oobbuf, 0xff, mtd->oobsize);
+			if (ops->mode == MTD_OOB_AUTO)
+				onenand_fill_auto_oob(mtd, oobbuf, oob,
oobcolumn, thisooblen);
+			else
+				memcpy(oobbuf + oobcolumn, oob, thisooblen);
+
+			oobwritten += thisooblen;
+			oob += thisooblen;
+			oobcolumn = 0;
+		} else
+			oobbuf = (u_char *) ffchars;
+
+		this->write_bufferram(mtd, ONENAND_SPARERAM, oobbuf, 0,
mtd->oobsize);
 
 		this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
 
@@ -1317,51 +1443,11 @@ static int onenand_write(struct mtd_info *mtd,
loff_t to, size_t len,
 	/* Deselect and wake up anyone waiting on the device */
 	onenand_release_device(mtd);
 
-	*retlen = written;
+	ops->retlen = written;
 
 	return ret;
 }
 
-/**
- * onenand_fill_auto_oob - [Internal] oob auto-placement transfer
- * @param mtd		MTD device structure
- * @param oob_buf	oob buffer
- * @param buf		source address
- * @param column	oob offset to write to
- * @param thislen	oob length to write
- */
-static int onenand_fill_auto_oob(struct mtd_info *mtd, u_char *oob_buf,
-				  const u_char *buf, int column, int
thislen)
-{
-	struct onenand_chip *this = mtd->priv;
-	struct nand_oobfree *free;
-	int writecol = column;
-	int writeend = column + thislen;
-	int lastgap = 0;
-	unsigned int i;
-
-	free = this->ecclayout->oobfree;
-	for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES && free->length; i++,
free++) {
-		if (writecol >= lastgap)
-			writecol += free->offset - lastgap;
-		if (writeend >= lastgap)
-			writeend += free->offset - lastgap;
-		lastgap = free->offset + free->length;
-	}
-	free = this->ecclayout->oobfree;
-	for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES && free->length; i++,
free++) {
-		int free_end = free->offset + free->length;
-		if (free->offset < writeend && free_end > writecol) {
-			int st = max_t(int,free->offset,writecol);
-			int ed = min_t(int,free_end,writeend);
-			int n = ed - st;
-			memcpy(oob_buf + st, buf, n);
-			buf += n;
-		} else if (column == 0)
-			break;
-	}
-	return 0;
-}
 
 /**
  * onenand_do_write_oob - [Internal] OneNAND write out-of-band
@@ -1479,6 +1565,33 @@ static int onenand_do_write_oob(struct mtd_info *mtd,
loff_t to,
 }
 
 /**
+ * onenand_write - [MTD Interface] write buffer to FLASH
+ * @param mtd		MTD device structure
+ * @param to		offset to write to
+ * @param len		number of bytes to write
+ * @param retlen	pointer to variable to store the number of written
bytes
+ * @param buf		the data to write
+ *
+ * Write with ECC
+ */
+static int onenand_write(struct mtd_info *mtd, loff_t to, size_t len,
+	size_t *retlen, const u_char *buf)
+{
+	struct mtd_oob_ops ops = {
+		.len	= len,
+		.ooblen	= 0,
+		.datbuf	= (u_char *) buf,
+		.oobbuf	= NULL,
+	};
+	int ret;
+
+	ret = onenand_write_ops(mtd, to, &ops);
+	*retlen = ops.retlen;
+
+	return ret;
+}
+
+/**
  * onenand_write_oob - [MTD Interface] NAND write data and/or out-of-band
  * @param mtd:		MTD device structure
  * @param to:		offset to write
@@ -1496,6 +1609,10 @@ static int onenand_write_oob(struct mtd_info *mtd,
loff_t to,
 	default:
 		return -EINVAL;
 	}
+
+	if (ops->datbuf)
+		return onenand_write_ops(mtd, to, ops);
+
 	return onenand_do_write_oob(mtd, to, ops);
 }

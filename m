Received: from [85.21.88.2] (helo=localhost.localdomain)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GiBnN-0000P5-Mj
	for linux-mtd@lists.infradead.org; Thu, 09 Nov 2006 10:26:35 -0500
Date: Thu, 9 Nov 2006 18:26:17 +0300
To: linux-mtd@lists.infradead.org
Subject: [PATCH/RFC] remove len/ooblen confusion in MTD/NAND code: respin
Message-ID: <20061109152617.GB12624@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: vwool@ru.mvista.com (Vitaly Wool)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello folks,

as was discussed between Ricard Wanderlof, David Woodhouse, Artem
Bityutskiy and me, the current API for reading/writing OOB is confusing.
The thing that introduces confusion is the need to specify ops.len
together with ops.ooblen for reads/writes that concern only OOB not data
area. So, ops.len is overloaded: when ops.datbuf != NULL it serves to
specify the length of the data read, and when ops.datbuf == NULL, it
serves to specify the full OOB read length.
The patch inlined differs from the previous one in two aspects:
- it's created against MTD git tree as opposed to the previous one which
  was created against Linus's git tree
- it now handles OOB read length specified in combined reads (the
  previous version just read oobavail bytes from the OOB on each data
  read).
Thanks Artem/Thomas for review.

 drivers/mtd/inftlcore.c      |    6 +----
 drivers/mtd/mtdchar.c        |   12 ++++-------
 drivers/mtd/mtdconcat.c      |   39 +++++++++++++++++++++++---------------
 drivers/mtd/mtdpart.c        |    4 +--
 drivers/mtd/nand/nand_base.c |   44 ++++++++++++++++++++++++++++---------------
 drivers/mtd/nand/nand_bbt.c  |    5 +---
 drivers/mtd/nftlcore.c       |    6 +----
 drivers/mtd/ssfdc.c          |    5 +---
 fs/jffs2/wbuf.c              |   21 ++++++++------------
 include/linux/mtd/mtd.h      |   12 ++++-------
 10 files changed, 82 insertions(+), 72 deletions(-)

Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>

Index: linux-2.6/drivers/mtd/inftlcore.c
===================================================================
--- linux-2.6.orig/drivers/mtd/inftlcore.c
+++ linux-2.6/drivers/mtd/inftlcore.c
@@ -163,10 +163,9 @@ int inftl_read_oob(struct mtd_info *mtd,
 	ops.ooblen = len;
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
-	ops.len = len;
 
 	res = mtd->read_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
-	*retlen = ops.retlen;
+	*retlen = ops.oobretlen;
 	return res;
 }
 
@@ -184,10 +183,9 @@ int inftl_write_oob(struct mtd_info *mtd
 	ops.ooblen = len;
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
-	ops.len = len;
 
 	res = mtd->write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
-	*retlen = ops.retlen;
+	*retlen = ops.oobretlen;
 	return res;
 }
 
Index: linux-2.6/drivers/mtd/nand/nand_base.c
===================================================================
--- linux-2.6.orig/drivers/mtd/nand/nand_base.c
+++ linux-2.6/drivers/mtd/nand/nand_base.c
@@ -897,12 +897,11 @@ static int nand_read_page_syndrome(struc
  * @chip:	nand chip structure
  * @oob:	oob destination address
  * @ops:	oob ops structure
+ * @len:	size of oob to transfer
  */
 static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
-				  struct mtd_oob_ops *ops)
+				  struct mtd_oob_ops *ops, size_t len)
 {
-	size_t len = ops->ooblen;
-
 	switch(ops->mode) {
 
 	case MTD_OOB_PLACE:
@@ -1008,9 +1007,12 @@ static int nand_do_read_ops(struct mtd_i
 			if (unlikely(oob)) {
 				/* Raw mode does data:oob:data:oob */
 				if (ops->mode != MTD_OOB_RAW)
-					oob = nand_transfer_oob(chip, oob, ops);
+					oob = nand_transfer_oob(chip,
+						oob, ops,
+						chip->ecc.layout->oobavail);
 				else
-					buf = nand_transfer_oob(chip, buf, ops);
+					buf = nand_transfer_oob(chip,
+						buf, ops, mtd->oobsize);
 			}
 
 			if (!(chip->options & NAND_NO_READRDY)) {
@@ -1057,6 +1059,8 @@ static int nand_do_read_ops(struct mtd_i
 	}
 
 	ops->retlen = ops->len - (size_t) readlen;
+	if (oob)
+		ops->oobretlen = ops->ooblen;
 
 	if (ret)
 		return ret;
@@ -1257,12 +1261,18 @@ static int nand_do_read_oob(struct mtd_i
 	int page, realpage, chipnr, sndcmd = 1;
 	struct nand_chip *chip = mtd->priv;
 	int blkcheck = (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
-	int readlen = ops->len;
+	int readlen = ops->ooblen;
+	int len;
 	uint8_t *buf = ops->oobbuf;
 
 	DEBUG(MTD_DEBUG_LEVEL3, "nand_read_oob: from = 0x%08Lx, len = %i\n",
 	      (unsigned long long)from, readlen);
 
+	if (ops->mode == MTD_OOB_RAW)
+		len = mtd->oobsize;
+	else
+		len = chip->ecc.layout->oobavail;
+
 	chipnr = (int)(from >> chip->chip_shift);
 	chip->select_chip(mtd, chipnr);
 
@@ -1274,7 +1284,9 @@ static int nand_do_read_oob(struct mtd_i
 
 	while(1) {
 		sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
-		buf = nand_transfer_oob(chip, buf, ops);
+
+		len = min(len, readlen);
+		buf = nand_transfer_oob(chip, buf, ops, len);
 
 		if (!(chip->options & NAND_NO_READRDY)) {
 			/*
@@ -1289,7 +1301,7 @@ static int nand_do_read_oob(struct mtd_i
 				nand_wait_ready(mtd);
 		}
 
-		readlen -= ops->ooblen;
+		readlen -= len;
 		if (!readlen)
 			break;
 
@@ -1311,7 +1323,7 @@ static int nand_do_read_oob(struct mtd_i
 			sndcmd = 1;
 	}
 
-	ops->retlen = ops->len;
+	ops->oobretlen = ops->ooblen;
 	return 0;
 }
 
@@ -1332,7 +1344,7 @@ static int nand_read_oob(struct mtd_info
 	ops->retlen = 0;
 
 	/* Do not allow reads past end of device */
-	if ((from + ops->len) > mtd->size) {
+	if (ops->datbuf && (from + ops->len) > mtd->size) {
 		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
 		      "Attempt read beyond end of device\n");
 		return -EINVAL;
@@ -1654,8 +1666,10 @@ static int nand_do_write_ops(struct mtd_
 		}
 	}
 
-	if (unlikely(oob))
+	if (unlikely(oob)) {
 		memset(chip->oob_poi, 0xff, mtd->oobsize);
+		ops->oobretlen = ops->ooblen;
+	}
 
 	ops->retlen = ops->len - writelen;
 	return ret;
@@ -1713,10 +1727,10 @@ static int nand_do_write_oob(struct mtd_
 	struct nand_chip *chip = mtd->priv;
 
 	DEBUG(MTD_DEBUG_LEVEL3, "nand_write_oob: to = 0x%08x, len = %i\n",
-	      (unsigned int)to, (int)ops->len);
+	      (unsigned int)to, (int)ops->ooblen);
 
 	/* Do not allow write past end of page */
-	if ((ops->ooboffs + ops->len) > mtd->oobsize) {
+	if ((ops->ooboffs + ops->ooblen) > mtd->oobsize) {
 		DEBUG(MTD_DEBUG_LEVEL0, "nand_write_oob: "
 		      "Attempt to write past end of page\n");
 		return -EINVAL;
@@ -1753,7 +1767,7 @@ static int nand_do_write_oob(struct mtd_
 	if (status)
 		return status;
 
-	ops->retlen = ops->len;
+	ops->oobretlen = ops->ooblen;
 
 	return 0;
 }
@@ -1773,7 +1787,7 @@ static int nand_write_oob(struct mtd_inf
 	ops->retlen = 0;
 
 	/* Do not allow writes past end of device */
-	if ((to + ops->len) > mtd->size) {
+	if (ops->datbuf && (to + ops->len) > mtd->size) {
 		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
 		      "Attempt read beyond end of device\n");
 		return -EINVAL;
Index: linux-2.6/drivers/mtd/mtdchar.c
===================================================================
--- linux-2.6.orig/drivers/mtd/mtdchar.c
+++ linux-2.6/drivers/mtd/mtdchar.c
@@ -499,13 +499,12 @@ static int mtd_ioctl(struct inode *inode
 		if (ret)
 			return ret;
 
-		ops.len = buf.length;
 		ops.ooblen = buf.length;
 		ops.ooboffs = buf.start & (mtd->oobsize - 1);
 		ops.datbuf = NULL;
 		ops.mode = MTD_OOB_PLACE;
 
-		if (ops.ooboffs && ops.len > (mtd->oobsize - ops.ooboffs))
+		if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
 			return -EINVAL;
 
 		ops.oobbuf = kmalloc(buf.length, GFP_KERNEL);
@@ -520,7 +519,7 @@ static int mtd_ioctl(struct inode *inode
 		buf.start &= ~(mtd->oobsize - 1);
 		ret = mtd->write_oob(mtd, buf.start, &ops);
 
-		if (copy_to_user(argp + sizeof(uint32_t), &ops.retlen,
+		if (copy_to_user(argp + sizeof(uint32_t), &ops.oobretlen,
 				 sizeof(uint32_t)))
 			ret = -EFAULT;
 
@@ -548,7 +547,6 @@ static int mtd_ioctl(struct inode *inode
 		if (ret)
 			return ret;
 
-		ops.len = buf.length;
 		ops.ooblen = buf.length;
 		ops.ooboffs = buf.start & (mtd->oobsize - 1);
 		ops.datbuf = NULL;
@@ -564,10 +562,10 @@ static int mtd_ioctl(struct inode *inode
 		buf.start &= ~(mtd->oobsize - 1);
 		ret = mtd->read_oob(mtd, buf.start, &ops);
 
-		if (put_user(ops.retlen, (uint32_t __user *)argp))
+		if (put_user(ops.oobretlen, (uint32_t __user *)argp))
 			ret = -EFAULT;
-		else if (ops.retlen && copy_to_user(buf.ptr, ops.oobbuf,
-						    ops.retlen))
+		else if (ops.oobretlen && copy_to_user(buf.ptr, ops.oobbuf,
+						    ops.oobretlen))
 			ret = -EFAULT;
 
 		kfree(ops.oobbuf);
Index: linux-2.6/drivers/mtd/mtdconcat.c
===================================================================
--- linux-2.6.orig/drivers/mtd/mtdconcat.c
+++ linux-2.6/drivers/mtd/mtdconcat.c
@@ -247,7 +247,7 @@ concat_read_oob(struct mtd_info *mtd, lo
 	struct mtd_oob_ops devops = *ops;
 	int i, err, ret = 0;
 
-	ops->retlen = 0;
+	ops->retlen = ops->oobretlen = 0;
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
@@ -263,6 +263,7 @@ concat_read_oob(struct mtd_info *mtd, lo
 
 		err = subdev->read_oob(subdev, from, &devops);
 		ops->retlen += devops.retlen;
+		ops->oobretlen += devops.oobretlen;
 
 		/* Save information about bitflips! */
 		if (unlikely(err)) {
@@ -278,14 +279,18 @@ concat_read_oob(struct mtd_info *mtd, lo
 				return err;
 		}
 
-		devops.len = ops->len - ops->retlen;
-		if (!devops.len)
-			return ret;
-
-		if (devops.datbuf)
+		if (devops.datbuf) {
+			devops.len = ops->len - ops->retlen;
+			if (!devops.len)
+				return ret;
 			devops.datbuf += devops.retlen;
-		if (devops.oobbuf)
-			devops.oobbuf += devops.ooblen;
+		}
+		if (devops.oobbuf) {
+			devops.ooblen = ops->ooblen - ops->oobretlen;
+			if (!devops.ooblen)
+				return ret;
+			devops.oobbuf += ops->oobretlen;
+		}
 
 		from = 0;
 	}
@@ -321,14 +326,18 @@ concat_write_oob(struct mtd_info *mtd, l
 		if (err)
 			return err;
 
-		devops.len = ops->len - ops->retlen;
-		if (!devops.len)
-			return 0;
-
-		if (devops.datbuf)
+		if (devops.datbuf) {
+			devops.len = ops->len - ops->retlen;
+			if (!devops.len)
+				return 0;
 			devops.datbuf += devops.retlen;
-		if (devops.oobbuf)
-			devops.oobbuf += devops.ooblen;
+		}
+		if (devops.oobbuf) {
+			devops.ooblen = ops->ooblen - ops->oobretlen;
+			if (!devops.ooblen)
+				return 0;
+			devops.oobbuf += devops.oobretlen;
+		}
 		to = 0;
 	}
 	return -EINVAL;
Index: linux-2.6/drivers/mtd/nand/nand_bbt.c
===================================================================
--- linux-2.6.orig/drivers/mtd/nand/nand_bbt.c
+++ linux-2.6/drivers/mtd/nand/nand_bbt.c
@@ -333,7 +333,6 @@ static int scan_block_fast(struct mtd_in
 	struct mtd_oob_ops ops;
 	int j, ret;
 
-	ops.len = mtd->oobsize;
 	ops.ooblen = mtd->oobsize;
 	ops.oobbuf = buf;
 	ops.ooboffs = 0;
@@ -676,10 +675,10 @@ static int write_bbt(struct mtd_info *mt
 				       "bad block table\n");
 			}
 			/* Read oob data */
-			ops.len = (len >> this->page_shift) * mtd->oobsize;
+			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
 			ops.oobbuf = &buf[len];
 			res = mtd->read_oob(mtd, to + mtd->writesize, &ops);
-			if (res < 0 || ops.retlen != ops.len)
+			if (res < 0 || ops.oobretlen != ops.ooblen)
 				goto outerr;
 
 			/* Calc the byte offset in the buffer */
Index: linux-2.6/drivers/mtd/nftlcore.c
===================================================================
--- linux-2.6.orig/drivers/mtd/nftlcore.c
+++ linux-2.6/drivers/mtd/nftlcore.c
@@ -147,10 +147,9 @@ int nftl_read_oob(struct mtd_info *mtd, 
 	ops.ooblen = len;
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
-	ops.len = len;
 
 	res = mtd->read_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
-	*retlen = ops.retlen;
+	*retlen = ops.oobretlen;
 	return res;
 }
 
@@ -168,10 +167,9 @@ int nftl_write_oob(struct mtd_info *mtd,
 	ops.ooblen = len;
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
-	ops.len = len;
 
 	res = mtd->write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
-	*retlen = ops.retlen;
+	*retlen = ops.oobretlen;
 	return res;
 }
 
Index: linux-2.6/drivers/mtd/ssfdc.c
===================================================================
--- linux-2.6.orig/drivers/mtd/ssfdc.c
+++ linux-2.6/drivers/mtd/ssfdc.c
@@ -172,13 +172,12 @@ static int read_raw_oob(struct mtd_info 
 
 	ops.mode = MTD_OOB_RAW;
 	ops.ooboffs = 0;
-	ops.ooblen = mtd->oobsize;
-	ops.len = OOB_SIZE;
+	ops.ooblen = OOB_SIZE;
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
 
 	ret = mtd->read_oob(mtd, offs, &ops);
-	if (ret < 0 || ops.retlen != OOB_SIZE)
+	if (ret < 0 || ops.oobretlen != OOB_SIZE)
 		return -1;
 
 	return 0;
Index: linux-2.6/fs/jffs2/wbuf.c
===================================================================
--- linux-2.6.orig/fs/jffs2/wbuf.c
+++ linux-2.6/fs/jffs2/wbuf.c
@@ -968,8 +968,7 @@ int jffs2_check_oob_empty(struct jffs2_s
 	int oobsize = c->mtd->oobsize;
 	struct mtd_oob_ops ops;
 
-	ops.len = NR_OOB_SCAN_PAGES * oobsize;
-	ops.ooblen = oobsize;
+	ops.ooblen = NR_OOB_SCAN_PAGES * oobsize;
 	ops.oobbuf = c->oobbuf;
 	ops.ooboffs = 0;
 	ops.datbuf = NULL;
@@ -982,10 +981,10 @@ int jffs2_check_oob_empty(struct jffs2_s
 		return ret;
 	}
 
-	if (ops.retlen < ops.len) {
+	if (ops.oobretlen < ops.ooblen) {
 		D1(printk(KERN_WARNING "jffs2_check_oob_empty(): Read OOB "
 			  "returned short read (%zd bytes not %d) for block "
-			  "at %08x\n", ops.retlen, ops.len, jeb->offset));
+			  "at %08x\n", ops.oobretlen, ops.ooblen, jeb->offset));
 		return -EIO;
 	}
 
@@ -1004,7 +1003,7 @@ int jffs2_check_oob_empty(struct jffs2_s
 	}
 
 	/* we know, we are aligned :) */
-	for (page = oobsize; page < ops.len; page += sizeof(long)) {
+	for (page = oobsize; page < ops.ooblen; page += sizeof(long)) {
 		long dat = *(long *)(&ops.oobbuf[page]);
 		if(dat != -1)
 			return 1;
@@ -1032,7 +1031,6 @@ int jffs2_check_nand_cleanmarker (struct
 		return 2;
 	}
 
-	ops.len = oobsize;
 	ops.ooblen = oobsize;
 	ops.oobbuf = c->oobbuf;
 	ops.ooboffs = 0;
@@ -1047,10 +1045,10 @@ int jffs2_check_nand_cleanmarker (struct
 		return ret;
 	}
 
-	if (ops.retlen < ops.len) {
+	if (ops.oobretlen < ops.ooblen) {
 		D1 (printk (KERN_WARNING "jffs2_check_nand_cleanmarker(): "
 			    "Read OOB return short read (%zd bytes not %d) "
-			    "for block at %08x\n", ops.retlen, ops.len,
+			    "for block at %08x\n", ops.oobretlen, ops.ooblen,
 			    jeb->offset));
 		return -EIO;
 	}
@@ -1089,8 +1087,7 @@ int jffs2_write_nand_cleanmarker(struct 
 	n.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
 	n.totlen = cpu_to_je32(8);
 
-	ops.len = c->fsdata_len;
-	ops.ooblen = c->fsdata_len;;
+	ops.ooblen = c->fsdata_len;
 	ops.oobbuf = (uint8_t *)&n;
 	ops.ooboffs = c->fsdata_pos;
 	ops.datbuf = NULL;
@@ -1104,10 +1101,10 @@ int jffs2_write_nand_cleanmarker(struct 
 			  jeb->offset, ret));
 		return ret;
 	}
-	if (ops.retlen != ops.len) {
+	if (ops.oobretlen != ops.ooblen) {
 		D1(printk(KERN_WARNING "jffs2_write_nand_cleanmarker(): "
 			  "Short write for block at %08x: %zd not %d\n",
-			  jeb->offset, ops.retlen, ops.len));
+			  jeb->offset, ops.oobretlen, ops.ooblen));
 		return -EIO;
 	}
 	return 0;
Index: linux-2.6/drivers/mtd/mtdpart.c
===================================================================
--- linux-2.6.orig/drivers/mtd/mtdpart.c
+++ linux-2.6/drivers/mtd/mtdpart.c
@@ -94,7 +94,7 @@ static int part_read_oob(struct mtd_info
 
 	if (from >= mtd->size)
 		return -EINVAL;
-	if (from + ops->len > mtd->size)
+	if (ops->datbuf && from + ops->len > mtd->size)
 		return -EINVAL;
 	res = part->master->read_oob(part->master, from + part->offset, ops);
 
@@ -161,7 +161,7 @@ static int part_write_oob(struct mtd_inf
 
 	if (to >= mtd->size)
 		return -EINVAL;
-	if (to + ops->len > mtd->size)
+	if (ops->datbuf && to + ops->len > mtd->size)
 		return -EINVAL;
 	return part->master->write_oob(part->master, to + part->offset, ops);
 }
Index: linux-2.6/include/linux/mtd/mtd.h
===================================================================
--- linux-2.6.orig/include/linux/mtd/mtd.h
+++ linux-2.6/include/linux/mtd/mtd.h
@@ -75,15 +75,12 @@ typedef enum {
  * struct mtd_oob_ops - oob operation operands
  * @mode:	operation mode
  *
- * @len:	number of bytes to write/read. When a data buffer is given
- *		(datbuf != NULL) this is the number of data bytes. When
- *		no data buffer is available this is the number of oob bytes.
+ * @len:	number of data bytes to write/read
  *
- * @retlen:	number of bytes written/read. When a data buffer is given
- *		(datbuf != NULL) this is the number of data bytes. When
- *		no data buffer is available this is the number of oob bytes.
+ * @retlen:	number of data bytes written/read
  *
- * @ooblen:	number of oob bytes per page
+ * @ooblen:	number of oob bytes to write/read
+ * @oobretlen:	number of oob bytes written/read
  * @ooboffs:	offset of oob data in the oob area (only relevant when
  *		mode = MTD_OOB_PLACE)
  * @datbuf:	data buffer - if NULL only oob data are read/written
@@ -94,6 +91,7 @@ struct mtd_oob_ops {
 	size_t		len;
 	size_t		retlen;
 	size_t		ooblen;
+	size_t		oobretlen;
 	uint32_t	ooboffs;
 	uint8_t		*datbuf;
 	uint8_t		*oobbuf;

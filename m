Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GhlgV-00024J-Ac
	for linux-mtd@lists.infradead.org; Wed, 08 Nov 2006 06:33:43 -0500
Date: Wed, 8 Nov 2006 14:33:04 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
To: dedekind@infradead.org
Subject: Re: [PATCH/RFC] remove len/ooblen confusion in MTD/NAND code: respin
Message-Id: <20061108143304.c1e8add8.vwool@ru.mvista.com>
In-Reply-To: <1162916453.5628.2.camel@sauron>
References: <20061103182038.f528d960.vwool@ru.mvista.com>
	<1162916453.5628.2.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 07 Nov 2006 18:20:53 +0200
Artem Bityutskiy <dedekind@infradead.org> wrote:
 
> this patch does not apply to mtd-2.6.git:
> 
> patching file drivers/mtd/inftlcore.c
> patching file drivers/mtd/nand/nand_base.c
> Hunk #2 succeeded at 1006 (offset -1 lines).
> Hunk #4 succeeded at 1260 (offset -1 lines).
> Hunk #5 succeeded at 1282 (offset -2 lines).
> Hunk #6 succeeded at 1300 (offset -1 lines).
> Hunk #7 succeeded at 1321 (offset -2 lines).
> Hunk #8 succeeded at 1343 (offset -1 lines).
> Hunk #9 FAILED at 1665.
> Hunk #10 succeeded at 1724 (offset -3 lines).
> Hunk #11 succeeded at 1765 (offset -2 lines).
> Hunk #12 succeeded at 1784 (offset -3 lines).
> 1 out of 12 hunks FAILED -- saving rejects to file
> drivers/mtd/nand/nand_base.c.rej
> patching file drivers/mtd/mtdchar.c
> patching file drivers/mtd/mtdconcat.c
> patching file drivers/mtd/nand/nand_bbt.c
> patching file drivers/mtd/nftlcore.c
> patching file drivers/mtd/ssfdc.c
> patching file fs/jffs2/wbuf.c
> patching file drivers/mtd/mtdpart.c
> patching file include/linux/mtd/mtd.h

Admitted, sorry. I've been diffing against Linus's tree. Here's the patch against mtd.

 drivers/mtd/inftlcore.c      |    6 ++----
 drivers/mtd/mtdchar.c        |   12 +++++-------
 drivers/mtd/mtdconcat.c      |   39 ++++++++++++++++++++++++---------------
 drivers/mtd/mtdpart.c        |    4 ++--
 drivers/mtd/nand/nand_base.c |   42 ++++++++++++++++++++++++++++--------------
 drivers/mtd/nand/nand_bbt.c  |    5 ++---
 drivers/mtd/nftlcore.c       |    6 ++----
 drivers/mtd/ssfdc.c          |    5 ++---
 fs/jffs2/wbuf.c              |   21 +++++++++------------
 include/linux/mtd/mtd.h      |   12 +++++-------
 10 files changed, 81 insertions(+), 71 deletions(-)

Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>

Index: mtd/drivers/mtd/inftlcore.c
===================================================================
--- mtd.orig/drivers/mtd/inftlcore.c
+++ mtd/drivers/mtd/inftlcore.c
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
 
Index: mtd/drivers/mtd/nand/nand_base.c
===================================================================
--- mtd.orig/drivers/mtd/nand/nand_base.c
+++ mtd/drivers/mtd/nand/nand_base.c
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
@@ -1007,9 +1006,12 @@ static int nand_do_read_ops(struct mtd_i
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
@@ -1056,6 +1058,8 @@ static int nand_do_read_ops(struct mtd_i
 	}
 
 	ops->retlen = ops->len - (size_t) readlen;
+	if (oob)
+		ops->oobretlen = ops->ooblen;
 
 	if (ret)
 		return ret;
@@ -1256,12 +1260,18 @@ static int nand_do_read_oob(struct mtd_i
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
 
@@ -1271,7 +1281,9 @@ static int nand_do_read_oob(struct mtd_i
 
 	while(1) {
 		sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
-		buf = nand_transfer_oob(chip, buf, ops);
+
+		len = min(len, readlen);
+		buf = nand_transfer_oob(chip, buf, ops, len);
 
 		if (!(chip->options & NAND_NO_READRDY)) {
 			/*
@@ -1286,7 +1298,7 @@ static int nand_do_read_oob(struct mtd_i
 				nand_wait_ready(mtd);
 		}
 
-		readlen -= ops->ooblen;
+		readlen -= len;
 		if (!readlen)
 			break;
 
@@ -1308,7 +1320,7 @@ static int nand_do_read_oob(struct mtd_i
 			sndcmd = 1;
 	}
 
-	ops->retlen = ops->len;
+	ops->oobretlen = ops->ooblen;
 	return 0;
 }
 
@@ -1329,7 +1341,7 @@ static int nand_read_oob(struct mtd_info
 	ops->retlen = 0;
 
 	/* Do not allow reads past end of device */
-	if ((from + ops->len) > mtd->size) {
+	if (ops->datbuf && (from + ops->len) > mtd->size) {
 		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
 		      "Attempt read beyond end of device\n");
 		return -EINVAL;
@@ -1655,6 +1667,8 @@ static int nand_do_write_ops(struct mtd_
 	}
 
 	ops->retlen = ops->len - writelen;
+	if (unlikely(oob))
+		ops->oobretlen = ops->ooblen;
 	return ret;
 }
 
@@ -1710,10 +1724,10 @@ static int nand_do_write_oob(struct mtd_
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
@@ -1749,7 +1763,7 @@ static int nand_do_write_oob(struct mtd_
 	if (status)
 		return status;
 
-	ops->retlen = ops->len;
+	ops->oobretlen = ops->ooblen;
 
 	return 0;
 }
@@ -1769,7 +1783,7 @@ static int nand_write_oob(struct mtd_inf
 	ops->retlen = 0;
 
 	/* Do not allow writes past end of device */
-	if ((to + ops->len) > mtd->size) {
+	if (ops->datbuf && (to + ops->len) > mtd->size) {
 		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
 		      "Attempt read beyond end of device\n");
 		return -EINVAL;
Index: mtd/drivers/mtd/mtdchar.c
===================================================================
--- mtd.orig/drivers/mtd/mtdchar.c
+++ mtd/drivers/mtd/mtdchar.c
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
Index: mtd/drivers/mtd/mtdconcat.c
===================================================================
--- mtd.orig/drivers/mtd/mtdconcat.c
+++ mtd/drivers/mtd/mtdconcat.c
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
Index: mtd/drivers/mtd/nand/nand_bbt.c
===================================================================
--- mtd.orig/drivers/mtd/nand/nand_bbt.c
+++ mtd/drivers/mtd/nand/nand_bbt.c
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
Index: mtd/drivers/mtd/nftlcore.c
===================================================================
--- mtd.orig/drivers/mtd/nftlcore.c
+++ mtd/drivers/mtd/nftlcore.c
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
 
Index: mtd/drivers/mtd/ssfdc.c
===================================================================
--- mtd.orig/drivers/mtd/ssfdc.c
+++ mtd/drivers/mtd/ssfdc.c
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
Index: mtd/fs/jffs2/wbuf.c
===================================================================
--- mtd.orig/fs/jffs2/wbuf.c
+++ mtd/fs/jffs2/wbuf.c
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
Index: mtd/drivers/mtd/mtdpart.c
===================================================================
--- mtd.orig/drivers/mtd/mtdpart.c
+++ mtd/drivers/mtd/mtdpart.c
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
Index: mtd/include/linux/mtd/mtd.h
===================================================================
--- mtd.orig/include/linux/mtd/mtd.h
+++ mtd/include/linux/mtd/mtd.h
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

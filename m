Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GeVfS-0006yv-1i
	for linux-mtd@lists.infradead.org; Mon, 30 Oct 2006 06:51:09 -0500
Received: from dev.rtsoft.ru. ([10.150.0.9])
	by buildserver.ru.mvista.com (8.11.6/8.11.6) with SMTP id k9UBovi15970
	for <linux-mtd@lists.infradead.org>; Mon, 30 Oct 2006 15:50:57 +0400
Date: Mon, 30 Oct 2006 14:51:05 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH/RFC] remove len/ooblen confusion in MTD/NAND code
Message-Id: <20061030145105.84f953e7.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello folks,

as was discussed between Ricard Wanderlof, David Woodhouse, Artem Bityutskiy and me, the current API for reading/writing OOB is confusing. The thing that introduces confusion is the need to specify ops.len together with ops.ooblen for reads/writes that concern only OOB not data area. So, ops.len is overloaded: when ops.datbuf != NULL it serves to specify the length of the data read, and when ops.datbuf == NULL, it serves to specify the full OOB read length.
The patch inlined below makes an attempt to change the interface to more intuitive, ie when ops.datbuf is NULL, ops.len is ignored, and ops.ooblen is used throughout to specify the full OOB read/write length.

 drivers/mtd/inftlcore.c      |    2 --
 drivers/mtd/mtdchar.c        |    2 --
 drivers/mtd/mtdconcat.c      |    8 ++++----
 drivers/mtd/mtdpart.c        |    4 ++--
 drivers/mtd/nand/nand_base.c |   38 ++++++++++++++++++++++++--------------
 drivers/mtd/nand/nand_bbt.c  |    1 -
 drivers/mtd/nftlcore.c       |    2 --
 drivers/mtd/ssfdc.c          |    3 +--
 fs/jffs2/wbuf.c              |   21 +++++++++------------
 9 files changed, 40 insertions(+), 41 deletions(-)

Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>

Index: linux-2.6/drivers/mtd/inftlcore.c
===================================================================
--- linux-2.6.orig/drivers/mtd/inftlcore.c
+++ linux-2.6/drivers/mtd/inftlcore.c
@@ -163,7 +163,6 @@ int inftl_read_oob(struct mtd_info *mtd,
 	ops.ooblen = len;
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
-	ops.len = len;
 
 	res = mtd->read_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
 	*retlen = ops.retlen;
@@ -184,7 +183,6 @@ int inftl_write_oob(struct mtd_info *mtd
 	ops.ooblen = len;
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
-	ops.len = len;
 
 	res = mtd->write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
 	*retlen = ops.retlen;
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
@@ -1257,12 +1259,18 @@ static int nand_do_read_oob(struct mtd_i
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
 
@@ -1274,7 +1282,9 @@ static int nand_do_read_oob(struct mtd_i
 
 	while(1) {
 		sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
-		buf = nand_transfer_oob(chip, buf, ops);
+
+		len = min(len, readlen);
+		buf = nand_transfer_oob(chip, buf, ops, len);
 
 		if (!(chip->options & NAND_NO_READRDY)) {
 			/*
@@ -1289,7 +1299,7 @@ static int nand_do_read_oob(struct mtd_i
 				nand_wait_ready(mtd);
 		}
 
-		readlen -= ops->ooblen;
+		readlen -= len;
 		if (!readlen)
 			break;
 
@@ -1311,7 +1321,7 @@ static int nand_do_read_oob(struct mtd_i
 			sndcmd = 1;
 	}
 
-	ops->retlen = ops->len;
+	ops->retlen = ops->ooblen;
 	return 0;
 }
 
@@ -1332,7 +1342,7 @@ static int nand_read_oob(struct mtd_info
 	ops->retlen = 0;
 
 	/* Do not allow reads past end of device */
-	if ((from + ops->len) > mtd->size) {
+	if (ops->datbuf && (from + ops->len) > mtd->size) {
 		DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
 		      "Attempt read beyond end of device\n");
 		return -EINVAL;
@@ -1713,10 +1723,10 @@ static int nand_do_write_oob(struct mtd_
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
@@ -1753,7 +1763,7 @@ static int nand_do_write_oob(struct mtd_
 	if (status)
 		return status;
 
-	ops->retlen = ops->len;
+	ops->retlen = ops->ooblen;
 
 	return 0;
 }
@@ -1773,7 +1783,7 @@ static int nand_write_oob(struct mtd_inf
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
@@ -499,7 +499,6 @@ static int mtd_ioctl(struct inode *inode
 		if (ret)
 			return ret;
 
-		ops.len = buf.length;
 		ops.ooblen = buf.length;
 		ops.ooboffs = buf.start & (mtd->oobsize - 1);
 		ops.datbuf = NULL;
@@ -548,7 +547,6 @@ static int mtd_ioctl(struct inode *inode
 		if (ret)
 			return ret;
 
-		ops.len = buf.length;
 		ops.ooblen = buf.length;
 		ops.ooboffs = buf.start & (mtd->oobsize - 1);
 		ops.datbuf = NULL;
Index: linux-2.6/drivers/mtd/mtdconcat.c
===================================================================
--- linux-2.6.orig/drivers/mtd/mtdconcat.c
+++ linux-2.6/drivers/mtd/mtdconcat.c
@@ -278,14 +278,14 @@ concat_read_oob(struct mtd_info *mtd, lo
 				return err;
 		}
 
-		devops.len = ops->len - ops->retlen;
-		if (!devops.len)
+		devops.ooblen = ops->ooblen - ops->retlen;
+		if (!devops.ooblen)
 			return ret;
 
 		if (devops.datbuf)
 			devops.datbuf += devops.retlen;
 		if (devops.oobbuf)
-			devops.oobbuf += devops.ooblen;
+			devops.oobbuf += subdev->oobsize;
 
 		from = 0;
 	}
@@ -328,7 +328,7 @@ concat_write_oob(struct mtd_info *mtd, l
 		if (devops.datbuf)
 			devops.datbuf += devops.retlen;
 		if (devops.oobbuf)
-			devops.oobbuf += devops.ooblen;
+			devops.oobbuf += subdev->oobsize;
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
Index: linux-2.6/drivers/mtd/nftlcore.c
===================================================================
--- linux-2.6.orig/drivers/mtd/nftlcore.c
+++ linux-2.6/drivers/mtd/nftlcore.c
@@ -147,7 +147,6 @@ int nftl_read_oob(struct mtd_info *mtd, 
 	ops.ooblen = len;
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
-	ops.len = len;
 
 	res = mtd->read_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
 	*retlen = ops.retlen;
@@ -168,7 +167,6 @@ int nftl_write_oob(struct mtd_info *mtd,
 	ops.ooblen = len;
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
-	ops.len = len;
 
 	res = mtd->write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
 	*retlen = ops.retlen;
Index: linux-2.6/drivers/mtd/ssfdc.c
===================================================================
--- linux-2.6.orig/drivers/mtd/ssfdc.c
+++ linux-2.6/drivers/mtd/ssfdc.c
@@ -172,8 +172,7 @@ static int read_raw_oob(struct mtd_info 
 
 	ops.mode = MTD_OOB_RAW;
 	ops.ooboffs = 0;
-	ops.ooblen = mtd->oobsize;
-	ops.len = OOB_SIZE;
+	ops.ooblen = OOB_SIZE;
 	ops.oobbuf = buf;
 	ops.datbuf = NULL;
 
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
+	if (ops.retlen < ops.ooblen) {
 		D1(printk(KERN_WARNING "jffs2_check_oob_empty(): Read OOB "
 			  "returned short read (%zd bytes not %d) for block "
-			  "at %08x\n", ops.retlen, ops.len, jeb->offset));
+			  "at %08x\n", ops.retlen, ops.ooblen, jeb->offset));
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
+	if (ops.retlen < ops.ooblen) {
 		D1 (printk (KERN_WARNING "jffs2_check_nand_cleanmarker(): "
 			    "Read OOB return short read (%zd bytes not %d) "
-			    "for block at %08x\n", ops.retlen, ops.len,
+			    "for block at %08x\n", ops.retlen, ops.ooblen,
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
+	if (ops.retlen != ops.ooblen) {
 		D1(printk(KERN_WARNING "jffs2_write_nand_cleanmarker(): "
 			  "Short write for block at %08x: %zd not %d\n",
-			  jeb->offset, ops.retlen, ops.len));
+			  jeb->offset, ops.retlen, ops.ooblen));
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

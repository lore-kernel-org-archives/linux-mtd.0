Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Iaqm1-0007Ja-Iv
	for linux-mtd@lists.infradead.org; Thu, 27 Sep 2007 06:39:20 -0400
Subject: [PATCH try 3] MTD: OneNAND: fix numerous races
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kyungmin Park <kmpark@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Sep 2007 13:38:48 +0300
Message-Id: <1190889529.12445.11.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Fri, 21 Sep 2007 19:35:21 +0300
Subject: [PATCH] MTD: OneNAND: fix numerous races

This patch make the OneNAND driver much less racy. It fixes
our "onenand_wait: read timeout!" heisenbugs. The reason of
these bugs was that the driver did not lock the chip when
accessing OTP, and it screwed up OneNAND state when the OTP
was read while JFFS2 was doing FS checking.

This patch also fixes other races I spotted:
1. BBT was not protected
2. Access to ecc_stats was not protected

Now the chip is locked when BBT is accessed.

To fix all of these I basically split all interface functions
on 'function()' and 'function_nolock()' parts.

I tested this patch on N800 hardware - it fixes our problems.
But I tested a little different version because our OneNAND
codebase is slightly out-of-date. But it should be OK.

This patch also includes the prin fixes I posted before.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |  181 ++++++++++++++++++++------------=
----
 1 files changed, 101 insertions(+), 80 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onena=
nd_base.c
index 40d8d6f..13fd8c1 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1,4 +1,4 @@
-/*
+	/*
  *  linux/drivers/mtd/onenand/onenand_base.c
  *
  *  Copyright (C) 2005-2007 Samsung Electronics
@@ -333,12 +333,14 @@ static int onenand_wait(struct mtd_info *mtd, int sta=
te)
 	if (interrupt & ONENAND_INT_READ) {
 		int ecc =3D this->read_word(this->base + ONENAND_REG_ECC_STATUS);
 		if (ecc) {
-			printk(KERN_ERR "onenand_wait: ECC error =3D 0x%04x\n", ecc);
 			if (ecc & ONENAND_ECC_2BIT_ALL) {
+				printk(KERN_ERR "onenand_wait: ECC error =3D 0x%04x\n", ecc);
 				mtd->ecc_stats.failed++;
 				return ecc;
-			} else if (ecc & ONENAND_ECC_1BIT_ALL)
+			} else if (ecc & ONENAND_ECC_1BIT_ALL) {
+				printk(KERN_INFO "onenand_wait: correctable ECC error =3D 0x%04x\n", e=
cc);
 				mtd->ecc_stats.corrected++;
+			}
 		}
 	} else if (state =3D=3D FL_READING) {
 		printk(KERN_ERR "onenand_wait: read timeout! ctrl=3D0x%04x intr=3D0x%04x=
\n", ctrl, interrupt);
@@ -805,14 +807,14 @@ static int onenand_transfer_auto_oob(struct mtd_info =
*mtd, uint8_t *buf, int col
 }
=20
 /**
- * onenand_read_ops - [OneNAND Interface] OneNAND read main and/or out-of-=
band
+ * onenand_read_ops_nolock - [OneNAND Interface] OneNAND read main and/or =
out-of-band
  * @param mtd		MTD device structure
  * @param from		offset to read from
  * @param ops:		oob operation description structure
  *
  * OneNAND read main and/or out-of-band data
  */
-static int onenand_read_ops(struct mtd_info *mtd, loff_t from,
+static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 				struct mtd_oob_ops *ops)
 {
 	struct onenand_chip *this =3D mtd->priv;
@@ -826,7 +828,7 @@ static int onenand_read_ops(struct mtd_info *mtd, loff_=
t from,
 	int ret =3D 0, boundary =3D 0;
 	int writesize =3D this->writesize;
=20
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_ops: from =3D 0x%08x, len =3D %i\n"=
, (unsigned int) from, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_ops_nolock: from =3D 0x%08x, len =
=3D %i\n", (unsigned int) from, (int) len);
=20
 	if (ops->mode =3D=3D MTD_OOB_AUTO)
 		oobsize =3D this->ecclayout->oobavail;
@@ -837,15 +839,12 @@ static int onenand_read_ops(struct mtd_info *mtd, lof=
f_t from,
=20
 	/* Do not allow reads past end of device */
 	if ((from + len) > mtd->size) {
-		printk(KERN_ERR "onenand_read_ops: Attempt read beyond end of device\n")=
;
+		printk(KERN_ERR "onenand_read_ops_nolock: Attempt read beyond end of dev=
ice\n");
 		ops->retlen =3D 0;
 		ops->oobretlen =3D 0;
 		return -EINVAL;
 	}
=20
-	/* Grab the lock and see if the device is available */
-	onenand_get_device(mtd, FL_READING);
-
 	stats =3D mtd->ecc_stats;
=20
  	/* Read-while-load method */
@@ -916,9 +915,6 @@ static int onenand_read_ops(struct mtd_info *mtd, loff_=
t from,
  		onenand_update_bufferram(mtd, from, !ret);
  	}
=20
-	/* Deselect and wake up anyone waiting on the device */
-	onenand_release_device(mtd);
-
 	/*
 	 * Return success, if no ECC failures, else -EBADMSG
 	 * fs driver will take care of that, because
@@ -937,14 +933,14 @@ static int onenand_read_ops(struct mtd_info *mtd, lof=
f_t from,
 }
=20
 /**
- * onenand_do_read_oob - [MTD Interface] OneNAND read out-of-band
+ * onenand_read_oob_nolock - [MTD Interface] OneNAND read out-of-band
  * @param mtd		MTD device structure
  * @param from		offset to read from
  * @param ops:		oob operation description structure
  *
  * OneNAND read out-of-band data from the spare area
  */
-static int onenand_do_read_oob(struct mtd_info *mtd, loff_t from,
+static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 			struct mtd_oob_ops *ops)
 {
 	struct onenand_chip *this =3D mtd->priv;
@@ -956,7 +952,7 @@ static int onenand_do_read_oob(struct mtd_info *mtd, lo=
ff_t from,
=20
 	from +=3D ops->ooboffs;
=20
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_oob: from =3D 0x%08x, len =3D %i\n"=
, (unsigned int) from, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_oob_nolock: from =3D 0x%08x, len =
=3D %i\n", (unsigned int) from, (int) len);
=20
 	/* Initialize return length value */
 	ops->oobretlen =3D 0;
@@ -969,7 +965,7 @@ static int onenand_do_read_oob(struct mtd_info *mtd, lo=
ff_t from,
 	column =3D from & (mtd->oobsize - 1);
=20
 	if (unlikely(column >=3D oobsize)) {
-		printk(KERN_ERR "onenand_read_oob: Attempted to start read outside oob\n=
");
+		printk(KERN_ERR "onenand_read_oob_nolock: Attempted to start read outsid=
e oob\n");
 		return -EINVAL;
 	}
=20
@@ -977,13 +973,10 @@ static int onenand_do_read_oob(struct mtd_info *mtd, =
loff_t from,
 	if (unlikely(from >=3D mtd->size ||
 		     column + len > ((mtd->size >> this->page_shift) -
 				     (from >> this->page_shift)) * oobsize)) {
-		printk(KERN_ERR "onenand_read_oob: Attempted to read beyond end of devic=
e\n");
+		printk(KERN_ERR "onenand_read_oob_nolock: Attempted to read beyond end o=
f device\n");
 		return -EINVAL;
 	}
=20
-	/* Grab the lock and see if the device is available */
-	onenand_get_device(mtd, FL_READING);
-
 	while (read < len) {
 		cond_resched();
=20
@@ -1003,7 +996,7 @@ static int onenand_do_read_oob(struct mtd_info *mtd, l=
off_t from,
 			this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);
=20
 		if (ret) {
-			printk(KERN_ERR "onenand_read_oob: read failed =3D 0x%x\n", ret);
+			printk(KERN_ERR "onenand_read_oob_nolock: read failed =3D 0x%x\n", ret)=
;
 			break;
 		}
=20
@@ -1022,9 +1015,6 @@ static int onenand_do_read_oob(struct mtd_info *mtd, =
loff_t from,
 		}
 	}
=20
-	/* Deselect and wake up anyone waiting on the device */
-	onenand_release_device(mtd);
-
 	ops->oobretlen =3D read;
 	return ret;
 }
@@ -1050,9 +1040,11 @@ static int onenand_read(struct mtd_info *mtd, loff_t=
 from, size_t len,
 	};
 	int ret;
=20
-	ret =3D onenand_read_ops(mtd, from, &ops);
-	*retlen =3D ops.retlen;
+	onenand_get_device(mtd, FL_READING);
+	ret =3D onenand_read_ops_nolock(mtd, from, &ops);
+	onenand_release_device(mtd);
=20
+	*retlen =3D ops.retlen;
 	return ret;
 }
=20
@@ -1067,6 +1059,8 @@ static int onenand_read(struct mtd_info *mtd, loff_t =
from, size_t len,
 static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
+	int ret;
+
 	switch (ops->mode) {
 	case MTD_OOB_PLACE:
 	case MTD_OOB_AUTO:
@@ -1077,10 +1071,14 @@ static int onenand_read_oob(struct mtd_info *mtd, l=
off_t from,
 		return -EINVAL;
 	}
=20
+	onenand_get_device(mtd, FL_READING);
 	if (ops->datbuf)
-		return onenand_read_ops(mtd, from, ops);
+		ret =3D onenand_read_ops_nolock(mtd, from, ops);
+	else
+		ret =3D onenand_read_oob_nolock(mtd, from, ops);
+	onenand_release_device(mtd);
=20
-	return onenand_do_read_oob(mtd, from, ops);
+	return ret;
 }
=20
 /**
@@ -1317,14 +1315,14 @@ static int onenand_fill_auto_oob(struct mtd_info *m=
td, u_char *oob_buf,
 }
=20
 /**
- * onenand_write_ops - [OneNAND Interface] write main and/or out-of-band
+ * onenand_write_ops_nolock - [OneNAND Interface] write main and/or out-of=
-band
  * @param mtd		MTD device structure
  * @param to		offset to write to
  * @param ops		oob operation description structure
  *
  * Write main and/or oob with ECC
  */
-static int onenand_write_ops(struct mtd_info *mtd, loff_t to,
+static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 				struct mtd_oob_ops *ops)
 {
 	struct onenand_chip *this =3D mtd->priv;
@@ -1337,7 +1335,7 @@ static int onenand_write_ops(struct mtd_info *mtd, lo=
ff_t to,
 	u_char *oobbuf;
 	int ret =3D 0;
=20
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write: to =3D 0x%08x, len =3D %i\n", (un=
signed int) to, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_ops_nolock: to =3D 0x%08x, len =3D=
 %i\n", (unsigned int) to, (int) len);
=20
 	/* Initialize retlen, in case of early exit */
 	ops->retlen =3D 0;
@@ -1345,13 +1343,13 @@ static int onenand_write_ops(struct mtd_info *mtd, =
loff_t to,
=20
 	/* Do not allow writes past end of device */
 	if (unlikely((to + len) > mtd->size)) {
-		printk(KERN_ERR "onenand_write: Attempt write to past end of device\n");
+		printk(KERN_ERR "onenand_write_ops_nolock: Attempt write to past end of =
device\n");
 		return -EINVAL;
 	}
=20
 	/* Reject writes, which are not page aligned */
         if (unlikely(NOTALIGNED(to)) || unlikely(NOTALIGNED(len))) {
-                printk(KERN_ERR "onenand_write: Attempt to write not page =
aligned data\n");
+                printk(KERN_ERR "onenand_write_ops_nolock: Attempt to writ=
e not page aligned data\n");
                 return -EINVAL;
         }
=20
@@ -1364,9 +1362,6 @@ static int onenand_write_ops(struct mtd_info *mtd, lo=
ff_t to,
=20
 	column =3D to & (mtd->writesize - 1);
=20
-	/* Grab the lock and see if the device is available */
-	onenand_get_device(mtd, FL_WRITING);
-
 	/* Loop until all data write */
 	while (written < len) {
 		u_char *wbuf =3D (u_char *) buf;
@@ -1419,14 +1414,14 @@ static int onenand_write_ops(struct mtd_info *mtd, =
loff_t to,
 		}
=20
 		if (ret) {
-			printk(KERN_ERR "onenand_write: write filaed %d\n", ret);
+			printk(KERN_ERR "onenand_write_ops_nolock: write filaed %d\n", ret);
 			break;
 		}
=20
 		/* Only check verify write turn on */
 		ret =3D onenand_verify(mtd, (u_char *) wbuf, to, thislen);
 		if (ret) {
-			printk(KERN_ERR "onenand_write: verify failed %d\n", ret);
+			printk(KERN_ERR "onenand_write_ops_nolock: verify failed %d\n", ret);
 			break;
 		}
=20
@@ -1450,7 +1445,7 @@ static int onenand_write_ops(struct mtd_info *mtd, lo=
ff_t to,
=20
=20
 /**
- * onenand_do_write_oob - [Internal] OneNAND write out-of-band
+ * onenand_write_oob_nolock - [Internal] OneNAND write out-of-band
  * @param mtd		MTD device structure
  * @param to		offset to write to
  * @param len		number of bytes to write
@@ -1460,8 +1455,8 @@ static int onenand_write_ops(struct mtd_info *mtd, lo=
ff_t to,
  *
  * OneNAND write out-of-band
  */
-static int onenand_do_write_oob(struct mtd_info *mtd, loff_t to,
-				struct mtd_oob_ops *ops)
+static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
+				    struct mtd_oob_ops *ops)
 {
 	struct onenand_chip *this =3D mtd->priv;
 	int column, ret =3D 0, oobsize;
@@ -1473,7 +1468,7 @@ static int onenand_do_write_oob(struct mtd_info *mtd,=
 loff_t to,
=20
 	to +=3D ops->ooboffs;
=20
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_oob: to =3D 0x%08x, len =3D %i\n",=
 (unsigned int) to, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_oob_nolock: to =3D 0x%08x, len =3D=
 %i\n", (unsigned int) to, (int) len);
=20
 	/* Initialize retlen, in case of early exit */
 	ops->oobretlen =3D 0;
@@ -1486,13 +1481,13 @@ static int onenand_do_write_oob(struct mtd_info *mt=
d, loff_t to,
 	column =3D to & (mtd->oobsize - 1);
=20
 	if (unlikely(column >=3D oobsize)) {
-		printk(KERN_ERR "onenand_write_oob: Attempted to start write outside oob=
\n");
+		printk(KERN_ERR "onenand_write_oob_nolock: Attempted to start write outs=
ide oob\n");
 		return -EINVAL;
 	}
=20
 	/* For compatibility with NAND: Do not allow write past end of page */
 	if (unlikely(column + len > oobsize)) {
-		printk(KERN_ERR "onenand_write_oob: "
+		printk(KERN_ERR "onenand_write_oob_nolock: "
 		      "Attempt to write past end of page\n");
 		return -EINVAL;
 	}
@@ -1501,13 +1496,10 @@ static int onenand_do_write_oob(struct mtd_info *mt=
d, loff_t to,
 	if (unlikely(to >=3D mtd->size ||
 		     column + len > ((mtd->size >> this->page_shift) -
 				     (to >> this->page_shift)) * oobsize)) {
-		printk(KERN_ERR "onenand_write_oob: Attempted to write past end of devic=
e\n");
+		printk(KERN_ERR "onenand_write_oob_nolock: Attempted to write past end o=
f device\n");
 		return -EINVAL;
 	}
=20
-	/* Grab the lock and see if the device is available */
-	onenand_get_device(mtd, FL_WRITING);
-
 	oobbuf =3D this->oob_buf;
=20
 	/* Loop until all data write */
@@ -1537,13 +1529,13 @@ static int onenand_do_write_oob(struct mtd_info *mt=
d, loff_t to,
=20
 		ret =3D this->wait(mtd, FL_WRITING);
 		if (ret) {
-			printk(KERN_ERR "onenand_write_oob: write failed %d\n", ret);
+			printk(KERN_ERR "onenand_write_oob_nolock: write failed %d\n", ret);
 			break;
 		}
=20
 		ret =3D onenand_verify_oob(mtd, oobbuf, to);
 		if (ret) {
-			printk(KERN_ERR "onenand_write_oob: verify failed %d\n", ret);
+			printk(KERN_ERR "onenand_write_oob_nolock: verify failed %d\n", ret);
 			break;
 		}
=20
@@ -1556,9 +1548,6 @@ static int onenand_do_write_oob(struct mtd_info *mtd,=
 loff_t to,
 		column =3D 0;
 	}
=20
-	/* Deselect and wake up anyone waiting on the device */
-	onenand_release_device(mtd);
-
 	ops->oobretlen =3D written;
=20
 	return ret;
@@ -1585,9 +1574,11 @@ static int onenand_write(struct mtd_info *mtd, loff_=
t to, size_t len,
 	};
 	int ret;
=20
-	ret =3D onenand_write_ops(mtd, to, &ops);
-	*retlen =3D ops.retlen;
+	onenand_get_device(mtd, FL_WRITING);
+	ret =3D onenand_write_ops_nolock(mtd, to, &ops);
+	onenand_release_device(mtd);
=20
+	*retlen =3D ops.retlen;
 	return ret;
 }
=20
@@ -1600,6 +1591,8 @@ static int onenand_write(struct mtd_info *mtd, loff_t=
 to, size_t len,
 static int onenand_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
+	int ret;
+
 	switch (ops->mode) {
 	case MTD_OOB_PLACE:
 	case MTD_OOB_AUTO:
@@ -1610,27 +1603,34 @@ static int onenand_write_oob(struct mtd_info *mtd, =
loff_t to,
 		return -EINVAL;
 	}
=20
+	onenand_get_device(mtd, FL_WRITING);
 	if (ops->datbuf)
-		return onenand_write_ops(mtd, to, ops);
+		ret =3D onenand_write_ops_nolock(mtd, to, ops);
+	else
+		ret =3D onenand_write_oob_nolock(mtd, to, ops);
+	onenand_release_device(mtd);
=20
-	return onenand_do_write_oob(mtd, to, ops);
+	return ret;
 }
=20
 /**
- * onenand_block_checkbad - [GENERIC] Check if a block is marked bad
+ * onenand_block_isbad_nolock - [GENERIC] Check if a block is marked bad
  * @param mtd		MTD device structure
  * @param ofs		offset from device start
- * @param getchip	0, if the chip is already selected
  * @param allowbbt	1, if its allowed to access the bbt area
  *
  * Check, if the block is bad. Either by reading the bad block table or
  * calling of the scan function.
  */
-static int onenand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int ge=
tchip, int allowbbt)
+static int onenand_block_isbad_nolock(struct mtd_info *mtd, loff_t ofs, in=
t allowbbt)
 {
 	struct onenand_chip *this =3D mtd->priv;
 	struct bbm_info *bbm =3D this->bbm;
=20
+	/* Check for invalid offset */
+	if (ofs > mtd->size)
+		return -EINVAL;
+
 	/* Return info from the table */
 	return bbm->isbad_bbt(mtd, ofs, allowbbt);
 }
@@ -1687,7 +1687,7 @@ static int onenand_erase(struct mtd_info *mtd, struct=
 erase_info *instr)
 		cond_resched();
=20
 		/* Check if we have a bad block, we do not erase bad blocks */
-		if (onenand_block_checkbad(mtd, addr, 0, 0)) {
+		if (onenand_block_isbad_nolock(mtd, addr, 0)) {
 			printk (KERN_WARNING "onenand_erase: attempt to erase a bad block at ad=
dr 0x%08x\n", (unsigned int) addr);
 			instr->state =3D MTD_ERASE_FAILED;
 			goto erase_exit;
@@ -1751,11 +1751,12 @@ static void onenand_sync(struct mtd_info *mtd)
  */
 static int onenand_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
-	/* Check for invalid offset */
-	if (ofs > mtd->size)
-		return -EINVAL;
+	int ret;
=20
-	return onenand_block_checkbad(mtd, ofs, 1, 0);
+	onenand_get_device(mtd, FL_READING);
+	ret =3D onenand_block_isbad_nolock(mtd, ofs, 0);
+	onenand_release_device(mtd);
+	return ret;
 }
=20
 /**
@@ -1786,7 +1787,7 @@ static int onenand_default_block_markbad(struct mtd_i=
nfo *mtd, loff_t ofs)
=20
         /* We write two bytes, so we dont have to mess with 16 bit access =
*/
         ofs +=3D mtd->oobsize + (bbm->badblockpos & ~0x01);
-        return onenand_do_write_oob(mtd, ofs, &ops);
+        return onenand_write_oob_nolock(mtd, ofs, &ops);
 }
=20
 /**
@@ -1801,15 +1802,19 @@ static int onenand_block_markbad(struct mtd_info *m=
td, loff_t ofs)
 	struct onenand_chip *this =3D mtd->priv;
 	int ret;
=20
-	ret =3D onenand_block_isbad(mtd, ofs);
+	onenand_get_device(mtd, FL_WRITING);
+	ret =3D onenand_block_isbad_nolock(mtd, ofs, 0);
 	if (ret) {
 		/* If it was bad already, return success and do nothing */
+		onenand_release_device(mtd);
 		if (ret > 0)
 			return 0;
 		return ret;
 	}
=20
-	return this->block_markbad(mtd, ofs);
+	ret =3D this->block_markbad(mtd, ofs);
+	onenand_release_device(mtd);
+	return ret;
 }
=20
 /**
@@ -2008,13 +2013,19 @@ static int do_otp_read(struct mtd_info *mtd, loff_t=
 from, size_t len,
 		size_t *retlen, u_char *buf)
 {
 	struct onenand_chip *this =3D mtd->priv;
+	struct mtd_oob_ops ops =3D {
+		.len	=3D len,
+		.ooblen	=3D 0,
+		.datbuf	=3D buf,
+		.oobbuf	=3D NULL,
+	};
 	int ret;
=20
 	/* Enter OTP access mode */
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
=20
-	ret =3D mtd->read(mtd, from, len, retlen, buf);
+	ret =3D onenand_read_ops_nolock(mtd, from, &ops);
=20
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
@@ -2026,19 +2037,20 @@ static int do_otp_read(struct mtd_info *mtd, loff_t=
 from, size_t len,
 /**
  * do_otp_write - [DEFAULT] Write OTP block area
  * @param mtd		MTD device structure
- * @param from		The offset to write
+ * @param to		The offset to write
  * @param len		number of bytes to write
  * @param retlen	pointer to variable to store the number of write bytes
  * @param buf		the databuffer to put/get data
  *
  * Write OTP block area.
  */
-static int do_otp_write(struct mtd_info *mtd, loff_t from, size_t len,
+static int do_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, u_char *buf)
 {
 	struct onenand_chip *this =3D mtd->priv;
 	unsigned char *pbuf =3D buf;
 	int ret;
+	struct mtd_oob_ops ops;
=20
 	/* Force buffer page aligned */
 	if (len < mtd->writesize) {
@@ -2052,7 +2064,12 @@ static int do_otp_write(struct mtd_info *mtd, loff_t=
 from, size_t len,
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
=20
-	ret =3D mtd->write(mtd, from, len, retlen, pbuf);
+	ops.len =3D len;
+	ops.ooblen =3D 0;
+	ops.datbuf =3D pbuf;
+	ops.oobbuf =3D NULL;
+	ret =3D onenand_write_ops_nolock(mtd, to, &ops);
+	*retlen =3D ops.retlen;
=20
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
@@ -2087,7 +2104,7 @@ static int do_otp_lock(struct mtd_info *mtd, loff_t f=
rom, size_t len,
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
=20
-	ret =3D onenand_do_write_oob(mtd, from, &ops);
+	ret =3D onenand_write_oob_nolock(mtd, from, &ops);
=20
 	*retlen =3D ops.oobretlen;
=20
@@ -2136,13 +2153,16 @@ static int onenand_otp_walk(struct mtd_info *mtd, l=
off_t from, size_t len,
 	if (((mtd->writesize * otp_pages) - (from + len)) < 0)
 		return 0;
=20
+	onenand_get_device(mtd, FL_OTPING);
 	while (len > 0 && otp_pages > 0) {
 		if (!action) {	/* OTP Info functions */
 			struct otp_info *otpinfo;
=20
 			len -=3D sizeof(struct otp_info);
-			if (len <=3D 0)
-				return -ENOSPC;
+			if (len <=3D 0) {
+				ret =3D -ENOSPC;
+				break;
+			}
=20
 			otpinfo =3D (struct otp_info *) buf;
 			otpinfo->start =3D from;
@@ -2162,13 +2182,14 @@ static int onenand_otp_walk(struct mtd_info *mtd, l=
off_t from, size_t len,
 			len -=3D size;
 			*retlen +=3D size;
=20
-			if (ret < 0)
-				return ret;
+			if (ret)
+				break;
 		}
 		otp_pages--;
 	}
+	onenand_release_device(mtd);
=20
-	return 0;
+	return ret;
 }
=20
 /**
@@ -2364,7 +2385,7 @@ static void onenand_print_device_info(int device, int=
 version)
                 (16 << density),
                 vcc ? "2.65/3.3" : "1.8",
                 device);
-	printk(KERN_DEBUG "OneNAND version =3D 0x%04x\n", version);
+	printk(KERN_INFO "OneNAND version =3D 0x%04x\n", version);
 }
=20
 static const struct onenand_manufacturers onenand_manuf_ids[] =3D {
--=20
1.5.0.6


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IYiqf-0001cF-Oq
	for linux-mtd@lists.infradead.org; Fri, 21 Sep 2007 09:48:47 -0400
Subject: [PATCH] MTD: OneNAND: fix numerous races
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Sep 2007 16:46:55 +0300
Message-Id: <1190382415.14370.207.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 5383a93bc534aa15c4e2a260fe5ca4a4ecb8310e Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Fri, 21 Sep 2007 15:34:43 +0300
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

This was tested on N800 hardware.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |  212 +++++++++++++++++++-------------=
---
 1 files changed, 115 insertions(+), 97 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onena=
nd_base.c
index 4e1de12..8d97df0 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -718,18 +718,8 @@ static void onenand_release_device(struct mtd_info *mt=
d)
 	spin_unlock(&this->chip_lock);
 }
=20
-/**
- * onenand_read - [MTD Interface] Read data from flash
- * @param mtd		MTD device structure
- * @param from		offset to read from
- * @param len		number of bytes to read
- * @param retlen	pointer to variable to store the number of read bytes
- * @param buf		the databuffer to put data
- *
- * Read with ecc
-*/
-static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
-	size_t *retlen, u_char *buf)
+static int onenand_read_nolock(struct mtd_info *mtd, loff_t from, size_t l=
en,
+			       size_t *retlen, u_char *buf)
 {
 	struct onenand_chip *this =3D mtd->priv;
 	struct mtd_ecc_stats stats;
@@ -737,18 +727,16 @@ static int onenand_read(struct mtd_info *mtd, loff_t =
from, size_t len,
 	int thislen;
 	int ret =3D 0, boundary =3D 0;
=20
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read: from =3D 0x%08x, len =3D %i\n", (u=
nsigned int) from, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_nolock: from =3D 0x%08x, ""len =3D =
%i\n",
+	      (unsigned int) from, (int) len);
=20
 	/* Do not allow reads past end of device */
 	if ((from + len) > mtd->size) {
-		printk(KERN_ERR "onenand_read: Attempt read beyond end of device\n");
+		printk(KERN_ERR "onenand_read_nolock: Attempt read beyond end of device\=
n");
 		*retlen =3D 0;
 		return -EINVAL;
 	}
=20
-	/* Grab the lock and see if the device is available */
-	onenand_get_device(mtd, FL_READING);
-
 	stats =3D mtd->ecc_stats;
=20
 	/* Read-while-load method */
@@ -804,9 +792,6 @@ static int onenand_read(struct mtd_info *mtd, loff_t fr=
om, size_t len,
 		onenand_update_bufferram(mtd, from, !ret);
 	}
=20
-	/* Deselect and wake up anyone waiting on the device */
-	onenand_release_device(mtd);
-
 	/*
 	 * Return success, if no ECC failures, else -EBADMSG
 	 * fs driver will take care of that, because
@@ -824,6 +809,28 @@ static int onenand_read(struct mtd_info *mtd, loff_t f=
rom, size_t len,
 }
=20
 /**
+ * onenand_read - [MTD Interface] Read data from flash
+ * @param mtd		MTD device structure
+ * @param from		offset to read from
+ * @param len		number of bytes to read
+ * @param retlen	pointer to variable to store the number of read bytes
+ * @param buf		the databuffer to put data
+ *
+ * Read with ecc
+*/
+static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
+			size_t *retlen, u_char *buf)
+{
+	int ret;
+
+	onenand_get_device(mtd, FL_READING);
+	ret =3D onenand_read_nolock(mtd, from, len, retlen, buf);
+	onenand_release_device(mtd);
+
+	return ret;
+}
+
+/**
  * onenand_transfer_auto_oob - [Internal] oob auto-placement transfer
  * @param mtd		MTD device structure
  * @param buf		destination address
@@ -863,7 +870,7 @@ static int onenand_transfer_auto_oob(struct mtd_info *m=
td, uint8_t *buf, int col
 }
=20
 /**
- * onenand_do_read_oob - [MTD Interface] OneNAND read out-of-band
+ * onenand_read_oob_nolock - [MTD Interface] OneNAND read out-of-band
  * @param mtd		MTD device structure
  * @param from		offset to read from
  * @param len		number of bytes to read
@@ -873,14 +880,15 @@ static int onenand_transfer_auto_oob(struct mtd_info =
*mtd, uint8_t *buf, int col
  *
  * OneNAND read out-of-band data from the spare area
  */
-static int onenand_do_read_oob(struct mtd_info *mtd, loff_t from, size_t l=
en,
+static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from, size=
_t len,
 			size_t *retlen, u_char *buf, mtd_oob_mode_t mode)
 {
 	struct onenand_chip *this =3D mtd->priv;
 	int read =3D 0, thislen, column, oobsize;
 	int ret =3D 0;
=20
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_oob: from =3D 0x%08x, len =3D %i\n"=
, (unsigned int) from, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_read_oob_nolock: from =3D 0x%08x, len =
=3D %i\n",
+	      (unsigned int) from, (int) len);
=20
 	/* Initialize return length value */
 	*retlen =3D 0;
@@ -893,7 +901,7 @@ static int onenand_do_read_oob(struct mtd_info *mtd, lo=
ff_t from, size_t len,
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
@@ -901,13 +909,10 @@ static int onenand_do_read_oob(struct mtd_info *mtd, =
loff_t from, size_t len,
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
@@ -927,7 +932,7 @@ static int onenand_do_read_oob(struct mtd_info *mtd, lo=
ff_t from, size_t len,
 			this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);
=20
 		if (ret) {
-			printk(KERN_ERR "onenand_read_oob: read failed =3D 0x%x\n", ret);
+			printk(KERN_ERR "onenand_read_oob_nolock: read failed =3D 0x%x\n", ret)=
;
 			break;
 		}
=20
@@ -946,9 +951,6 @@ static int onenand_do_read_oob(struct mtd_info *mtd, lo=
ff_t from, size_t len,
 		}
 	}
=20
-	/* Deselect and wake up anyone waiting on the device */
-	onenand_release_device(mtd);
-
 	*retlen =3D read;
 	return ret;
 }
@@ -962,6 +964,8 @@ static int onenand_do_read_oob(struct mtd_info *mtd, lo=
ff_t from, size_t len,
 static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
+	int ret;
+
 	switch (ops->mode) {
 	case MTD_OOB_PLACE:
 	case MTD_OOB_AUTO:
@@ -971,8 +975,12 @@ static int onenand_read_oob(struct mtd_info *mtd, loff=
_t from,
 	default:
 		return -EINVAL;
 	}
-	return onenand_do_read_oob(mtd, from + ops->ooboffs, ops->ooblen,
-				   &ops->oobretlen, ops->oobbuf, ops->mode);
+
+	onenand_get_device(mtd, FL_READING);
+	ret =3D onenand_read_oob_nolock(mtd, from + ops->ooboffs, ops->ooblen,
+				      &ops->oobretlen, ops->oobbuf, ops->mode);
+	onenand_release_device(mtd);
+	return ret;
 }
=20
 /**
@@ -1169,46 +1177,34 @@ static int onenand_verify(struct mtd_info *mtd, con=
st u_char *buf, loff_t addr,
=20
 #define NOTALIGNED(x)	((x & (this->subpagesize - 1)) !=3D 0)
=20
-/**
- * onenand_write - [MTD Interface] write buffer to FLASH
- * @param mtd		MTD device structure
- * @param to		offset to write to
- * @param len		number of bytes to write
- * @param retlen	pointer to variable to store the number of written bytes
- * @param buf		the data to write
- *
- * Write with ECC
- */
-static int onenand_write(struct mtd_info *mtd, loff_t to, size_t len,
-	size_t *retlen, const u_char *buf)
+static int onenand_write_nolock(struct mtd_info *mtd, loff_t to, size_t le=
n,
+				size_t *retlen, const u_char *buf)
 {
 	struct onenand_chip *this =3D mtd->priv;
 	int written =3D 0;
 	int ret =3D 0;
 	int column, subpage;
=20
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write: to =3D 0x%08x, len =3D %i\n", (un=
signed int) to, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_nolock: to =3D 0x%08x, len =3D %i\=
n",
+	      (unsigned int) to, (int) len);
=20
 	/* Initialize retlen, in case of early exit */
 	*retlen =3D 0;
=20
 	/* Do not allow writes past end of device */
 	if (unlikely((to + len) > mtd->size)) {
-		printk(KERN_ERR "onenand_write: Attempt write to past end of device\n");
+		printk(KERN_ERR "onenand_write_nolock: Attempt write to past end of devi=
ce\n");
 		return -EINVAL;
 	}
=20
 	/* Reject writes, which are not page aligned */
         if (unlikely(NOTALIGNED(to)) || unlikely(NOTALIGNED(len))) {
-                printk(KERN_ERR "onenand_write: Attempt to write not page =
aligned data\n");
+                printk(KERN_ERR "onenand_write_nolock: Attempt to write no=
t page aligned data\n");
                 return -EINVAL;
         }
=20
 	column =3D to & (mtd->writesize - 1);
=20
-	/* Grab the lock and see if the device is available */
-	onenand_get_device(mtd, FL_WRITING);
-
 	/* Loop until all data write */
 	while (written < len) {
 		int thislen =3D min_t(int, mtd->writesize - column, len - written);
@@ -1237,14 +1233,14 @@ static int onenand_write(struct mtd_info *mtd, loff=
_t to, size_t len,
 		onenand_update_bufferram(mtd, to, !ret && !subpage);
=20
 		if (ret) {
-			printk(KERN_ERR "onenand_write: write filaed %d\n", ret);
+			printk(KERN_ERR "onenand_write_nolock: write filaed %d\n", ret);
 			break;
 		}
=20
 		/* Only check verify write turn on */
 		ret =3D onenand_verify(mtd, (u_char *) wbuf, to, thislen);
 		if (ret) {
-			printk(KERN_ERR "onenand_write: verify failed %d\n", ret);
+			printk(KERN_ERR "onenand_write_nolock: verify failed %d\n", ret);
 			break;
 		}
=20
@@ -1258,10 +1254,28 @@ static int onenand_write(struct mtd_info *mtd, loff=
_t to, size_t len,
 		buf +=3D thislen;
 	}
=20
-	/* Deselect and wake up anyone waiting on the device */
-	onenand_release_device(mtd);
-
 	*retlen =3D written;
+	return ret;
+}
+
+/**
+ * onenand_write - [MTD Interface] write buffer to FLASH
+ * @param mtd		MTD device structure
+ * @param to		offset to write to
+ * @param len		number of bytes to write
+ * @param retlen	pointer to variable to store the number of written bytes
+ * @param buf		the data to write
+ *
+ * Write with ECC
+ */
+static int onenand_write(struct mtd_info *mtd, loff_t to, size_t len,
+			 size_t *retlen, const u_char *buf)
+{
+	int ret;
+
+	onenand_get_device(mtd, FL_WRITING);
+	ret =3D onenand_write_nolock(mtd, to, len, retlen, buf);
+	onenand_release_device(mtd);
=20
 	return ret;
 }
@@ -1305,7 +1319,7 @@ static int onenand_fill_auto_oob(struct mtd_info *mtd=
, u_char *oob_buf,
 }
=20
 /**
- * onenand_do_write_oob - [Internal] OneNAND write out-of-band
+ * onenand_write_oob_nolock - [Internal] OneNAND write out-of-band
  * @param mtd		MTD device structure
  * @param to		offset to write to
  * @param len		number of bytes to write
@@ -1315,7 +1329,7 @@ static int onenand_fill_auto_oob(struct mtd_info *mtd=
, u_char *oob_buf,
  *
  * OneNAND write out-of-band
  */
-static int onenand_do_write_oob(struct mtd_info *mtd, loff_t to, size_t le=
n,
+static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to, size_=
t len,
 				size_t *retlen, const u_char *buf, mtd_oob_mode_t mode)
 {
 	struct onenand_chip *this =3D mtd->priv;
@@ -1323,7 +1337,8 @@ static int onenand_do_write_oob(struct mtd_info *mtd,=
 loff_t to, size_t len,
 	int written =3D 0;
 	u_char *oobbuf;
=20
-	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_oob: to =3D 0x%08x, len =3D %i\n",=
 (unsigned int) to, (int) len);
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_oob_nolock: to =3D 0x%08x, len =3D=
 %i\n",
+	      (unsigned int) to, (int) len);
=20
 	/* Initialize retlen, in case of early exit */
 	*retlen =3D 0;
@@ -1336,13 +1351,13 @@ static int onenand_do_write_oob(struct mtd_info *mt=
d, loff_t to, size_t len,
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
@@ -1351,13 +1366,10 @@ static int onenand_do_write_oob(struct mtd_info *mt=
d, loff_t to, size_t len,
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
@@ -1383,13 +1395,13 @@ static int onenand_do_write_oob(struct mtd_info *mt=
d, loff_t to, size_t len,
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
@@ -1402,11 +1414,7 @@ static int onenand_do_write_oob(struct mtd_info *mtd=
, loff_t to, size_t len,
 		column =3D 0;
 	}
=20
-	/* Deselect and wake up anyone waiting on the device */
-	onenand_release_device(mtd);
-
 	*retlen =3D written;
-
 	return ret;
 }
=20
@@ -1419,6 +1427,8 @@ static int onenand_do_write_oob(struct mtd_info *mtd,=
 loff_t to, size_t len,
 static int onenand_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
+	int ret;
+
 	switch (ops->mode) {
 	case MTD_OOB_PLACE:
 	case MTD_OOB_AUTO:
@@ -1428,21 +1438,15 @@ static int onenand_write_oob(struct mtd_info *mtd, =
loff_t to,
 	default:
 		return -EINVAL;
 	}
-	return onenand_do_write_oob(mtd, to + ops->ooboffs, ops->ooblen,
+	onenand_get_device(mtd, FL_WRITING);
+	ret =3D  onenand_write_oob_nolock(mtd, to + ops->ooboffs, ops->ooblen,
 				    &ops->oobretlen, ops->oobbuf, ops->mode);
+	onenand_release_device(mtd);
+	return ret;
 }
=20
-/**
- * onenand_block_checkbad - [GENERIC] Check if a block is marked bad
- * @param mtd		MTD device structure
- * @param ofs		offset from device start
- * @param getchip	0, if the chip is already selected
- * @param allowbbt	1, if its allowed to access the bbt area
- *
- * Check, if the block is bad. Either by reading the bad block table or
- * calling of the scan function.
- */
-static int onenand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int ge=
tchip, int allowbbt)
+static int onenand_block_isbad_nolock(struct mtd_info *mtd, loff_t ofs,
+				      int allowbbt)
 {
 	struct onenand_chip *this =3D mtd->priv;
 	struct bbm_info *bbm =3D this->bbm;
@@ -1503,7 +1507,7 @@ static int onenand_erase(struct mtd_info *mtd, struct=
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
@@ -1567,11 +1571,16 @@ static void onenand_sync(struct mtd_info *mtd)
  */
 static int onenand_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
+	int ret;
+
 	/* Check for invalid offset */
 	if (ofs > mtd->size)
 		return -EINVAL;
=20
-	return onenand_block_checkbad(mtd, ofs, 1, 0);
+	onenand_get_device(mtd, FL_READING);
+	ret =3D onenand_block_isbad_nolock(mtd, ofs, 0);
+	onenand_release_device(mtd);
+	return ret;
 }
=20
 /**
@@ -1588,7 +1597,7 @@ static int onenand_default_block_markbad(struct mtd_i=
nfo *mtd, loff_t ofs)
 	struct bbm_info *bbm =3D this->bbm;
 	u_char buf[2] =3D {0, 0};
 	size_t retlen;
-	int block;
+	int block, ret;
=20
 	/* Get block number */
 	block =3D ((int) ofs) >> bbm->bbt_erase_shift;
@@ -1597,7 +1606,8 @@ static int onenand_default_block_markbad(struct mtd_i=
nfo *mtd, loff_t ofs)
=20
         /* We write two bytes, so we dont have to mess with 16 bit access =
*/
         ofs +=3D mtd->oobsize + (bbm->badblockpos & ~0x01);
-        return onenand_do_write_oob(mtd, ofs , 2, &retlen, buf, MTD_OOB_PL=
ACE);
+        ret =3D onenand_write_oob_nolock(mtd, ofs , 2, &retlen, buf, MTD_O=
OB_PLACE);
+	return ret;
 }
=20
 /**
@@ -1620,7 +1630,10 @@ static int onenand_block_markbad(struct mtd_info *mt=
d, loff_t ofs)
 		return ret;
 	}
=20
-	return this->block_markbad(mtd, ofs);
+	onenand_get_device(mtd, FL_WRITING);
+	ret =3D this->block_markbad(mtd, ofs);
+	onenand_release_device(mtd);
+	return ret;
 }
=20
 /**
@@ -1825,7 +1838,7 @@ static int do_otp_read(struct mtd_info *mtd, loff_t f=
rom, size_t len,
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
=20
-	ret =3D mtd->read(mtd, from, len, retlen, buf);
+	ret =3D onenand_read_nolock(mtd, from, len, retlen, buf);
=20
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
@@ -1837,14 +1850,14 @@ static int do_otp_read(struct mtd_info *mtd, loff_t=
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
@@ -1863,7 +1876,7 @@ static int do_otp_write(struct mtd_info *mtd, loff_t =
from, size_t len,
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
=20
-	ret =3D mtd->write(mtd, from, len, retlen, pbuf);
+	ret =3D onenand_write_nolock(mtd, to, len, retlen, pbuf);
=20
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
@@ -1892,7 +1905,8 @@ static int do_otp_lock(struct mtd_info *mtd, loff_t f=
rom, size_t len,
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
=20
-	ret =3D onenand_do_write_oob(mtd, from, len, retlen, buf, MTD_OOB_PLACE);
+	ret =3D onenand_write_oob_nolock(mtd, from, len, retlen, buf,
+				       MTD_OOB_PLACE);
=20
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
@@ -1939,13 +1953,16 @@ static int onenand_otp_walk(struct mtd_info *mtd, l=
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
@@ -1966,10 +1983,11 @@ static int onenand_otp_walk(struct mtd_info *mtd, l=
off_t from, size_t len,
 			*retlen +=3D size;
=20
 			if (ret < 0)
-				return ret;
+				break;
 		}
 		otp_pages--;
 	}
+	onenand_release_device(mtd);
=20
 	return 0;
 }
--=20
1.5.2.2


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

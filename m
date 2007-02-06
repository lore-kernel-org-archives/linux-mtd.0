From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>, <dedekind@infradead.org>
References: <45B0F546.8030406@nokia.com> <45C341FC.50805@nokia.com>
	<003c01c748f8$5ded23a0$c7a3580a@swcenter.sec.samsung.co.kr>
	<1170664548.3628.69.camel@sauron>
Subject: RE: [RFC PATCH] [MTD] OneNAND: Error message printing and
	badblockscan	errors
Date: Tue, 6 Feb 2007 17:13:30 +0900
Message-ID: <006a01c749c6$b3b1e180$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <1170664548.3628.69.camel@sauron>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian,

> 
> All we wanted is not to be silent in case of sever errors. We 
> hit this in practice, so the demand in the patch is quite practical.
> 
> If you do not want to print errors on scanning phase, looks 
> fair enough, just add an if there. But Adrian found out that 
> there are more difference between the wait functions in case 
> of scanning and normal operations - at least because they 
> react on errors differently. It is a good reason to have 2 
> separate function, what he did.
> 

Please check thie one
As you mentions, we separate the wait function and read oob for bbt

Thank you,
Kyungmin Park

--

diff --git a/drivers/mtd/onenand/onenand_base.c
b/drivers/mtd/onenand/onenand_base.c
index 553b24d..66e1c08 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -304,16 +304,16 @@ static int onenand_wait(struct mtd_info *mtd, int
state)
 	ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
 
 	if (ctrl & ONENAND_CTRL_ERROR) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error =
0x%04x\n", ctrl);
+		printk(KERN_ERR "onenand_wait: controller error =
0x%04x\n", ctrl);
 		if (ctrl & ONENAND_CTRL_LOCK)
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked
error.\n");
+			printk(KERN_ERR "onenand_wait: it's locked
error.\n");
 		return ctrl;
 	}
 
 	if (interrupt & ONENAND_INT_READ) {
 		int ecc = this->read_word(this->base +
ONENAND_REG_ECC_STATUS);
 		if (ecc) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error =
0x%04x\n", ecc);
+			printk(KERN_ERR "onenand_wait: ECC error =
0x%04x\n", ecc);
 			if (ecc & ONENAND_ECC_2BIT_ALL) {
 				mtd->ecc_stats.failed++;
 				return ecc;
@@ -703,7 +703,7 @@ static int onenand_read(struct mtd_info *mtd, loff_t
from, size_t len,
 
 	/* Do not allow reads past end of device */
 	if ((from + len) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_read: Attempt read beyond
end of device\n");
+		printk(KERN_ERR "onenand_read: Attempt read beyond end of
device\n");
 		*retlen = 0;
 		return -EINVAL;
 	}
@@ -834,7 +834,7 @@ static int onenand_transfer_auto_oob(struct mtd_info
*mtd, uint8_t *buf, int col
  *
  * OneNAND read out-of-band data from the spare area
  */
-int onenand_do_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
+static int onenand_do_read_oob(struct mtd_info *mtd, loff_t from, size_t
len,
 			size_t *retlen, u_char *buf, mtd_oob_mode_t mode)
 {
 	struct onenand_chip *this = mtd->priv;
@@ -854,7 +854,7 @@ int onenand_do_read_oob(struct mtd_info *mtd, loff_t
from, size_t len,
 	column = from & (mtd->oobsize - 1);
 
 	if (unlikely(column >= oobsize)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_oob: Attempted to
start read outside oob\n");
+		printk(KERN_ERR "onenand_read_oob: Attempted to start read
outside oob\n");
 		return -EINVAL;
 	}
 
@@ -862,7 +862,7 @@ int onenand_do_read_oob(struct mtd_info *mtd, loff_t
from, size_t len,
 	if (unlikely(from >= mtd->size ||
 		     column + len > ((mtd->size >> this->page_shift) -
 				     (from >> this->page_shift)) *
oobsize)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_oob: Attempted to
read beyond end of device\n");
+		printk(KERN_ERR "onenand_read_oob: Attempted to read beyond
end of device\n");
 		return -EINVAL;
 	}
 
@@ -888,7 +888,7 @@ int onenand_do_read_oob(struct mtd_info *mtd, loff_t
from, size_t len,
 			this->read_bufferram(mtd, ONENAND_SPARERAM, buf,
column, thislen);
 
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_oob: read
failed = 0x%x\n", ret);
+			printk(KERN_ERR "onenand_read_oob: read failed =
0x%x\n", ret);
 			break;
 		}
 
@@ -936,6 +936,121 @@ static int onenand_read_oob(struct mtd_info *mtd,
loff_t from,
 				   &ops->oobretlen, ops->oobbuf, ops->mode);
 }
 
+/**
+ * onenand_bbt_wait - [DEFAULT] wait until the command is done
+ * @param mtd		MTD device structure
+ * @param state		state to select the max. timeout value
+ *
+ * Wait for command done.
+ */
+static int onenand_bbt_wait(struct mtd_info *mtd, int state)
+{
+	struct onenand_chip *this = mtd->priv;
+	unsigned long timeout;
+	unsigned int interrupt;
+	unsigned int ctrl;
+
+	/* The 20 msec is enough */
+	timeout = jiffies + msecs_to_jiffies(20);
+	while (time_before(jiffies, timeout)) {
+		interrupt = this->read_word(this->base +
ONENAND_REG_INTERRUPT);
+		if (interrupt & ONENAND_INT_MASTER)
+			break;
+	}
+	/* To get correct interrupt status in timeout case */
+	interrupt = this->read_word(this->base + ONENAND_REG_INTERRUPT);
+	ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
+
+	if (ctrl & ONENAND_CTRL_ERROR) {
+		printk(KERN_DEBUG "onenand_bbt_wait: controller error =
0x%04x\n", ctrl);
+		/* Initial bad block case */
+		if (ctrl & ONENAND_CTRL_LOAD)
+			return ONENAND_BBT_READ_ERROR;
+		return ONENAND_BBT_READ_FATAL_ERROR;
+	}
+
+	if (interrupt & ONENAND_INT_READ) {
+		int ecc = this->read_word(this->base +
ONENAND_REG_ECC_STATUS);
+		if (ecc & ONENAND_ECC_2BIT_ALL)
+			return ONENAND_BBT_READ_ERROR;
+	} else {
+		printk(KERN_ERR "onenand_bbt_wait: read timeout!"
+			"ctrl=0x%04x intr=0x%04x\n", ctrl, interrupt);
+		return ONENAND_BBT_READ_FATAL_ERROR;
+	}
+
+	return 0;
+}
+
+/**
+ * onenand_bbt_read_oob - [MTD Interface] OneNAND read out-of-band for bbt
scan
+ * @param mtd		MTD device structure
+ * @param from		offset to read from
+ * @param @ops		oob operation description structure
+ *
+ * OneNAND read out-of-band data from the spare area for bbt scan
+ */
+int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from, 
+			    struct mtd_oob_ops *ops)
+{
+	struct onenand_chip *this = mtd->priv;
+	int read = 0, thislen, column;
+	int ret = 0;
+	size_t len = ops->ooblen;
+	u_char *buf = ops->oobbuf;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_bbt_read_oob: from = 0x%08x, len =
%i\n", (unsigned int) from, len);
+
+	/* Initialize return value */
+	ops->oobretlen = 0;
+
+	/* Do not allow reads past end of device */
+	if (unlikely((from + len) > mtd->size)) {
+		printk(KERN_ERR "onenand_bbt_read_oob: Attempt read beyond
end of device\n");
+		return ONENAND_BBT_READ_FATAL_ERROR;
+	}
+
+	/* Grab the lock and see if the device is available */
+	onenand_get_device(mtd, FL_READING);
+
+	column = from & (mtd->oobsize - 1);
+
+	while (read < len) {
+		cond_resched();
+
+		thislen = mtd->oobsize - column;
+		thislen = min_t(int, thislen, len);
+
+		this->command(mtd, ONENAND_CMD_READOOB, from, mtd->oobsize);
+
+		onenand_update_bufferram(mtd, from, 0);
+
+		ret = onenand_bbt_wait(mtd, FL_READING);
+		if (ret)
+			break;
+
+		this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column,
thislen);
+		read += thislen;
+		if (read == len)
+			break;
+
+		buf += thislen;
+
+		/* Read more? */
+		if (read < len) {
+			/* Update Page size */
+			from += mtd->writesize;
+			column = 0;
+		}
+	}
+
+	/* Deselect and wake up anyone waiting on the device */
+	onenand_release_device(mtd);
+
+	ops->oobretlen = read;
+	return ret;
+}
+
 #ifdef CONFIG_MTD_ONENAND_VERIFY_WRITE
 /**
  * onenand_verify_oob - [GENERIC] verify the oob contents after a write
@@ -1040,13 +1155,13 @@ static int onenand_write(struct mtd_info *mtd,
loff_t to, size_t len,
 
 	/* Do not allow writes past end of device */
 	if (unlikely((to + len) > mtd->size)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: Attempt write to
past end of device\n");
+		printk(KERN_ERR "onenand_write: Attempt write to past end
of device\n");
 		return -EINVAL;
 	}
 
 	/* Reject writes, which are not page aligned */
         if (unlikely(NOTALIGNED(to)) || unlikely(NOTALIGNED(len))) {
-                DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: Attempt to write
not page aligned data\n");
+                printk(KERN_ERR "onenand_write: Attempt to write not page
aligned data\n");
                 return -EINVAL;
         }
 
@@ -1086,14 +1201,14 @@ static int onenand_write(struct mtd_info *mtd,
loff_t to, size_t len,
 
 		ret = this->wait(mtd, FL_WRITING);
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: write
filaed %d\n", ret);
+			printk(KERN_ERR "onenand_write: write filaed %d\n",
ret);
 			break;
 		}
 
 		/* Only check verify write turn on */
 		ret = onenand_verify(mtd, (u_char *) wbuf, to, thislen);
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: verify
failed %d\n", ret);
+			printk(KERN_ERR "onenand_write: verify failed
%d\n", ret);
 			break;
 		}
 
@@ -1182,13 +1297,13 @@ static int onenand_do_write_oob(struct mtd_info
*mtd, loff_t to, size_t len,
 	column = to & (mtd->oobsize - 1);
 
 	if (unlikely(column >= oobsize)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: Attempted to
start write outside oob\n");
+		printk(KERN_ERR "onenand_write_oob: Attempted to start
write outside oob\n");
 		return -EINVAL;
 	}
 
 	/* For compatibility with NAND: Do not allow write past end of page
*/
 	if (column + len > oobsize) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: "
+		printk(KERN_ERR "onenand_write_oob: "
 		      "Attempt to write past end of page\n");
 		return -EINVAL;
 	}
@@ -1197,7 +1312,7 @@ static int onenand_do_write_oob(struct mtd_info *mtd,
loff_t to, size_t len,
 	if (unlikely(to >= mtd->size ||
 		     column + len > ((mtd->size >> this->page_shift) -
 				     (to >> this->page_shift)) * oobsize)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: Attempted to
write past end of device\n");
+		printk(KERN_ERR "onenand_write_oob: Attempted to write past
end of device\n");
 		return -EINVAL;
 	}
 
@@ -1227,13 +1342,13 @@ static int onenand_do_write_oob(struct mtd_info
*mtd, loff_t to, size_t len,
 
 		ret = this->wait(mtd, FL_WRITING);
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: write
failed %d\n", ret);
+			printk(KERN_ERR "onenand_write_oob: write failed
%d\n", ret);
 			break;
 		}
 
 		ret = onenand_verify_oob(mtd, this->page_buf, to);
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: verify
failed %d\n", ret);
+			printk(KERN_ERR "onenand_write_oob: verify failed
%d\n", ret);
 			break;
 		}
 
@@ -1316,19 +1431,19 @@ static int onenand_erase(struct mtd_info *mtd,
struct erase_info *instr)
 
 	/* Start address must align on block boundary */
 	if (unlikely(instr->addr & (block_size - 1))) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Unaligned
address\n");
+		printk(KERN_ERR "onenand_erase: Unaligned address\n");
 		return -EINVAL;
 	}
 
 	/* Length must align on block boundary */
 	if (unlikely(instr->len & (block_size - 1))) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Length not block
aligned\n");
+		printk(KERN_ERR "onenand_erase: Length not block
aligned\n");
 		return -EINVAL;
 	}
 
 	/* Do not allow erase past end of device */
 	if (unlikely((instr->len + instr->addr) > mtd->size)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Erase past end of
device\n");
+		printk(KERN_ERR "onenand_erase: Erase past end of
device\n");
 		return -EINVAL;
 	}
 
@@ -1358,7 +1473,7 @@ static int onenand_erase(struct mtd_info *mtd, struct
erase_info *instr)
 		ret = this->wait(mtd, FL_ERASING);
 		/* Check, if it is write protected */
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Failed
erase, block %d\n", (unsigned) (addr >> this->erase_shift));
+			printk(KERN_ERR "onenand_erase: Failed erase, block
%d\n", (unsigned) (addr >> this->erase_shift));
 			instr->state = MTD_ERASE_FAILED;
 			instr->fail_addr = addr;
 			goto erase_exit;
diff --git a/drivers/mtd/onenand/onenand_bbt.c
b/drivers/mtd/onenand/onenand_bbt.c
index acea9a1..aecdd50 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -17,8 +17,8 @@
 #include <linux/mtd/onenand.h>
 #include <linux/mtd/compatmac.h>
 
-extern int onenand_do_read_oob(struct mtd_info *mtd, loff_t from, size_t
len,
-			       size_t *retlen, u_char *buf, mtd_oob_mode_t
mode);
+extern int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
+				struct mtd_oob_ops *ops);
 
 /**
  * check_short_pattern - [GENERIC] check if a pattern is in the buffer
@@ -65,6 +65,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
struct nand_bbt_descr
 	int startblock;
 	loff_t from;
 	size_t readlen, ooblen;
+	struct mtd_oob_ops ops;
 
 	printk(KERN_INFO "Scanning device for bad blocks\n");
 
@@ -82,22 +83,24 @@ static int create_bbt(struct mtd_info *mtd, uint8_t
*buf, struct nand_bbt_descr
 	startblock = 0;
 	from = 0;
 
+	ops.mode = MTD_OOB_PLACE;
+	ops.ooblen = readlen;
+	ops.oobbuf = buf;
+	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
+
 	for (i = startblock; i < numblocks; ) {
 		int ret;
 
 		for (j = 0; j < len; j++) {
-			size_t retlen;
-
 			/* No need to read pages fully,
 			 * just read required OOB bytes */
-			ret = onenand_do_read_oob(mtd, from + j * mtd-
>writesize + bd->offs,
-						  readlen, &retlen,
&buf[0], MTD_OOB_PLACE);
+			ret = onenand_bbt_read_oob(mtd, from + j * mtd-
>writesize + bd->offs, &ops);
 
 			/* If it is a initial bad block, just ignore it */
-			if (ret && !(ret & ONENAND_CTRL_LOAD))
-				return ret;
+			if (ret == ONENAND_BBT_READ_FATAL_ERROR)
+				return -EIO;
 
-			if (check_short_pattern(&buf[j * scanlen], scanlen,
mtd->writesize, bd)) {
+			if (ret || check_short_pattern(&buf[j * scanlen],
scanlen, mtd->writesize, bd)) {
 				bbm->bbt[i >> 3] |= 0x03 << (i & 0x6);
 				printk(KERN_WARNING "Bad eraseblock %d at
0x%08x\n",
 					i >> 1, (unsigned int) from);
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 1221b7c..fff8c53 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -92,6 +92,13 @@ struct nand_bbt_descr {
  */
 #define ONENAND_BADBLOCK_POS	0
 
+/*
+ * Bad block scanning errors
+ */
+#define ONENAND_BBT_READ_ERROR		1
+#define ONENAND_BBT_READ_ECC_ERROR	2
+#define ONENAND_BBT_READ_FATAL_ERROR	4
+
 /**
  * struct bbm_info - [GENERIC] Bad Block Table data structure
  * @bbt_erase_shift:	[INTERN] number of address bits in a bbt entry

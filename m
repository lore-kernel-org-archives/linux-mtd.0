Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H7wrD-0008Ie-Cz
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 11:44:54 -0500
Message-ID: <45B0F546.8030406@nokia.com>
Date: Fri, 19 Jan 2007 18:43:50 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Kyungmin Park <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH] [MTD] OneNAND: Error message printing and bad block scan
	errors
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


Provide the bad block scan with its own read function
so that important error messages that are not from the
the bad block scan, can always be printed.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |  155 +++++++++++++++++++++++++++++++----
 drivers/mtd/onenand/onenand_bbt.c  |   11 +--
 include/linux/mtd/onenand.h        |    6 ++
 3 files changed, 148 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 38aa019..61c9433 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -304,16 +304,16 @@ static int onenand_wait(struct mtd_info 
 	ctrl = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
 
 	if (ctrl & ONENAND_CTRL_ERROR) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error = 0x%04x\n", ctrl);
+		printk(KERN_ERR "onenand_wait: controller error = 0x%04x\n", ctrl);
 		if (ctrl & ONENAND_CTRL_LOCK)
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error.\n");
+			printk(KERN_ERR "onenand_wait: it's locked error.\n");
 		return ctrl;
 	}
 
 	if (interrupt & ONENAND_INT_READ) {
 		int ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
 		if (ecc) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error = 0x%04x\n", ecc);
+			printk(KERN_ERR "onenand_wait: ECC error = 0x%04x\n", ecc);
 			if (ecc & ONENAND_ECC_2BIT_ALL) {
 				mtd->ecc_stats.failed++;
 				return ecc;
@@ -704,7 +704,7 @@ static int onenand_read(struct mtd_info 
 
 	/* Do not allow reads past end of device */
 	if ((from + len) > mtd->size) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_read: Attempt read beyond end of device\n");
+		printk(KERN_ERR "onenand_read: Attempt read beyond end of device\n");
 		*retlen = 0;
 		return -EINVAL;
 	}
@@ -796,7 +796,7 @@ static int onenand_read(struct mtd_info 
  *
  * OneNAND read out-of-band data from the spare area
  */
-int onenand_do_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
+static int onenand_do_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
 	struct onenand_chip *this = mtd->priv;
@@ -810,7 +810,7 @@ int onenand_do_read_oob(struct mtd_info 
 
 	/* Do not allow reads past end of device */
 	if (unlikely((from + len) > mtd->size)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_oob: Attempt read beyond end of device\n");
+		printk(KERN_ERR "onenand_read_oob: Attempt read beyond end of device\n");
 		return -EINVAL;
 	}
 
@@ -835,7 +835,7 @@ int onenand_do_read_oob(struct mtd_info 
 		this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);
 
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_read_oob: read failed = 0x%x\n", ret);
+			printk(KERN_ERR "onenand_read_oob: read failed = 0x%x\n", ret);
 			goto out;
 		}
 
@@ -863,6 +863,125 @@ out:
 }
 
 /**
+ * onenand_bbt_wait - wait until the command is done
+ * @param mtd		MTD device structure
+ *
+ * Wait for command done.
+ */
+static int onenand_bbt_wait(struct mtd_info *mtd)
+{
+	struct onenand_chip * this = mtd->priv;
+	unsigned long timeout;
+	unsigned int interrupt = 0;
+	unsigned int ctrl;
+
+	/* The 20 msec is enough */
+	timeout = jiffies + msecs_to_jiffies(20);
+	while (time_before(jiffies, timeout)) {
+		interrupt = this->read_word(this->base + ONENAND_REG_INTERRUPT);
+
+		if (interrupt & ONENAND_INT_MASTER)
+			break;
+	}
+	/* To get correct interrupt status in timeout case */
+	interrupt = this->read_word(this->base + ONENAND_REG_INTERRUPT);
+	ctrl      = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
+
+	if (ctrl & ONENAND_CTRL_ERROR) {
+		if (ctrl & ONENAND_CTRL_LOAD)
+			return ONENAND_BBT_READ_ERROR;
+		printk(KERN_ERR "onenand_bbt_wait: controller error = 0x%04x\n", ctrl);
+		return ONENAND_BBT_READ_FATAL_ERROR;
+	}
+
+	if (interrupt & ONENAND_INT_READ) {
+		int ecc = this->read_word(this->base + ONENAND_REG_ECC_STATUS);
+		if (ecc & ONENAND_ECC_2BIT_ALL)
+			return ONENAND_BBT_READ_ERROR;
+	} else {
+		printk(KERN_ERR "onenand_bbt_wait: read timeout! ctrl=0x%04x intr=0x%04x\n", ctrl, interrupt);
+		return ONENAND_BBT_READ_FATAL_ERROR;
+	}
+
+	return 0;
+}
+
+/**
+ * onenand_bbt_read_oob - [MTD Interface] OneNAND read out-of-band for bbt scan
+ * @param mtd		MTD device structure
+ * @param from		offset to read from
+ * @param len		number of bytes to read
+ * @param retlen	pointer to variable to store the number of read bytes
+ * @param buf		the databuffer to put data
+ *
+ * OneNAND read out-of-band data from the spare area for bbt scan
+ */
+int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
+			size_t *retlen, u_char *buf)
+{
+	struct onenand_chip *this = mtd->priv;
+	int read = 0, thislen, column;
+	int ret = 0;
+
+	DEBUG(MTD_DEBUG_LEVEL3, "onenand_bbt_read_oob: from = 0x%08x, len = %i\n", (unsigned int) from, (int) len);
+
+	/* Initialize return length value */
+	*retlen = 0;
+
+	/* Do not allow reads past end of device */
+	if (unlikely((from + len) > mtd->size)) {
+		printk(KERN_ERR "onenand_bbt_read_oob: Attempt read beyond end of device\n");
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
+		ret = onenand_bbt_wait(mtd);
+
+		if (ret)
+			goto out;
+
+		/* First copy data and check return value for ECC handling */
+
+		this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);
+
+		read += thislen;
+
+		if (read == len)
+			break;
+
+		buf += thislen;
+
+		/* Read more? */
+		if (read < len) {
+			/* Page size */
+			from += mtd->writesize;
+			column = 0;
+		}
+	}
+
+out:
+	/* Deselect and wake up anyone waiting on the device */
+	onenand_release_device(mtd);
+
+	*retlen = read;
+	return ret;
+}
+
+/**
  * onenand_read_oob - [MTD Interface] NAND write data and/or out-of-band
  * @mtd:	MTD device structure
  * @from:	offset to read from
@@ -974,13 +1093,13 @@ static int onenand_write(struct mtd_info
 
 	/* Do not allow writes past end of device */
 	if (unlikely((to + len) > mtd->size)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: Attempt write to past end of device\n");
+		printk(KERN_ERR "onenand_write: Attempt write to past end of device\n");
 		return -EINVAL;
 	}
 
 	/* Reject writes, which are not page aligned */
         if (unlikely(NOTALIGNED(to)) || unlikely(NOTALIGNED(len))) {
-                DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: Attempt to write not page aligned data\n");
+                printk(KERN_ERR "onenand_write: Attempt to write not page aligned data\n");
                 return -EINVAL;
         }
 
@@ -1020,14 +1139,14 @@ static int onenand_write(struct mtd_info
 
 		ret = this->wait(mtd, FL_WRITING);
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: write filaed %d\n", ret);
+			printk(KERN_ERR "onenand_write: write failed %d\n", ret);
 			break;
 		}
 
 		/* Only check verify write turn on */
 		ret = onenand_verify_page(mtd, (u_char *) wbuf, to);
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write: verify failed %d\n", ret);
+			printk(KERN_ERR "onenand_write: verify failed %d\n", ret);
 			break;
 		}
 
@@ -1073,7 +1192,7 @@ static int onenand_do_write_oob(struct m
 
 	/* Do not allow writes past end of device */
 	if (unlikely((to + len) > mtd->size)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: Attempt write to past end of device\n");
+		printk(KERN_ERR "onenand_write_oob: Attempt write to past end of device\n");
 		return -EINVAL;
 	}
 
@@ -1102,13 +1221,13 @@ static int onenand_do_write_oob(struct m
 
 		ret = this->wait(mtd, FL_WRITING);
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: write filaed %d\n", ret);
+			printk(KERN_ERR "onenand_write_oob: write filaed %d\n", ret);
 			goto out;
 		}
 
 		ret = onenand_verify_oob(mtd, buf, to, thislen);
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: verify failed %d\n", ret);
+			printk(KERN_ERR "onenand_write_oob: verify failed %d\n", ret);
 			goto out;
 		}
 
@@ -1185,19 +1304,19 @@ static int onenand_erase(struct mtd_info
 
 	/* Start address must align on block boundary */
 	if (unlikely(instr->addr & (block_size - 1))) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Unaligned address\n");
+		printk(KERN_ERR "onenand_erase: Unaligned address\n");
 		return -EINVAL;
 	}
 
 	/* Length must align on block boundary */
 	if (unlikely(instr->len & (block_size - 1))) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Length not block aligned\n");
+		printk(KERN_ERR "onenand_erase: Length not block aligned\n");
 		return -EINVAL;
 	}
 
 	/* Do not allow erase past end of device */
 	if (unlikely((instr->len + instr->addr) > mtd->size)) {
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Erase past end of device\n");
+		printk(KERN_ERR "onenand_erase: Erase past end of device\n");
 		return -EINVAL;
 	}
 
@@ -1227,7 +1346,7 @@ static int onenand_erase(struct mtd_info
 		ret = this->wait(mtd, FL_ERASING);
 		/* Check, if it is write protected */
 		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_erase: Failed erase, block %d\n", (unsigned) (addr >> this->erase_shift));
+			printk(KERN_ERR "onenand_erase: Failed erase, block %d\n", (unsigned) (addr >> this->erase_shift));
 			instr->state = MTD_ERASE_FAILED;
 			instr->fail_addr = addr;
 			goto erase_exit;
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index aa46b7f..610723c 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -17,7 +17,7 @@ #include <linux/mtd/mtd.h>
 #include <linux/mtd/onenand.h>
 #include <linux/mtd/compatmac.h>
 
-extern int onenand_do_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
+extern int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
 			       size_t *retlen, u_char *buf);
 
 /**
@@ -90,14 +90,13 @@ static int create_bbt(struct mtd_info *m
 
 			/* No need to read pages fully,
 			 * just read required OOB bytes */
-			ret = onenand_do_read_oob(mtd, from + j * mtd->writesize + bd->offs,
+			ret = onenand_bbt_read_oob(mtd, from + j * mtd->writesize + bd->offs,
 						  readlen, &retlen, &buf[0]);
 
-			/* If it is a initial bad block, just ignore it */
-			if (ret && !(ret & ONENAND_CTRL_LOAD))
-				return ret;
+			if (ret == ONENAND_BBT_READ_FATAL_ERROR)
+				return -1;
 
-			if (check_short_pattern(&buf[j * scanlen], scanlen, mtd->writesize, bd)) {
+			if (ret || check_short_pattern(&buf[j * scanlen], scanlen, mtd->writesize, bd)) {
 				bbm->bbt[i >> 3] |= 0x03 << (i & 0x6);
 				printk(KERN_WARNING "Bad eraseblock %d at 0x%08x\n",
 					i >> 1, (unsigned int) from);
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 60b3534..bb8cf8c 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -164,6 +164,12 @@ #define ONENAND_HAS_UNLOCK_ALL		(0x0002)
 #define ONENAND_PAGEBUF_ALLOC		(0x1000)
 
 /*
+ * Bad block scanning errors
+ */
+#define ONENAND_BBT_READ_ERROR			1
+#define ONENAND_BBT_READ_FATAL_ERROR		2
+
+/*
  * OneNAND Flash Manufacturer ID Codes
  */
 #define ONENAND_MFR_SAMSUNG	0xec
-- 
1.4.3

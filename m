Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MT5ZF-0007vd-El
	for linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 02:59:05 +0000
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KN4004WF2Y88Z@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 11:58:56 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KN400LV72Y814@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 21 Jul 2009 11:58:56 +0900 (KST)
Date: Tue, 21 Jul 2009 11:53:03 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] OneNAND: Runtime badblock check support
To: linux-mtd@lists.infradead.org
Message-id: <20090721025303.GA3693@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At bootloader, we don't need to read full page. It takes too long time.
Instead it only read pages required for boot.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 6e82909..f2b2d2d 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -9,7 +9,7 @@
  *	auto-placement support, read-while load support, various fixes
  *	Copyright (C) Nokia Corporation, 2007
  *
- *	Vishak G <vishak.g at samsung.com>, Rohit Hagargundgi <h.rohit at samsung.com>
+ *	Vishak G <vishak.g@samsung.com>, Rohit Hagargundgi <h.rohit@samsung.com>
  *	Flex-OneNAND support
  *	Copyright (C) Samsung Electronics, 2008
  *
@@ -1477,6 +1477,7 @@ static int onenand_bbt_wait(struct mtd_info *mtd, int state)
  * @param ops		oob operation description structure
  *
  * OneNAND read out-of-band data from the spare area for bbt scan
+ * Note that it operates without lock
  */
 int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from, 
 			    struct mtd_oob_ops *ops)
@@ -1498,9 +1499,6 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 		return ONENAND_BBT_READ_FATAL_ERROR;
 	}
 
-	/* Grab the lock and see if the device is available */
-	onenand_get_device(mtd, FL_READING);
-
 	column = from & (mtd->oobsize - 1);
 
 	readcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
@@ -1537,9 +1535,6 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 		}
 	}
 
-	/* Deselect and wake up anyone waiting on the device */
-	onenand_release_device(mtd);
-
 	ops->oobretlen = read;
 	return ret;
 }
@@ -3408,7 +3403,7 @@ static void onenand_resume(struct mtd_info *mtd)
 	if (this->state == FL_PM_SUSPENDED)
 		onenand_release_device(mtd);
 	else
-		printk(KERN_ERR "resume() called for the chip which is not"
+		printk(KERN_ERR "resume() called for the chip which is not "
 				"in suspended state\n");
 }
 
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index a91fcac..b8c0166 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -3,11 +3,17 @@
  *
  *  Bad Block Table support for the OneNAND driver
  *
- *  Copyright(c) 2005 Samsung Electronics
+ *  Copyright(c) 2005-2009 Samsung Electronics
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *
  *  Derived from nand_bbt.c
  *
+ *  Legend in badblock table:
+ *  	0x00	Normal
+ *  	0x01	RESERVED
+ *  	0x02	Used for runtime badblock check
+ *  	0x03	Bad block (initial or runtime)
+ *
  *  TODO:
  *    Split BBT core and chip specific BBT.
  */
@@ -17,6 +23,10 @@
 #include <linux/mtd/onenand.h>
 #include <linux/mtd/compatmac.h>
 
+#define BBT_NORMAL_BITS			0x00
+#define BBT_RUNTIME_BADBLOCK_BITS	0x02
+#define BBT_BADBLOCK_BITS		0x03
+
 /**
  * check_short_pattern - [GENERIC] check if a pattern is in the buffer
  * @param buf		the buffer to search
@@ -28,7 +38,6 @@
  * tables and good / bad block identifiers. Same as check_pattern, but
  * no optional empty check and the pattern is expected to start
  * at offset 0.
- *
  */
 static int check_short_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_descr *td)
 {
@@ -44,6 +53,51 @@ static int check_short_pattern(uint8_t *buf, int len, int paglen, struct nand_bb
 }
 
 /**
+ * read_page_oob - [GENERIC] Read oob for runtime badblock check
+ * @param mtd		MTD device structure
+ * @param from		the length of buffer to search
+ * @param buf		temporary buffer
+ *
+ * Read page oob at runtime badblock check
+ */
+static int read_page_oob(struct mtd_info *mtd, loff_t from, u_char *buf)
+{
+	struct onenand_chip *this = mtd->priv;
+	struct bbm_info *bbm = this->bbm;
+	struct nand_bbt_descr *bd = bbm->badblock_pattern;
+	struct mtd_oob_ops ops;
+	int ret, scanlen, block, j, res;
+
+	scanlen = 0;
+
+	ops.mode = MTD_OOB_PLACE;
+	ops.ooblen = 16;
+	ops.oobbuf = buf;
+	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
+
+	/* Get block number * 2 */
+	block = (int) (onenand_block(this, from) << 1);
+
+	/* Set normal block first */
+	res = BBT_NORMAL_BITS;
+	bbm->bbt[block >> 3] |= res << (block & 0x6);
+
+	for (j = 0; j < 2; j++) {
+		ret = onenand_bbt_read_oob(mtd, from + j * mtd->writesize + bd->offs, &ops);
+		if (ret || check_short_pattern(&buf[j * scanlen], scanlen, mtd->writesize, bd)) {
+			res = BBT_BADBLOCK_BITS;
+			bbm->bbt[block >> 3] |= res << (block & 0x6);
+			printk(KERN_WARNING "Bad eraseblock %d at 0x%08x\n",
+				block >> 1, (unsigned int) from);
+			mtd->ecc_stats.badblocks++;
+			break;
+		}
+	}
+
+	return res;
+}
+
+/**
  * create_bbt - [GENERIC] Create a bad block table by scanning the device
  * @param mtd		MTD device structure
  * @param buf		temporary buffer
@@ -99,7 +153,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 				return -EIO;
 
 			if (ret || check_short_pattern(&buf[j * scanlen], scanlen, mtd->writesize, bd)) {
-				bbm->bbt[i >> 3] |= 0x03 << (i & 0x6);
+				bbm->bbt[i >> 3] |= BBT_BADBLOCK_BITS << (i & 0x6);
 				printk(KERN_WARNING "Bad eraseblock %d at 0x%08x\n",
 					i >> 1, (unsigned int) from);
 				mtd->ecc_stats.badblocks++;
@@ -118,7 +172,6 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 	return 0;
 }
 
-
 /**
  * onenand_memory_bbt - [GENERIC] create a memory based bad block table
  * @param mtd		MTD device structure
@@ -127,7 +180,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
  * The function creates a memory based bbt by scanning the device
  * for manufacturer / software marked good / bad blocks
  */
-static inline int onenand_memory_bbt (struct mtd_info *mtd, struct nand_bbt_descr *bd)
+static int onenand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
 	struct onenand_chip *this = mtd->priv;
 
@@ -152,6 +205,12 @@ static int onenand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 	block = (int) (onenand_block(this, offs) << 1);
 	res = (bbm->bbt[block >> 3] >> (block & 0x06)) & 0x03;
 
+	if (this->options & ONENAND_RUNTIME_BADBLOCK_CHECK) {
+		if (res == BBT_RUNTIME_BADBLOCK_BITS)
+			res = read_page_oob(mtd, offs, this->page_buf);
+	}
+
+
 	DEBUG(MTD_DEBUG_LEVEL2, "onenand_isbad_bbt: bbt info for offs 0x%08x: (block %d) 0x%02x\n",
 		(unsigned int) offs, block >> 1, res);
 
@@ -201,6 +260,12 @@ int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	if (!bbm->isbad_bbt)
 		bbm->isbad_bbt = onenand_isbad_bbt;
 
+	if (this->options & ONENAND_RUNTIME_BADBLOCK_CHECK) {
+		printk(KERN_INFO "Scanning device for bad blocks (skipped)\n");
+		memset(bbm->bbt, 0xAA, len);
+		return 0;
+	}
+
 	/* Scan the device to build a memory based bad block table */
 	if ((ret = onenand_memory_bbt(mtd, bd))) {
 		printk(KERN_ERR "onenand_scan_bbt: Can't scan flash and build the RAM-based BBT\n");
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 4b92abc..e4b8505 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -670,6 +670,9 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		goto oob_buf_fail;
 	}
 
+	/* Set runtime badblock check before onenand_scan() */
+	this->options |= ONENAND_RUNTIME_BADBLOCK_CHECK;
+
 	if (onenand_scan(mtd, 1)) {
 		err = -EFAULT;
 		goto scan_failed;
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 8ed8733..5697476 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -189,6 +189,7 @@ struct onenand_chip {
 #define ONENAND_HAS_UNLOCK_ALL		(0x0002)
 #define ONENAND_HAS_2PLANE		(0x0004)
 #define ONENAND_SKIP_UNLOCK_CHECK	(0x0100)
+#define ONENAND_RUNTIME_BADBLOCK_CHECK	(0x0200)
 #define ONENAND_PAGEBUF_ALLOC		(0x1000)
 #define ONENAND_OOBBUF_ALLOC		(0x2000)
 

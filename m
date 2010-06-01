Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJMiw-0001F6-Em
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 08:21:24 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0L3B00EKHTVF47@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 17:21:16 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L3B00FX7TVF9W@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 17:21:15 +0900 (KST)
Date: Tue, 01 Jun 2010 17:17:35 +0900
From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH 1/2] mtd: OneNAND: Add runtime badblock check feature
To: linux-mtd@lists.infradead.org
Message-id: <1275380256-15315-1-git-send-email-jy0922.shim@samsung.com>
Content-transfer-encoding: 7BIT
Cc: Kyungmin Park <kyungmin.park@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

This patch is to support runtime badblock checking. This supports only
OneNAND currently. The OneNAND badblock checking when boots occurs boot
time delay. We can reduce boot time because can detect badblock at
runtime.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/Kconfig                |    6 +++
 drivers/mtd/mtdpart.c              |    3 +
 drivers/mtd/onenand/onenand_base.c |   14 +++---
 drivers/mtd/onenand/onenand_bbt.c  |   79 ++++++++++++++++++++++++++++++++++-
 include/linux/mtd/onenand.h        |    1 +
 5 files changed, 93 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index f8210bf..2584928 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -328,6 +328,12 @@ config MTD_OOPS
 	  To use, add console=ttyMTDx to the kernel command line,
 	  where x is the MTD device number to use.
 
+config MTD_RUNTIME_BADBLOCK_CHECK
+	bool "Runtime badblock check support"
+	depends on MTD_ONENAND
+	help
+	  This enables check badblocks at access time.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index b8043a9..f11d944 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -485,6 +485,8 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 	}
 
 	slave->mtd.ecclayout = master->ecclayout;
+
+#ifndef CONFIG_MTD_RUNTIME_BADBLOCK_CHECK
 	if (master->block_isbad) {
 		uint64_t offs = 0;
 
@@ -495,6 +497,7 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 			offs += slave->mtd.erasesize;
 		}
 	}
+#endif
 
 out_register:
 	/* register our partition */
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index fc91c4a..93597ff 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1536,6 +1536,7 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 	int ret = 0, readcmd;
 	size_t len = ops->ooblen;
 	u_char *buf = ops->oobbuf;
+	int update = 0;
 
 	DEBUG(MTD_DEBUG_LEVEL3, "%s: from = 0x%08x, len = %zi\n",
 		__func__, (unsigned int) from, len);
@@ -1550,13 +1551,15 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 		return ONENAND_BBT_READ_FATAL_ERROR;
 	}
 
-	/* Grab the lock and see if the device is available */
-	onenand_get_device(mtd, FL_READING);
-
 	column = from & (mtd->oobsize - 1);
 
 	readcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
 
+	if (this->options & ONENAND_RUNTIME_BADBLOCK_CHECK) {
+		readcmd = ONENAND_CMD_READ;
+		update = 1;
+	}
+
 	while (read < len) {
 		cond_resched();
 
@@ -1565,7 +1568,7 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 
 		this->command(mtd, readcmd, from, mtd->oobsize);
 
-		onenand_update_bufferram(mtd, from, 0);
+		onenand_update_bufferram(mtd, from, update);
 
 		ret = this->bbt_wait(mtd, FL_READING);
 		if (unlikely(ret))
@@ -1589,9 +1592,6 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 		}
 	}
 
-	/* Deselect and wake up anyone waiting on the device */
-	onenand_release_device(mtd);
-
 	ops->oobretlen = read;
 	return ret;
 }
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index a91fcac..802cf20 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -3,11 +3,17 @@
  *
  *  Bad Block Table support for the OneNAND driver
  *
- *  Copyright(c) 2005 Samsung Electronics
+ *  Copyright(c) 2005-2010 Samsung Electronics
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *
  *  Derived from nand_bbt.c
  *
+ *  Legend in badblock table:
+ *     0x00	Normal
+ *     0x01	RESERVED
+ *     0x02	Used for runtime badblock check
+ *     0x03	Bad block (initial or runtime)
+ *
  *  TODO:
  *    Split BBT core and chip specific BBT.
  */
@@ -17,6 +23,16 @@
 #include <linux/mtd/onenand.h>
 #include <linux/mtd/compatmac.h>
 
+#define BBT_NORMAL_BITS			0x00
+#define BBT_RUNTIME_BADBLOCK_BITS	0x02
+#define BBT_BADBLOCK_BITS		0x03
+
+#ifdef CONFIG_MTD_RUNTIME_BADBLOCK_CHECK
+#define BBT_SCAN_PAGE			1
+#else
+#define BBT_SCAN_PAGE			2
+#endif
+
 /**
  * check_short_pattern - [GENERIC] check if a pattern is in the buffer
  * @param buf		the buffer to search
@@ -44,6 +60,52 @@ static int check_short_pattern(uint8_t *buf, int len, int paglen, struct nand_bb
 }
 
 /**
+ * read_page_oob - [GENERIC] Read oob for runtime badblock check
+ * @param mtd          MTD device structure
+ * @param from         the length of buffer to search
+ * @param buf          temporary buffer
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
+	ops.ooblen = 32;
+	ops.oobbuf = buf;
+	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
+
+	/* Get block number * 2 */
+	block = (int) ((from >> this->erase_shift) << 1);
+
+	/* Set normal block first */
+	res = BBT_NORMAL_BITS;
+	bbm->bbt[block >> 3] &= ~(0x3 << (block & 0x6));
+	bbm->bbt[block >> 3] |= res << (block & 0x6);
+
+	for (j = 0; j < BBT_SCAN_PAGE; j++) {
+		ret = onenand_bbt_read_oob(mtd, from + j * mtd->writesize + bd->offs, &ops);
+		if (ret || check_short_pattern(&buf[j * scanlen], scanlen, mtd->writesize, bd)) {
+			res = BBT_BADBLOCK_BITS;
+			bbm->bbt[block >> 3] |= res << (block & 0x6);
+			printk(KERN_WARNING "Bad eraseblock %d at 0x%08x\n",
+					block >> 1, (unsigned int) from);
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
@@ -67,7 +129,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 
 	printk(KERN_INFO "Scanning device for bad blocks\n");
 
-	len = 2;
+	len = BBT_SCAN_PAGE;
 
 	/* We need only read few bytes from the OOB area */
 	scanlen = ooblen = 0;
@@ -99,7 +161,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 				return -EIO;
 
 			if (ret || check_short_pattern(&buf[j * scanlen], scanlen, mtd->writesize, bd)) {
-				bbm->bbt[i >> 3] |= 0x03 << (i & 0x6);
+				bbm->bbt[i >> 3] |= BBT_BADBLOCK_BITS << (i & 0x6);
 				printk(KERN_WARNING "Bad eraseblock %d at 0x%08x\n",
 					i >> 1, (unsigned int) from);
 				mtd->ecc_stats.badblocks++;
@@ -152,6 +214,11 @@ static int onenand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 	block = (int) (onenand_block(this, offs) << 1);
 	res = (bbm->bbt[block >> 3] >> (block & 0x06)) & 0x03;
 
+	if (this->options & ONENAND_RUNTIME_BADBLOCK_CHECK) {
+		if (res == BBT_RUNTIME_BADBLOCK_BITS)
+			res = read_page_oob(mtd, offs, this->page_buf);
+	}
+
 	DEBUG(MTD_DEBUG_LEVEL2, "onenand_isbad_bbt: bbt info for offs 0x%08x: (block %d) 0x%02x\n",
 		(unsigned int) offs, block >> 1, res);
 
@@ -201,6 +268,12 @@ int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
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
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 57c3bb4..059b5f7 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -181,6 +181,7 @@ struct onenand_chip {
 #define ONENAND_HAS_2PLANE		(0x0004)
 #define ONENAND_HAS_4KB_PAGE		(0x0008)
 #define ONENAND_SKIP_UNLOCK_CHECK	(0x0100)
+#define ONENAND_RUNTIME_BADBLOCK_CHECK	(0x0200)
 #define ONENAND_PAGEBUF_ALLOC		(0x1000)
 #define ONENAND_OOBBUF_ALLOC		(0x2000)
 
-- 
1.7.0.4

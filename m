Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ePpHw-00045T-H3
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 12:40:32 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>
Subject: [PATCH v3 4/4] mtd: Fallback to ->_read/write_oob() when
 ->_read/write() is missing
Date: Fri, 15 Dec 2017 13:39:54 +0100
Message-Id: <20171215123954.30017-5-boris.brezillon@free-electrons.com>
In-Reply-To: <20171215123954.30017-1-boris.brezillon@free-electrons.com>
References: <20171215123954.30017-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some MTD sublayers/drivers are implementing ->_read/write_oob() and
provide dummy wrappers for their ->_read/write() implementations.
Let the core handle this case instead of duplicating the logic.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Acked-by: Brian Norris <computersforpeace@gmail.com>
---
Changes in v3:
- none

Changes in v2:
- none
---
 drivers/mtd/devices/docg3.c        | 65 --------------------------------------
 drivers/mtd/mtdcore.c              | 31 ++++++++++++++++--
 drivers/mtd/nand/nand_base.c       | 56 --------------------------------
 drivers/mtd/onenand/onenand_base.c | 63 ------------------------------------
 4 files changed, 29 insertions(+), 186 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 0806f72102c0..5fb5e93d1547 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -990,36 +990,6 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 	goto out;
 }
 
-/**
- * doc_read - Read bytes from flash
- * @mtd: the device
- * @from: the offset from first block and first page, in bytes, aligned on page
- *        size
- * @len: the number of bytes to read (must be a multiple of 4)
- * @retlen: the number of bytes actually read
- * @buf: the filled in buffer
- *
- * Reads flash memory pages. This function does not read the OOB chunk, but only
- * the page data.
- *
- * Returns 0 if read successful, of -EIO, -EINVAL if an error occurred
- */
-static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
-	     size_t *retlen, u_char *buf)
-{
-	struct mtd_oob_ops ops;
-	size_t ret;
-
-	memset(&ops, 0, sizeof(ops));
-	ops.datbuf = buf;
-	ops.len = len;
-	ops.mode = MTD_OPS_AUTO_OOB;
-
-	ret = doc_read_oob(mtd, from, &ops);
-	*retlen = ops.retlen;
-	return ret;
-}
-
 static int doc_reload_bbt(struct docg3 *docg3)
 {
 	int block = DOC_LAYOUT_BLOCK_BBT;
@@ -1513,39 +1483,6 @@ static int doc_write_oob(struct mtd_info *mtd, loff_t ofs,
 	return ret;
 }
 
-/**
- * doc_write - Write a buffer to the chip
- * @mtd: the device
- * @to: the offset from first block and first page, in bytes, aligned on page
- *      size
- * @len: the number of bytes to write (must be a full page size, ie. 512)
- * @retlen: the number of bytes actually written (0 or 512)
- * @buf: the buffer to get bytes from
- *
- * Writes data to the chip.
- *
- * Returns 0 if write successful, -EIO if write error
- */
-static int doc_write(struct mtd_info *mtd, loff_t to, size_t len,
-		     size_t *retlen, const u_char *buf)
-{
-	struct docg3 *docg3 = mtd->priv;
-	int ret;
-	struct mtd_oob_ops ops;
-
-	doc_dbg("doc_write(to=%lld, len=%zu)\n", to, len);
-	ops.datbuf = (char *)buf;
-	ops.len = len;
-	ops.mode = MTD_OPS_PLACE_OOB;
-	ops.oobbuf = NULL;
-	ops.ooblen = 0;
-	ops.ooboffs = 0;
-
-	ret = doc_write_oob(mtd, to, &ops);
-	*retlen = ops.retlen;
-	return ret;
-}
-
 static struct docg3 *sysfs_dev2docg3(struct device *dev,
 				     struct device_attribute *attr)
 {
@@ -1866,8 +1803,6 @@ static int __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 	mtd->writebufsize = mtd->writesize = DOC_LAYOUT_PAGE_SIZE;
 	mtd->oobsize = DOC_LAYOUT_OOB_SIZE;
 	mtd->_erase = doc_erase;
-	mtd->_read = doc_read;
-	mtd->_write = doc_write;
 	mtd->_read_oob = doc_read_oob;
 	mtd->_write_oob = doc_write_oob;
 	mtd->_block_isbad = doc_block_isbad;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 642c35dde686..d7ab091b36b2 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1058,7 +1058,20 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	 * representing the maximum number of bitflips that were corrected on
 	 * any one ecc region (if applicable; zero otherwise).
 	 */
-	ret_code = mtd->_read(mtd, from, len, retlen, buf);
+	if (mtd->_read) {
+		ret_code = mtd->_read(mtd, from, len, retlen, buf);
+	} else if (mtd->_read_oob) {
+		struct mtd_oob_ops ops = {
+			.len = len,
+			.datbuf = buf,
+		};
+
+		ret_code = mtd->_read_oob(mtd, from, &ops);
+		*retlen = ops.retlen;
+	} else {
+		return -ENOTSUPP;
+	}
+
 	if (unlikely(ret_code < 0))
 		return ret_code;
 	if (mtd->ecc_strength == 0)
@@ -1073,11 +1086,25 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	*retlen = 0;
 	if (to < 0 || to >= mtd->size || len > mtd->size - to)
 		return -EINVAL;
-	if (!mtd->_write || !(mtd->flags & MTD_WRITEABLE))
+	if ((!mtd->_write && !mtd->_write_oob) ||
+	    !(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
 	if (!len)
 		return 0;
 	ledtrig_mtd_activity();
+
+	if (!mtd->_write) {
+		struct mtd_oob_ops ops = {
+			.len = len,
+			.datbuf = (u8 *)buf,
+		};
+		int ret;
+
+		ret = mtd->_write_oob(mtd, to, &ops);
+		*retlen = ops.retlen;
+		return ret;
+	}
+
 	return mtd->_write(mtd, to, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_write);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 6135d007a068..889ceadbf607 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2027,33 +2027,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 }
 
 /**
- * nand_read - [MTD Interface] MTD compatibility function for nand_do_read_ecc
- * @mtd: MTD device structure
- * @from: offset to read from
- * @len: number of bytes to read
- * @retlen: pointer to variable to store the number of read bytes
- * @buf: the databuffer to put data
- *
- * Get hold of the chip and call nand_do_read.
- */
-static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
-		     size_t *retlen, uint8_t *buf)
-{
-	struct mtd_oob_ops ops;
-	int ret;
-
-	nand_get_device(mtd, FL_READING);
-	memset(&ops, 0, sizeof(ops));
-	ops.len = len;
-	ops.datbuf = buf;
-	ops.mode = MTD_OPS_PLACE_OOB;
-	ret = nand_do_read_ops(mtd, from, &ops);
-	*retlen = ops.retlen;
-	nand_release_device(mtd);
-	return ret;
-}
-
-/**
  * nand_read_oob_std - [REPLACEABLE] the most common OOB data read function
  * @mtd: mtd info structure
  * @chip: nand chip info structure
@@ -2822,33 +2795,6 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 }
 
 /**
- * nand_write - [MTD Interface] NAND write with ECC
- * @mtd: MTD device structure
- * @to: offset to write to
- * @len: number of bytes to write
- * @retlen: pointer to variable to store the number of written bytes
- * @buf: the data to write
- *
- * NAND write with ECC.
- */
-static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
-			  size_t *retlen, const uint8_t *buf)
-{
-	struct mtd_oob_ops ops;
-	int ret;
-
-	nand_get_device(mtd, FL_WRITING);
-	memset(&ops, 0, sizeof(ops));
-	ops.len = len;
-	ops.datbuf = (uint8_t *)buf;
-	ops.mode = MTD_OPS_PLACE_OOB;
-	ret = nand_do_write_ops(mtd, to, &ops);
-	*retlen = ops.retlen;
-	nand_release_device(mtd);
-	return ret;
-}
-
-/**
  * nand_do_write_oob - [MTD Interface] NAND write out-of-band
  * @mtd: MTD device structure
  * @to: offset to write to
@@ -4917,8 +4863,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->_erase = nand_erase;
 	mtd->_point = NULL;
 	mtd->_unpoint = NULL;
-	mtd->_read = nand_read;
-	mtd->_write = nand_write;
 	mtd->_panic_write = panic_nand_write;
 	mtd->_read_oob = nand_read_oob;
 	mtd->_write_oob = nand_write_oob;
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 1a6d0e367b89..050ba8a87543 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1448,38 +1448,6 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 }
 
 /**
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
-{
-	struct onenand_chip *this = mtd->priv;
-	struct mtd_oob_ops ops = {
-		.len	= len,
-		.ooblen	= 0,
-		.datbuf	= buf,
-		.oobbuf	= NULL,
-	};
-	int ret;
-
-	onenand_get_device(mtd, FL_READING);
-	ret = ONENAND_IS_4KB_PAGE(this) ?
-		onenand_mlc_read_ops_nolock(mtd, from, &ops) :
-		onenand_read_ops_nolock(mtd, from, &ops);
-	onenand_release_device(mtd);
-
-	*retlen = ops.retlen;
-	return ret;
-}
-
-/**
  * onenand_read_oob - [MTD Interface] Read main and/or out-of-band
  * @param mtd:		MTD device structure
  * @param from:		offset to read from
@@ -2129,35 +2097,6 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 }
 
 /**
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
-{
-	struct mtd_oob_ops ops = {
-		.len	= len,
-		.ooblen	= 0,
-		.datbuf	= (u_char *) buf,
-		.oobbuf	= NULL,
-	};
-	int ret;
-
-	onenand_get_device(mtd, FL_WRITING);
-	ret = onenand_write_ops_nolock(mtd, to, &ops);
-	onenand_release_device(mtd);
-
-	*retlen = ops.retlen;
-	return ret;
-}
-
-/**
  * onenand_write_oob - [MTD Interface] NAND write data and/or out-of-band
  * @param mtd:		MTD device structure
  * @param to:		offset to write
@@ -4038,8 +3977,6 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	mtd->_erase = onenand_erase;
 	mtd->_point = NULL;
 	mtd->_unpoint = NULL;
-	mtd->_read = onenand_read;
-	mtd->_write = onenand_write;
 	mtd->_read_oob = onenand_read_oob;
 	mtd->_write_oob = onenand_write_oob;
 	mtd->_panic_write = onenand_panic_write;
-- 
2.11.0

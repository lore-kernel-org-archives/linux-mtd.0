Date: Wed, 28 May 2008 14:42:48 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, tglx@linutronix.de, joern@logfs.org,
	dedekind@infradead.org, linux-mtd@lists.infradead.org
Subject: [RFC/PATCH 3/3] NAND multiple plane feature 
Message-ID: <alpine.LFD.1.10.0805281410030.23606@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This part adds  multiplane commands support to read/write/erase
procedures.

This example may help to understand patch. 
Assume we have device with two planes. And we got request to write 4KB
of data at offset 0x2000. 
According to data sheets patch performs the following operations:
1. we send PAGEPROG_MP command to write 2KB of data at 0x1000 of erase
block #0
2. we send PAGEPROG command to write 2KB of data at 0x1000 of erase
block #1

In similar way work read and erase procedures.

Signed-off-by: Vasiliy Leonenko <vasiliy.leonenko@gmail.com>
Signed-off-by: Alexey Korolev <akorolev@infradead.org>
--------
 drivers/mtd/nand/nand_base.c |  291 +++++++++++++++++++++++++++++--------------
 include/linux/mtd/nand.h     |   14 --
 2 files changed, 205 insertions(+), 100 deletions(-)


diff -Nurp linux-2.6.24.3/drivers/mtd/nand/nand_base.c linux-2.6.24.3-dp/drivers/mtd/nand/nand_base.c
--- linux-2.6.24.3/drivers/mtd/nand/nand_base.c	2008-05-28 15:08:32.000000000 +0400
+++ linux-2.6.24.3-dp/drivers/mtd/nand/nand_base.c	2008-05-28 15:08:07.000000000 +0400
@@ -594,7 +594,9 @@ static void nand_command_lp(struct mtd_i
 
 	case NAND_CMD_CACHEDPROG:
 	case NAND_CMD_PAGEPROG:
+	case NAND_CMD_PAGEPROG_MP:
 	case NAND_CMD_ERASE1:
+	case NAND_CMD_ERASE_MP:
 	case NAND_CMD_ERASE2:
 	case NAND_CMD_SEQIN:
 	case NAND_CMD_RNDIN:
@@ -748,12 +750,13 @@ static int nand_wait(struct mtd_info *mt
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ * @oobbuf:	buffer to store read oob
  */
 static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-			      uint8_t *buf)
+			      uint8_t *buf, uint8_t *oobbuf)
 {
 	chip->read_buf(mtd, buf, chip->page_phys_size);
-	chip->read_buf(mtd, chip->oob_poi, chip->oob_phys_size);
+	chip->read_buf(mtd, oobbuf, chip->oob_phys_size);
 	return 0;
 }
 
@@ -762,9 +765,10 @@ static int nand_read_page_raw(struct mtd
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ * @oobbuf:	buffer to store read oob
  */
 static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf)
+				uint8_t *buf, uint8_t *oobbuf)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -774,13 +778,13 @@ static int nand_read_page_swecc(struct m
 	uint8_t *ecc_code = chip->buffers->ecccode;
 	uint32_t *eccpos = chip->ecc.layout->eccpos;
 
-	chip->ecc.read_page_raw(mtd, chip, buf);
+	chip->ecc.read_page_raw(mtd, chip, buf, oobbuf);
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
 		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
 
 	for (i = 0; i < chip->ecc.total; i++)
-		ecc_code[i] = chip->oob_poi[eccpos[i]];
+		ecc_code[i] = oobbuf[eccpos[i]];
 
 	eccsteps = chip->ecc.steps;
 	p = buf;
@@ -802,11 +806,12 @@ static int nand_read_page_swecc(struct m
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ * @oobbuf:	buffer to store read oob
  *
  * Not for syndrome calculating ecc controllers which need a special oob layout
  */
 static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf)
+				uint8_t *buf, uint8_t *oobbuf)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -821,10 +826,10 @@ static int nand_read_page_hwecc(struct m
 		chip->read_buf(mtd, p, eccsize);
 		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
 	}
-	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	chip->read_buf(mtd, oobbuf, mtd->oobsize);
 
 	for (i = 0; i < chip->ecc.total; i++)
-		ecc_code[i] = chip->oob_poi[eccpos[i]];
+		ecc_code[i] = oobbuf[eccpos[i]];
 
 	eccsteps = chip->ecc.steps;
 	p = buf;
@@ -846,18 +851,19 @@ static int nand_read_page_hwecc(struct m
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
+ * @oobbuf:	buffer to store read oob
  *
  * The hw generator calculates the error syndrome automatically. Therefor
  * we need a special oob layout and handling.
  */
 static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
-				   uint8_t *buf)
+				   uint8_t *buf, uint8_t *oobbuf)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
 	int eccsteps = chip->ecc.steps;
 	uint8_t *p = buf;
-	uint8_t *oob = chip->oob_poi;
+	uint8_t *oob = oobbuf;
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
 		int stat;
@@ -888,7 +894,7 @@ static int nand_read_page_syndrome(struc
 	}
 
 	/* Calculate remaining oob bytes */
-	i = mtd->oobsize - (oob - chip->oob_poi);
+	i = mtd->oobsize - (oob - oobbuf);
 	if (i)
 		chip->read_buf(mtd, oob, i);
 
@@ -944,6 +950,70 @@ static uint8_t *nand_transfer_oob(struct
 }
 
 /**
+ * nand_read_operations - [Internal] Read data from device
+ *                         using different read procedures
+ *
+ * @mtd:	MTD device structure
+ * @chip:	nand chip structure
+ * @buf:	the databuffer to put data
+ * @offt:	offset on device to read
+ * @len:	length of data to read
+ * @sndcmd:	send commnad flag
+ * @raw:	read data with oob flag
+ *
+ * Internal function. Called with chip held.
+ */
+static int nand_read_operations(struct mtd_info *mtd, struct nand_chip *chip,
+				      const uint8_t *buf, loff_t offt, int len, int sndcmd, int raw)
+{
+	int i = 0;
+	int ret, phys_page;
+	int page = (int)(offt >> chip->page_shift) & chip->pagemask;
+	int block_mask = (1 << (chip->erase_shift - chip->page_shift)) - 1;
+	int col, bytes, start_block, page_num;
+	uint8_t *datbuf, *oobbuf;
+
+	/* starting erase block at first plane */
+	start_block = (page & ~block_mask) * chip->numplanes;
+	page_num = page & block_mask;
+	while (i < chip->numplanes) {
+		datbuf = (uint8_t *)(buf + chip->page_phys_size * i);
+		oobbuf = chip->oob_poi + chip->oob_phys_size * i;
+		col = (int)(offt & (mtd->writesize - 1));
+		/* calculate column for current plane */
+		col = (int)(col & (chip->page_phys_size - 1));
+		bytes = min(chip->page_phys_size - col, len);
+
+		phys_page = start_block + page_num + (block_mask + 1) * i;
+		if (likely(sndcmd)) {
+			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, phys_page);
+			if (chip->numplanes == 1)
+				sndcmd = 0;
+		}
+		/* Now read the page into the buffer */
+		if (unlikely(raw))
+			ret = chip->ecc.read_page_raw(mtd, chip, datbuf, oobbuf);
+		else
+			ret = chip->ecc.read_page(mtd, chip, datbuf, oobbuf);
+
+		offt += bytes;
+		len -= bytes;
+		i++;
+
+		if (ret)
+			break;
+
+		if (!(chip->options & NAND_NO_READRDY)) {
+			if (!chip->dev_ready)
+				udelay(chip->chip_delay);
+			else
+				nand_wait_ready(mtd);
+			}
+	}
+	return ret;
+}
+
+/**
  * nand_do_read_ops - [Internal] Read data with ECC
  *
  * @mtd:	MTD device structure
@@ -981,45 +1051,30 @@ static int nand_do_read_ops(struct mtd_i
 	while(1) {
 		bytes = min(mtd->writesize - col, readlen);
 		aligned = (bytes == mtd->writesize);
-
 		/* Is the current page in the buffer ? */
 		if (realpage != chip->pagebuf || oob) {
 			bufpoi = aligned ? buf : chip->buffers->databuf;
 
-			if (likely(sndcmd)) {
-				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
-				sndcmd = 0;
-			}
-
-			/* Now read the page into the buffer */
-			if (unlikely(ops->mode == MTD_OOB_RAW))
-				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi);
-			else
-				ret = chip->ecc.read_page(mtd, chip, bufpoi);
-			if (ret < 0)
-				break;
+			nand_read_operations(mtd, chip, bufpoi, from, bytes, sndcmd, (ops->mode == MTD_OOB_RAW));
 
 			/* Transfer not aligned data */
 			if (!aligned) {
 				chip->pagebuf = realpage;
 				memcpy(buf, chip->buffers->databuf + col, bytes);
 			}
-
 			buf += bytes;
+			from += bytes;
 
 			if (unlikely(oob)) {
 				/* Raw mode does data:oob:data:oob */
 				if (ops->mode != MTD_OOB_RAW) {
-					int toread = min(oobreadlen,
-						chip->ecc.layout->oobavail);
+					int toread = min(oobreadlen, chip->ecc.layout->oobavail);
 					if (toread) {
-						oob = nand_transfer_oob(chip,
-							oob, ops, toread);
+						oob = nand_transfer_oob(chip, oob, ops, toread);
 						oobreadlen -= toread;
 					}
 				} else
-					buf = nand_transfer_oob(chip,
-						buf, ops, mtd->oobsize);
+					buf = nand_transfer_oob(chip, buf, ops, mtd->oobsize);
 			}
 
 			if (!(chip->options & NAND_NO_READRDY)) {
@@ -1038,6 +1093,7 @@ static int nand_do_read_ops(struct mtd_i
 		} else {
 			memcpy(buf, chip->buffers->databuf + col, bytes);
 			buf += bytes;
+			from += bytes;
 		}
 
 		readlen -= bytes;
@@ -1125,11 +1181,21 @@ static int nand_read(struct mtd_info *mt
 static int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
 			     int page, int sndcmd)
 {
-	if (sndcmd) {
-		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
-		sndcmd = 0;
+	int i = 0;
+	int block_mask = (1 << (chip->erase_shift - chip->page_shift)) - 1;
+	int start_block = (page & ~block_mask) * chip->numplanes;
+	int page_num = page & block_mask;
+
+	while (i < chip->numplanes) {
+		page = start_block + page_num + block_mask * i;
+		if (sndcmd) {
+			chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
+			if (chip->numplanes == 1)
+				sndcmd = 0;
+		}
+		chip->read_buf(mtd, chip->oob_poi + chip->oob_phys_size * i, chip->oob_phys_size);
+		i++;
 	}
-	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
 	return sndcmd;
 }
 
@@ -1181,15 +1247,30 @@ static int nand_read_oob_syndrome(struct
 static int nand_write_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
 			      int page)
 {
+	int i = 0;
 	int status = 0;
 	const uint8_t *buf = chip->oob_poi;
-	int length = mtd->oobsize;
-
-	chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
-	chip->write_buf(mtd, buf, length);
-	/* Send command to program the OOB data */
-	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
-
+	int length = chip->oob_phys_size;
+	int block_mask = (1 << (chip->erase_shift - chip->page_shift)) - 1;
+	int start_block = (page & ~block_mask) * chip->numplanes;
+	int page_num = page & block_mask;
+
+	/* calculate physycal page at first plane */
+	while (i < chip->numplanes) {
+		page = start_block + page_num + (block_mask + 1) * i;
+		chip->cmdfunc(mtd, NAND_CMD_SEQIN, chip->page_phys_size, page);
+		chip->write_buf(mtd, buf + length * i, length);
+		/* Send command to program the OOB data */
+		i++;
+		if (i < chip->numplanes) {
+			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG_MP, -1, -1);
+			if (!chip->dev_ready)
+				udelay(chip->chip_delay);
+			else
+				nand_wait_ready(mtd);
+		} else
+			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	}
 	status = chip->waitfunc(mtd, chip);
 
 	return status & NAND_STATUS_FAIL ? -EIO : 0;
@@ -1276,7 +1357,7 @@ static int nand_do_read_oob(struct mtd_i
 	      (unsigned long long)from, readlen);
 
 	if (ops->mode == MTD_OOB_AUTO)
-		len = chip->ecc.layout->oobavail;
+		len = mtd->oobavail;
 	else
 		len = mtd->oobsize;
 
@@ -1398,12 +1479,13 @@ static int nand_read_oob(struct mtd_info
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	data buffer
+ * @oobbuf:	oob buffer
  */
 static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-				const uint8_t *buf)
+				const uint8_t *buf, uint8_t *oobbuf)
 {
 	chip->write_buf(mtd, buf, chip->page_phys_size);
-	chip->write_buf(mtd, chip->oob_poi, chip->oob_phys_size);
+	chip->write_buf(mtd, oobbuf, chip->oob_phys_size);
 }
 
 /**
@@ -1411,9 +1493,10 @@ static void nand_write_page_raw(struct m
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	data buffer
+ * @oobbuf:	oob buffer
  */
 static void nand_write_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
-				  const uint8_t *buf)
+				  const uint8_t *buf, uint8_t *oobbuf)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -1427,9 +1510,9 @@ static void nand_write_page_swecc(struct
 		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
 
 	for (i = 0; i < chip->ecc.total; i++)
-		chip->oob_poi[eccpos[i]] = ecc_calc[i];
+		oobbuf[eccpos[i]] = ecc_calc[i];
 
-	chip->ecc.write_page_raw(mtd, chip, buf);
+	chip->ecc.write_page_raw(mtd, chip, buf, oobbuf);
 }
 
 /**
@@ -1437,9 +1520,10 @@ static void nand_write_page_swecc(struct
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	data buffer
+ * @oobbuf:	oob buffer
  */
 static void nand_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
-				  const uint8_t *buf)
+				  const uint8_t *buf, uint8_t *oobbuf)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -1455,9 +1539,9 @@ static void nand_write_page_hwecc(struct
 	}
 
 	for (i = 0; i < chip->ecc.total; i++)
-		chip->oob_poi[eccpos[i]] = ecc_calc[i];
+		oobbuf[eccpos[i]] = ecc_calc[i];
 
-	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+	chip->write_buf(mtd, oobbuf, mtd->oobsize);
 }
 
 /**
@@ -1470,13 +1554,14 @@ static void nand_write_page_hwecc(struct
  * we need a special oob layout and handling.
  */
 static void nand_write_page_syndrome(struct mtd_info *mtd,
-				    struct nand_chip *chip, const uint8_t *buf)
+				    struct nand_chip *chip, const uint8_t *buf,
+					uint8_t *oobbuf)
 {
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
 	int eccsteps = chip->ecc.steps;
 	const uint8_t *p = buf;
-	uint8_t *oob = chip->oob_poi;
+	uint8_t *oob = oobbuf;
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
 
@@ -1499,7 +1584,7 @@ static void nand_write_page_syndrome(str
 	}
 
 	/* Calculate remaining oob bytes */
-	i = mtd->oobsize - (oob - chip->oob_poi);
+	i = mtd->oobsize - (oob - oobbuf);
 	if (i)
 		chip->write_buf(mtd, oob, i);
 }
@@ -1513,49 +1598,53 @@ static void nand_write_page_syndrome(str
  * @cached:	cached programming
  * @raw:	use _raw version of write_page
  */
-static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+static int nand_write_operations(struct mtd_info *mtd, struct nand_chip *chip,
 			   const uint8_t *buf, int page, int cached, int raw)
 {
+	int i = 0;
 	int status;
+	int block_mask = (1 << (chip->erase_shift - chip->page_shift)) - 1;
+	int start_block = (page & ~block_mask) * chip->numplanes;
+	int page_num = page & block_mask;
+
+	/* calculate physycal page at first plane */
+	while (i < chip->numplanes) {
+		page = start_block + page_num + (block_mask + 1) * i;
+		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
+
+		if (unlikely(raw))
+			chip->ecc.write_page_raw(mtd, chip, buf + chip->page_phys_size * i,
+									chip->oob_poi + chip->oob_phys_size * i);
+		else
+			chip->ecc.write_page(mtd, chip, buf + chip->page_phys_size * i,
+									chip->oob_poi + chip->oob_phys_size * i);
+		i++;
+		if (i < chip->numplanes) {
+			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG_MP, -1, -1);
+			if (!chip->dev_ready)
+				udelay(chip->chip_delay);
+			else
+				nand_wait_ready(mtd);
+		} else
+			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
 
-	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
-
-	if (unlikely(raw))
-		chip->ecc.write_page_raw(mtd, chip, buf);
-	else
-		chip->ecc.write_page(mtd, chip, buf);
-
-	/*
-	 * Cached progamming disabled for now, Not sure if its worth the
-	 * trouble. The speed gain is not very impressive. (2.3->2.6Mib/s)
-	 */
-	cached = 0;
-
-	if (!cached || !(chip->options & NAND_CACHEPRG)) {
-
-		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
-		status = chip->waitfunc(mtd, chip);
-		/*
-		 * See if operation failed and additional status checks are
-		 * available
-		 */
-		if ((status & NAND_STATUS_FAIL) && (chip->errstat))
-			status = chip->errstat(mtd, chip, FL_WRITING, status,
-					       page);
-
-		if (status & NAND_STATUS_FAIL)
-			return -EIO;
-	} else {
-		chip->cmdfunc(mtd, NAND_CMD_CACHEDPROG, -1, -1);
 		status = chip->waitfunc(mtd, chip);
 	}
 
 #ifdef CONFIG_MTD_NAND_VERIFY_WRITE
-	/* Send command to read back the data */
-	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
-
-	if (chip->verify_buf(mtd, buf, mtd->writesize))
-		return -EIO;
+	i = 0;
+	while (i < chip->numplanes) {
+		page = start_block + page_num + (block_mask + 1) * i;
+		chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
+		if (chip->verify_buf(mtd, buf + chip->page_phys_size * i, chip->page_phys_size)) {
+			printk(KERN_ERR "%s: verify buf on %d plane fail!\n", __FUNCTION__, i+1);
+			return -EIO;
+		}
+		if (!chip->dev_ready)
+			udelay(chip->chip_delay);
+		else
+			nand_wait_ready(mtd);
+	}
 #endif
 	return 0;
 }
@@ -1684,7 +1773,7 @@ static int nand_do_write_ops(struct mtd_
 		if (unlikely(oob))
 			oob = nand_fill_oob(chip, oob, ops);
 
-		ret = chip->write_page(mtd, chip, wbuf, page, cached,
+		ret = nand_write_operations(mtd, chip, wbuf, page, cached,
 				       (ops->mode == MTD_OOB_RAW));
 		if (ret)
 			break;
@@ -1767,7 +1856,7 @@ static int nand_do_write_oob(struct mtd_
 	      (unsigned int)to, (int)ops->ooblen);
 
 	if (ops->mode == MTD_OOB_AUTO)
-		len = chip->ecc.layout->oobavail;
+		len = mtd->oobavail;
 	else
 		len = mtd->oobsize;
 
@@ -1881,8 +1970,26 @@ static int nand_write_oob(struct mtd_inf
  */
 static void single_erase_cmd(struct mtd_info *mtd, int page)
 {
+	int i = 0;
 	struct nand_chip *chip = mtd->priv;
-	/* Send commands to erase a block */
+	int block_mask = (1 << (chip->erase_shift - chip->page_shift)) - 1;
+	int start_block = (page & ~block_mask) * chip->numplanes;
+
+	page = start_block;
+
+	while (i < chip->numplanes - 1) {
+		/* Send commands to erase a block */
+		chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page);
+		chip->cmdfunc(mtd, NAND_CMD_ERASE_MP, -1, -1);
+
+		if (!chip->dev_ready)
+			udelay(chip->chip_delay);
+		else
+			nand_wait_ready(mtd);
+
+		i++;
+		page = start_block + (block_mask + 1) * i;
+	}
 	chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page);
 	chip->cmdfunc(mtd, NAND_CMD_ERASE2, -1, -1);
 }
diff -Nurp linux-2.6.24.3/include/linux/mtd/nand.h linux-2.6.24.3-dp/include/linux/mtd/nand.h
--- linux-2.6.24.3/include/linux/mtd/nand.h	2008-05-28 15:08:32.000000000 +0400
+++ linux-2.6.24.3-dp/include/linux/mtd/nand.h	2008-05-28 15:08:07.000000000 +0400
@@ -72,6 +72,7 @@ extern void nand_wait_ready(struct mtd_i
 #define NAND_CMD_READ1		1
 #define NAND_CMD_RNDOUT		5
 #define NAND_CMD_PAGEPROG	0x10
+#define NAND_CMD_PAGEPROG_MP	0x11
 #define NAND_CMD_READOOB	0x50
 #define NAND_CMD_ERASE1		0x60
 #define NAND_CMD_STATUS		0x70
@@ -80,6 +81,7 @@ extern void nand_wait_ready(struct mtd_i
 #define NAND_CMD_RNDIN		0x85
 #define NAND_CMD_READID		0x90
 #define NAND_CMD_ERASE2		0xd0
+#define NAND_CMD_ERASE_MP	0xd1
 #define NAND_CMD_RESET		0xff
 
 /* Extended commands for large page devices */
@@ -169,7 +171,6 @@ typedef enum {
 /* Chip does not allow subpage writes */
 #define NAND_NO_SUBPAGE_WRITE	0x00000200
 
-
 /* Options valid for Samsung large page devices */
 #define NAND_SAMSUNG_LP_OPTIONS \
 	(NAND_NO_PADDING | NAND_CACHEPRG | NAND_COPYBACK)
@@ -269,16 +270,16 @@ struct nand_ecc_ctrl {
 					   uint8_t *calc_ecc);
 	int			(*read_page_raw)(struct mtd_info *mtd,
 						 struct nand_chip *chip,
-						 uint8_t *buf);
+						 uint8_t *buf, uint8_t *oobbuf);
 	void			(*write_page_raw)(struct mtd_info *mtd,
 						  struct nand_chip *chip,
-						  const uint8_t *buf);
+						  const uint8_t *buf, uint8_t *oobbuf);
 	int			(*read_page)(struct mtd_info *mtd,
 					     struct nand_chip *chip,
-					     uint8_t *buf);
+					     uint8_t *buf, uint8_t *oobbuf);
 	void			(*write_page)(struct mtd_info *mtd,
 					      struct nand_chip *chip,
-					      const uint8_t *buf);
+					      const uint8_t *buf, uint8_t *oobbuf);
 	int			(*read_oob)(struct mtd_info *mtd,
 					    struct nand_chip *chip,
 					    int page,
@@ -362,7 +363,6 @@ struct nand_buffers {
  * @priv:		[OPTIONAL] pointer to private chip date
  * @errstat:		[OPTIONAL] hardware specific function to perform additional error status checks
  *			(determine if errors are correctable)
- * @write_page:		[REPLACEABLE] High-level page write function
  */
 
 struct nand_chip {
@@ -385,8 +385,6 @@ struct nand_chip {
 	void		(*erase_cmd)(struct mtd_info *mtd, int page);
 	int		(*scan_bbt)(struct mtd_info *mtd);
 	int		(*errstat)(struct mtd_info *mtd, struct nand_chip *this, int state, int status, int page);
-	int		(*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
-				      const uint8_t *buf, int page, int cached, int raw);
 
 	int		chip_delay;
 	unsigned int	options;

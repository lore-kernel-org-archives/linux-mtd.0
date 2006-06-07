Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FnvR5-0006Nw-2r
	for linux-mtd@lists.infradead.org; Wed, 07 Jun 2006 06:39:01 -0400
Date: Wed, 7 Jun 2006 14:39:25 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] NAND: fix reading/writing OOB for syndrome
Message-Id: <20060607143925.0cde3fca.vwool@ru.mvista.com>
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

Folks,

being unable to read/write OOB for the NAND flash with 'syndrome' controller (standard read/write oob functions presume OOB is contiguous which is wrong in this case), I took a clumsy attempt to implement this functionality. :)

Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 77406fc..fbfd9fb 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1083,6 +1083,116 @@ static int nand_read(struct mtd_info *mt
 	return ret;
 }
 
+
+/**
+ * nand_read_oob_raw - [REPLACABLE] the most common OOB data read function
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @buf:	buffer to store read data
+ * @offs:	offset to start writing from
+ * @length:	length of the OOB data to read
+ * @page:	page number to read
+ */
+static void nand_read_oob_raw(struct mtd_info *mtd, struct nand_chip *chip, uint8_t *buf, int offs, int length, int page)
+{
+	chip->read_buf(mtd, buf, length);
+}
+static void (*nand_read_oob_swecc)(struct mtd_info *mtd, struct nand_chip *chip, uint8_t *buf, int offs, int length, int page) = &nand_read_oob_raw;
+static void (*nand_read_oob_hwecc)(struct mtd_info *mtd, struct nand_chip *chip, uint8_t *buf, int offs, int length, int page) = &nand_read_oob_raw;
+
+/**
+ * nand_read_oob_syndrome - [REPLACABLE] OOB data read function for HW ECC
+ * 					 with syndromes
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @buf:	buffer to store read data
+ * @offs:	offset to start reading from
+ * @length:	length of the OOB data to read
+ * @page:	page number to read
+ */
+static void nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip, uint8_t *buf, int offs, int length, int page)
+{
+	int portion = mtd->oobsize / chip->ecc.steps;
+	uint8_t *bufpoi = buf;
+	int i;
+
+	/* 
+	 * We presume here that the chip driver is capable of
+	 * emulating NAND_CMD_READOOB properly
+	 */
+	for (i = 0 ; i < chip->ecc.steps ; i++) {
+		if (offs) {
+			while (portion < offs) {
+				offs -= portion;
+				i++;
+			}
+		}
+		chip->read_buf(mtd, bufpoi, portion - offs);
+		bufpoi += portion - offs;
+		offs = 0;
+		chip->cmdfunc(mtd, NAND_CMD_READOOB, (i + 1) * portion, page);
+	}
+}
+		
+/**
+ * nand_write_oob_raw - [REPLACABLE] the most common OOB data write function
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @buf:	buffer where to write data from
+ * @offs:	offset to start writing from
+ * @length:	length of the OOB data to write
+ * @page:	page number to write
+ */
+static void nand_write_oob_raw(struct mtd_info *mtd, struct nand_chip *chip, const uint8_t *buf, int offs, int length, int page)
+{
+	chip->write_buf(mtd, buf, length);
+}
+static void (*nand_write_oob_swecc)(struct mtd_info *mtd, struct nand_chip *chip, const uint8_t *buf, int offs, int length, int page) = nand_write_oob_raw;
+static void (*nand_write_oob_hwecc)(struct mtd_info *mtd, struct nand_chip *chip, const uint8_t *buf, int offs, int length, int page) = nand_write_oob_raw;
+
+/**
+ * nand_write_oob_syndrome - [REPLACABLE] OOB data write function for HW ECC
+ * 					  with syndrome
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @buf:	buffer where to write data from
+ * @offs:	offset to start writing from
+ * @length:	length of the OOB data to write
+ * @page:	page number to write
+ */
+static void nand_write_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip, const uint8_t *buf, int offs, int length, int page)
+{
+	int portion = mtd->oobsize / chip->ecc.steps;
+	int eccsize = chip->ecc.size;
+	const uint8_t *bufpoi = buf;
+	int i, len;
+
+	for (i = 0 ; i < chip->ecc.steps ; i++) {
+		if (offs < portion) {
+			int status;
+			chip->cmdfunc(mtd, NAND_CMD_SEQIN, 
+				eccsize + i * (eccsize + portion) + offs, page);
+			len = min_t(int, length, portion - offs);
+			chip->write_buf(mtd, bufpoi, len);
+			bufpoi += len;
+			length -= len;
+			offs = 0;
+
+			if (i < chip->ecc.steps - 1) {
+				chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+				status = chip->waitfunc(mtd, chip, FL_WRITING);
+
+				/* See if device thinks it succeeded */
+				if (status & NAND_STATUS_FAIL)
+					DEBUG(MTD_DEBUG_LEVEL0, "%s: "
+					      "Failed write, page 0x%08x\n",
+					      __FUNCTION__, page);
+			}
+		} else
+			offs -= portion;
+	}
+}
+
 /**
  * nand_do_read_oob - [Intern] NAND read out-of-band
  * @mtd:	MTD device structure
@@ -1127,7 +1237,7 @@ static int nand_do_read_oob(struct mtd_i
 			sndcmd = 0;
 		}
 
-		chip->read_buf(mtd, bufpoi, bytes);
+		chip->ecc.read_oob(mtd, chip, bufpoi, col, bytes, page);
 
 		if (unlikely(!direct))
 			buf = nand_transfer_oob(chip, buf, ops);
@@ -1598,13 +1708,13 @@ static int nand_do_write_oob(struct mtd_
 		nand_fill_oob(chip, ops->oobbuf, ops);
 		chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize,
 			      page & chip->pagemask);
-		chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+		chip->ecc.write_oob(mtd, chip, chip->oob_poi, 0, mtd->oobsize, page & chip->pagemask);
 		memset(chip->oob_poi, 0xff, mtd->oobsize);
 	} else {
 		chip->cmdfunc(mtd, NAND_CMD_SEQIN,
 			      mtd->writesize + ops->ooboffs,
 			      page & chip->pagemask);
-		chip->write_buf(mtd, ops->oobbuf, ops->len);
+		chip->ecc.write_oob(mtd, chip, ops->oobbuf, ops->ooboffs, ops->len, page & chip->pagemask);
 	}
 
 	/* Send command to program the OOB data */
@@ -2265,6 +2375,10 @@ int nand_scan(struct mtd_info *mtd, int 
 			chip->ecc.read_page = nand_read_page_hwecc;
 		if (!chip->ecc.write_page)
 			chip->ecc.write_page = nand_write_page_hwecc;
+		if (!chip->ecc.read_oob)
+			chip->ecc.read_oob = nand_read_oob_hwecc;
+		if (!chip->ecc.write_oob)
+			chip->ecc.write_oob = nand_write_oob_hwecc;
 
 	case NAND_ECC_HW_SYNDROME:
 		if (!chip->ecc.calculate || !chip->ecc.correct ||
@@ -2278,6 +2392,10 @@ int nand_scan(struct mtd_info *mtd, int 
 			chip->ecc.read_page = nand_read_page_syndrome;
 		if (!chip->ecc.write_page)
 			chip->ecc.write_page = nand_write_page_syndrome;
+		if (!chip->ecc.read_oob)
+			chip->ecc.read_oob = nand_read_oob_syndrome;
+		if (!chip->ecc.write_oob)
+			chip->ecc.write_oob = nand_write_oob_syndrome;
 
 		if (mtd->writesize >= chip->ecc.size)
 			break;
@@ -2291,6 +2409,8 @@ int nand_scan(struct mtd_info *mtd, int 
 		chip->ecc.correct = nand_correct_data;
 		chip->ecc.read_page = nand_read_page_swecc;
 		chip->ecc.write_page = nand_write_page_swecc;
+		chip->ecc.read_oob = nand_read_oob_swecc;
+		chip->ecc.write_oob = nand_write_oob_swecc;
 		chip->ecc.size = 256;
 		chip->ecc.bytes = 3;
 		break;
@@ -2300,6 +2420,8 @@ int nand_scan(struct mtd_info *mtd, int 
 		       "This is not recommended !!\n");
 		chip->ecc.read_page = nand_read_page_raw;
 		chip->ecc.write_page = nand_write_page_raw;
+		chip->ecc.read_oob = nand_read_oob_raw;
+		chip->ecc.write_oob = nand_write_oob_raw;
 		chip->ecc.size = mtd->writesize;
 		chip->ecc.bytes = 0;
 		break;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index bf2ce68..ef6adfa 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -250,6 +250,19 @@ struct nand_ecc_ctrl {
 	void			(*write_page)(struct mtd_info *mtd,
 					      struct nand_chip *chip,
 					      const uint8_t *buf);
+	void			(*read_oob)(struct mtd_info *mtd,
+					    struct nand_chip *chip,
+					    uint8_t *buf,
+					    int offs,
+					    int length,
+					    int page);
+	void			(*write_oob)(struct mtd_info *mtd,
+					     struct nand_chip *chip,
+					     const uint8_t *buf,
+					     int offs,
+					     int length,
+					     int page);
+					    
 };
 
 /**

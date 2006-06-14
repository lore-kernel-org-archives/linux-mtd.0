Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqXXq-0005Gj-4l
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 11:44:52 -0400
Date: Wed, 14 Jun 2006 19:45:20 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: tglx@linutronix.de
Subject: [PATCH] NAND: fix reading/writing OOB for syndrome: next iteration
Message-Id: <20060614194520.ee6c500f.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

please see the new version inlined.
Notable is that you can't optimize write_oob() parameters as you've proposed im #mtd because buf, offs and length are not always taken from ops.
I've tested this version for syndrome and for software-based ecc and it seemed to work well with both (given that flash_eraseall -j won't work now anyway due to the OOB corruption we've discussed before).

Index: linux-2.6/drivers/mtd/nand/nand_base.c
===================================================================
--- linux-2.6.orig/drivers/mtd/nand/nand_base.c
+++ linux-2.6/drivers/mtd/nand/nand_base.c
@@ -1084,6 +1084,166 @@ static int nand_read(struct mtd_info *mt
 }
 
 /**
+ * nand_read_oob_raw - [REPLACABLE] the most common OOB data read function
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @buf:	buffer to store read data
+ * @offs:	offset to start writing from
+ * @length:	length of the OOB data to read
+ * @page:	page number to read
+ * @sndcmd:	pointer to the flag whether to issue read command or not
+ */
+static void nand_read_oob_raw(struct mtd_info *mtd, struct nand_chip *chip,
+			      uint8_t *buf, int offs, int length, int page,
+			      int *sndcmd)
+{
+	if (*sndcmd) {
+		chip->cmdfunc(mtd, NAND_CMD_READOOB, offs, page);
+		*sndcmd = 0;
+	}
+	chip->read_buf(mtd, buf, length);
+}
+static void (*nand_read_oob_swecc) (struct mtd_info *mtd,
+				    struct nand_chip *chip, uint8_t *buf,
+				    int offs, int length, int page,
+				    int *sndcmd) =
+    &nand_read_oob_raw;
+static void (*nand_read_oob_hwecc) (struct mtd_info *mtd,
+				    struct nand_chip *chip, uint8_t *buf,
+				    int offs, int length, int page,
+				    int *sndcmd) =
+    &nand_read_oob_raw;
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
+ * @sndcmd:	pointer to the flag whether to issue read command or not
+ */
+static void nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
+				   uint8_t *buf, int offs, int length,
+				   int page, int *sndcmd)
+{
+	int portion = chip->ecc.bytes + chip->ecc.prepad + chip->ecc.postpad;
+	uint8_t *bufpoi = buf;
+	int i, toread;
+
+	for (i = 0; i < chip->ecc.steps; i++) {
+		if (offs) {
+			while (portion < offs) {
+				offs -= portion;
+				i++;
+			}
+		}
+		chip->cmdfunc(mtd, NAND_CMD_READ0,
+				(i + 1) * chip->ecc.size + i * portion + offs,
+				page);
+		toread = min_t(int, length, portion - offs);
+		chip->read_buf(mtd, bufpoi, toread);
+		bufpoi += toread;
+		length -= toread;
+		offs = 0;
+	}
+	if (length > 0)
+		chip->read_buf(mtd, bufpoi, length);
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
+static int nand_write_oob_raw(struct mtd_info *mtd, struct nand_chip *chip,
+			       const uint8_t *buf, int offs, int length,
+			       int page)
+{
+	int status = 0;
+
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize + offs,
+			page & chip->pagemask);
+	chip->write_buf(mtd, buf, length);
+	/* Send command to program the OOB data */
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+
+	status = chip->waitfunc(mtd, chip, FL_WRITING);
+
+	/* See if device thinks it succeeded */
+	if (status & NAND_STATUS_FAIL)
+		DEBUG(MTD_DEBUG_LEVEL0, "nand_write_oob: "
+		      "Failed write, page 0x%08x\n", page);
+
+	return status;
+}
+static int (*nand_write_oob_swecc) (struct mtd_info *mtd,
+				    struct nand_chip *chip,
+				    const uint8_t *buf, int offs, int length,
+				    int page) = nand_write_oob_raw;
+static int (*nand_write_oob_hwecc) (struct mtd_info *mtd,
+				    struct nand_chip *chip,
+				    const uint8_t *buf, int offs, int length,
+				    int page) = nand_write_oob_raw;
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
+static int nand_write_oob_syndrome(struct mtd_info *mtd,
+				   struct nand_chip *chip, const uint8_t *buf,
+				   int offs, int length, int page)
+{
+	int portion = chip->ecc.bytes + chip->ecc.prepad + chip->ecc.postpad;
+	int eccsize = chip->ecc.size;
+	const uint8_t *bufpoi = buf;
+	int i, len, status = 0, sndcmd = 0;
+
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN,
+		      eccsize + offs,
+		      page);
+	for (i = 0; i < chip->ecc.steps; i++) {
+		if (offs < portion) {
+			if (sndcmd)
+				chip->cmdfunc(mtd, NAND_CMD_RNDIN,
+				      eccsize + i * (eccsize + portion) + offs,
+				      -1);
+			else
+				sndcmd = 1;
+			len = min_t(int, length, portion - offs);
+			chip->write_buf(mtd, bufpoi, len);
+			bufpoi += len;
+			length -= len;
+			offs = 0;
+		} else
+			offs -= portion;
+	}
+	if (length > 0)
+		chip->write_buf(mtd, bufpoi, length);
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	status = chip->waitfunc(mtd, chip, FL_WRITING);
+
+	/* See if device thinks it succeeded */
+	if (status & NAND_STATUS_FAIL)
+		DEBUG(MTD_DEBUG_LEVEL0, "%s: Failed write, page 0x%08x\n",
+		      __FUNCTION__, page);
+
+	return status & NAND_STATUS_FAIL ? -EIO : 0;
+}
+
+/**
  * nand_do_read_oob - [Intern] NAND read out-of-band
  * @mtd:	MTD device structure
  * @from:	offset to read from
@@ -1122,12 +1283,8 @@ static int nand_do_read_oob(struct mtd_i
 		bytes = direct ? ops->ooblen : mtd->oobsize;
 		bufpoi = direct ? buf : chip->buffers.oobrbuf;
 
-		if (likely(sndcmd)) {
-			chip->cmdfunc(mtd, NAND_CMD_READOOB, col, page);
-			sndcmd = 0;
-		}
-
-		chip->read_buf(mtd, bufpoi, bytes);
+		chip->ecc.read_oob(mtd, chip, bufpoi, col,
+				  bytes, page, &sndcmd);
 
 		if (unlikely(!direct))
 			buf = nand_transfer_oob(chip, buf, ops);
@@ -1596,28 +1753,16 @@ static int nand_do_write_oob(struct mtd_
 		chip->oob_poi = chip->buffers.oobwbuf;
 		memset(chip->oob_poi, 0xff, mtd->oobsize);
 		nand_fill_oob(chip, ops->oobbuf, ops);
-		chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize,
-			      page & chip->pagemask);
-		chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+		status = chip->ecc.write_oob(mtd, chip, chip->oob_poi, 0,
+				mtd->oobsize, page & chip->pagemask);
 		memset(chip->oob_poi, 0xff, mtd->oobsize);
-	} else {
-		chip->cmdfunc(mtd, NAND_CMD_SEQIN,
-			      mtd->writesize + ops->ooboffs,
-			      page & chip->pagemask);
-		chip->write_buf(mtd, ops->oobbuf, ops->len);
-	}
-
-	/* Send command to program the OOB data */
-	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	} else
+		status = chip->ecc.write_oob(mtd, chip, ops->oobbuf,
+				ops->ooboffs, ops->len, page & chip->pagemask);
 
-	status = chip->waitfunc(mtd, chip, FL_WRITING);
+	if (status)
+		return status;
 
-	/* See if device thinks it succeeded */
-	if (status & NAND_STATUS_FAIL) {
-		DEBUG(MTD_DEBUG_LEVEL0, "nand_write_oob: "
-		      "Failed write, page 0x%08x\n", page);
-		return -EIO;
-	}
 	ops->retlen = ops->len;
 
 #ifdef CONFIG_MTD_NAND_VERIFY_WRITE
@@ -2265,6 +2410,10 @@ int nand_scan(struct mtd_info *mtd, int 
 			chip->ecc.read_page = nand_read_page_hwecc;
 		if (!chip->ecc.write_page)
 			chip->ecc.write_page = nand_write_page_hwecc;
+		if (!chip->ecc.read_oob)
+			chip->ecc.read_oob = nand_read_oob_hwecc;
+		if (!chip->ecc.write_oob)
+			chip->ecc.write_oob = nand_write_oob_hwecc;
 
 	case NAND_ECC_HW_SYNDROME:
 		if (!chip->ecc.calculate || !chip->ecc.correct ||
@@ -2278,6 +2427,10 @@ int nand_scan(struct mtd_info *mtd, int 
 			chip->ecc.read_page = nand_read_page_syndrome;
 		if (!chip->ecc.write_page)
 			chip->ecc.write_page = nand_write_page_syndrome;
+		if (!chip->ecc.read_oob)
+			chip->ecc.read_oob = nand_read_oob_syndrome;
+		if (!chip->ecc.write_oob)
+			chip->ecc.write_oob = nand_write_oob_syndrome;
 
 		if (mtd->writesize >= chip->ecc.size)
 			break;
@@ -2291,6 +2444,8 @@ int nand_scan(struct mtd_info *mtd, int 
 		chip->ecc.correct = nand_correct_data;
 		chip->ecc.read_page = nand_read_page_swecc;
 		chip->ecc.write_page = nand_write_page_swecc;
+		chip->ecc.read_oob = nand_read_oob_swecc;
+		chip->ecc.write_oob = nand_write_oob_swecc;
 		chip->ecc.size = 256;
 		chip->ecc.bytes = 3;
 		break;
@@ -2300,6 +2455,8 @@ int nand_scan(struct mtd_info *mtd, int 
 		       "This is not recommended !!\n");
 		chip->ecc.read_page = nand_read_page_raw;
 		chip->ecc.write_page = nand_write_page_raw;
+		chip->ecc.read_oob = nand_read_oob_raw;
+		chip->ecc.write_oob = nand_write_oob_raw;
 		chip->ecc.size = mtd->writesize;
 		chip->ecc.bytes = 0;
 		break;
Index: linux-2.6/include/linux/mtd/nand.h
===================================================================
--- linux-2.6.orig/include/linux/mtd/nand.h
+++ linux-2.6/include/linux/mtd/nand.h
@@ -69,6 +69,7 @@ extern void nand_release (struct mtd_inf
 #define NAND_CMD_STATUS		0x70
 #define NAND_CMD_STATUS_MULTI	0x71
 #define NAND_CMD_SEQIN		0x80
+#define NAND_CMD_RNDIN		0x85
 #define NAND_CMD_READID		0x90
 #define NAND_CMD_ERASE2		0xd0
 #define NAND_CMD_RESET		0xff
@@ -250,6 +251,19 @@ struct nand_ecc_ctrl {
 	void			(*write_page)(struct mtd_info *mtd,
 					      struct nand_chip *chip,
 					      const uint8_t *buf);
+	void			(*read_oob)(struct mtd_info *mtd,
+					    struct nand_chip *chip,
+					    uint8_t *buf,
+					    int offs,
+					    int length,
+					    int page,
+					    int *sndcmd);
+	int			(*write_oob)(struct mtd_info *mtd,
+					     struct nand_chip *chip,
+					     const uint8_t *buf,
+					     int offs,
+					     int length,
+					     int page);
 };
 
 /**

Date: Thu, 15 May 2008 17:23:18 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org, joern@logfs.org,
	dedekind@infradead.org, hamish@cloud.net.au
Subject: [PATCH] NAND subpage read feature as a way to increase performance.
	Take 2.
Message-ID: <Pine.LNX.4.64.0805151643360.32186@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

This patch enables NAND subpage read functionality. 
If upper layer drivers are requesting to read non page aligned data NAND
subpage-read functionality reads the only whose ECC regions which include
requested data when original code reads whole page.
This significantly improves performance in many cases. 

Here are some digits :

UBI volume mount time
No subpage reads: 5.75 seconds
Subpage read patch: 2.42 seconds

Open/stat time for files on JFFS2 volume:
No subpage read  0m 5.36s
Subpage read     0m 2.88s

Signed-off-by Alexey Korolev <akorolev@infradead.org>
-------------------------
diff -Naurp 1/drivers/mtd/nand/nand_base.c 2/drivers/mtd/nand/nand_base.c
--- 1/drivers/mtd/nand/nand_base.c	2008-02-11 08:51:11.000000000 +0300
+++ 2/drivers/mtd/nand/nand_base.c	2008-04-30 14:58:52.000000000 +0400
@@ -798,6 +798,87 @@ static int nand_read_page_swecc(struct m
 }
 
 /**
+ * nand_read_subpage - [REPLACABLE] software ecc based sub-page read function
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @dataofs	offset of requested data within the page
+ * @readlen	data length
+ * @buf:	buffer to store read data
+ */
+static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip, uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi)
+{
+	int start_step, end_step, num_steps;
+	uint32_t *eccpos = chip->ecc.layout->eccpos;
+	uint8_t *p;
+	int data_col_addr, i, gaps = 0;
+	int datafrag_len, eccfrag_len, aligned_len, aligned_pos;
+	int busw = (chip->options & NAND_BUSWIDTH_16) ? 2 : 1;
+
+	/* Column address wihin the page aligned to ECC size (256bytes). */
+	start_step = data_offs / chip->ecc.size;
+	end_step = (data_offs + readlen - 1) / chip->ecc.size;
+	num_steps = end_step - start_step + 1;
+
+	/* Data size aligned to ECC ecc.size*/
+	datafrag_len = num_steps * chip->ecc.size;
+	eccfrag_len = num_steps * chip->ecc.bytes;
+
+	data_col_addr = start_step * chip->ecc.size;
+	/* If we read not a page aligned data */
+	if (data_col_addr != 0)
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_col_addr, -1);
+
+	p = bufpoi + data_col_addr;
+	chip->read_buf(mtd, p, datafrag_len);
+
+	/* Calculate  ECC */
+	for (i = 0; i < eccfrag_len ; i += chip->ecc.bytes, p += chip->ecc.size)
+		chip->ecc.calculate(mtd, p, &chip->buffers->ecccalc[i]);
+
+	/* The performance is faster if to position offsets
+	   according to ecc.pos. Let make sure here that
+	   there are no gaps in ecc positions */
+	for (i = 0; i < eccfrag_len - 1; i++) {
+		if (eccpos[i + start_step * chip->ecc.bytes] + 1 !=
+			eccpos[i + start_step * chip->ecc.bytes + 1]) {
+			gaps = 1;
+			break;
+		}
+	}
+	if (gaps) {
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize, -1);
+		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	} else {
+		/* send the command to read the particular ecc bytes */
+		/* take care about buswidth alignment in read_buf */
+		aligned_pos = eccpos[start_step * chip->ecc.bytes] & ~(busw - 1);
+		aligned_len = eccfrag_len;
+		if (eccpos[start_step * chip->ecc.bytes] & (busw - 1))
+			aligned_len++;
+		if (eccpos[(start_step + num_steps) * chip->ecc.bytes] & (busw - 1))
+			aligned_len++;
+
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize + aligned_pos, -1);
+		chip->read_buf(mtd, &chip->oob_poi[aligned_pos], aligned_len);
+	}
+
+	for (i = 0; i < eccfrag_len; i++)
+		chip->buffers->ecccode[i] = chip->oob_poi[eccpos[i + start_step * chip->ecc.bytes]];
+
+	p = bufpoi + data_col_addr;
+	for (i = 0; i < eccfrag_len ; i += chip->ecc.bytes, p += chip->ecc.size) {
+		int stat;
+
+		stat = chip->ecc.correct(mtd, p, &chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
+		if (stat == -1)
+			mtd->ecc_stats.failed++;
+		else
+			mtd->ecc_stats.corrected += stat;
+	}
+	return 0;
+}
+
+/**
  * nand_read_page_hwecc - [REPLACABLE] hardware ecc based page read function
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
@@ -994,14 +1077,17 @@ static int nand_do_read_ops(struct mtd_i
 			/* Now read the page into the buffer */
 			if (unlikely(ops->mode == MTD_OOB_RAW))
 				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi);
-			else
+			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
+				ret = chip->ecc.read_subpage(mtd, chip, col, bytes, bufpoi);
+			else
 				ret = chip->ecc.read_page(mtd, chip, bufpoi);
 			if (ret < 0)
 				break;
 
 			/* Transfer not aligned data */
 			if (!aligned) {
-				chip->pagebuf = realpage;
+				if (!NAND_SUBPAGE_READ(chip) && !oob)
+					chip->pagebuf = realpage;
 				memcpy(buf, chip->buffers->databuf + col, bytes);
 			}
 
@@ -2496,6 +2582,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		chip->ecc.calculate = nand_calculate_ecc;
 		chip->ecc.correct = nand_correct_data;
 		chip->ecc.read_page = nand_read_page_swecc;
+		chip->ecc.read_subpage = nand_read_subpage;
 		chip->ecc.write_page = nand_write_page_swecc;
 		chip->ecc.read_oob = nand_read_oob_std;
 		chip->ecc.write_oob = nand_write_oob_std;
diff -Naurp 1/include/linux/mtd/nand.h 2/include/linux/mtd/nand.h
--- 1/include/linux/mtd/nand.h	2008-02-11 08:51:11.000000000 +0300
+++ 2/include/linux/mtd/nand.h	2008-04-30 14:56:54.000000000 +0400
@@ -179,6 +179,7 @@ typedef enum {
 #define NAND_MUST_PAD(chip) (!(chip->options & NAND_NO_PADDING))
 #define NAND_HAS_CACHEPROG(chip) ((chip->options & NAND_CACHEPRG))
 #define NAND_HAS_COPYBACK(chip) ((chip->options & NAND_COPYBACK))
+#define NAND_SUBPAGE_READ(chip) ((chip->ecc.mode == NAND_ECC_SOFT))
 
 /* Mask to zero out the chip options, which come from the id table */
 #define NAND_CHIPOPTIONS_MSK	(0x0000ffff & ~NAND_NO_AUTOINCR)
@@ -276,6 +277,10 @@ struct nand_ecc_ctrl {
 	int			(*read_page)(struct mtd_info *mtd,
 					     struct nand_chip *chip,
 					     uint8_t *buf);
+	int			(*read_subpage)(struct mtd_info *mtd,
+					     struct nand_chip *chip,
+					     uint32_t offs, uint32_t len,
+					     uint8_t *buf);
 	void			(*write_page)(struct mtd_info *mtd,
 					      struct nand_chip *chip,
 					      const uint8_t *buf);

Thanks,
Alexey

P/S special thanks to Vasiliy and Hamish for performance mesurements/invesrtigations

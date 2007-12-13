Date: Thu, 13 Dec 2007 18:15:12 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [RFC][patch] NAND partial page read functionality 
Message-ID: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: joern@logfs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 

Here is a patch providing partial page read functionality for NAND
devices. 

In many cases it gives performacne boost. I've added this feature
enabling under chip->options flag. 
Setting NAND_PART_READ option in board driver will enable this feature.

This is example how partial page read could affect stat time perfromance. 
--------
Case 1: partial page read is OFF

[root@Linux /]#time ls -l /mnt/mtd8/media
-rw-r--r--    1 root     root      8388608 Jan  1 00:01 file1
-rw-r--r--    1 root     root      8388608 Jan  1 00:02 file2
-rw-r--r--    1 root     root      8388608 Jan  1 00:02 file3
-rw-r--r--    1 root     root      8388608 Jan  1 00:02 file4
-rw-r--r--    1 root     root      8388608 Jan  1 00:02 file5
-rw-r--r--    1 root     root      8388608 Jan  1 00:02 file6
real    0m 5.36s
user    0m 0.00s
sys     0m 5.36s
--------
Case 2: partial page read if ON

[root@Linux /]#time ls -l /mnt/mtd8/media
-rw-r--r--    1 root     root      8388608 Jan  1 00:01 file1
-rw-r--r--    1 root     root      8388608 Jan  1 00:02 file2
-rw-r--r--    1 root     root      8388608 Jan  1 00:02 file3
-rw-r--r--    1 root     root      8388608 Jan  1 00:02 file4
-rw-r--r--    1 root     root      8388608 Jan  1 00:02 file5
-rw-r--r--    1 root     root      8388608 Jan  1 00:02 file6
real    0m 3.00s
user    0m 0.01s
sys     0m 2.99s 

There are many cases when it makes sense to use it. 
Please find patch below. Your comments and suggestions are welcome. 
Thanks,
Alexey

Signed-off-by Alexey Korolev <akorolev@infradead.org>
--------------
diff -aur clear_adv/drivers/mtd/nand/nand_base.c linux-2.6.23.8-adv/drivers/mtd/nand/nand_base.c
--- clear_adv/drivers/mtd/nand/nand_base.c	2007-11-29 17:46:12.000000000 +0300
+++ linux-2.6.23.8-adv/drivers/mtd/nand/nand_base.c	2007-12-13 18:24:08.000000000 +0300
@@ -830,6 +830,66 @@
 }
 
 /**
+ * nand_read_partial - [REPLACABLE] software ecc based partial page read function
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @dataofs	offset of requested data within the page 
+ * @readlen	data length 
+ * @buf:	buffer to store read data
+ */
+static int nand_read_partial(struct mtd_info * mtd,struct nand_chip *chip, uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi)
+{
+	int start_step, end_step, num_steps;
+	uint32_t *eccpos = chip->ecc.layout->eccpos;
+	uint8_t *p;
+	int data_col_addr, i;
+	int datafrag_len, eccfrag_len;
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
+	if (data_col_addr != 0) {
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_col_addr, -1);
+	}
+
+	p = bufpoi + data_col_addr;
+	chip->read_buf(mtd, p, datafrag_len);
+
+	/* Calculate  ECC */
+	for (i = 0; i<eccfrag_len ; i += chip->ecc.bytes, p += chip->ecc.size)
+		chip->ecc.calculate(mtd, p, &chip->buffers->ecccalc[i]);
+
+	/* The performance will be improved more if to position offsets 
+	 * according to ecc.pos. But in this case we may face issues 
+	 * on chips with gaps in ecc positions. So it is disabled yet*/
+	chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize, -1);
+	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	for (i = 0; i < eccfrag_len; i++)
+		chip->buffers->ecccode[i] = chip->oob_poi[eccpos[i + start_step * chip->ecc.bytes]];
+
+	p = bufpoi + data_col_addr;
+	for (i = 0; i<eccfrag_len ; i += chip->ecc.bytes, p += chip->ecc.size) {
+		int stat;
+		
+		stat = chip->ecc.correct(mtd, p, &chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
+		if (stat == -1)
+			mtd->ecc_stats.failed++;
+		else
+			mtd->ecc_stats.corrected += stat;
+	}
+	return 0;	
+
+}
+
+/**
  * nand_read_page_hwecc - [REPLACABLE] hardware ecc based page read function
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
@@ -1048,14 +1108,17 @@
 			/* Now read the page into the buffer */
 			if (unlikely(ops->mode == MTD_OOB_RAW))
 				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi);
-			else
+			else if ( !aligned && NAND_CANPARTREAD(chip) )
+				ret = chip->ecc.read_partial(mtd, chip, col, bytes, bufpoi);
+			else 
 				ret = chip->ecc.read_page(mtd, chip, bufpoi);
 			if (ret < 0)
 				break;
 
 			/* Transfer not aligned data */
 			if (!aligned) {
-				chip->pagebuf = realpage;
+				if (!NAND_CANPARTREAD(chip))
+					chip->pagebuf = realpage;
 				memcpy(buf, chip->buffers->databuf + col, bytes);
 			}
 
@@ -2563,6 +2626,7 @@
 		chip->ecc.calculate = nand_calculate_ecc;
 		chip->ecc.correct = nand_correct_data;
 		chip->ecc.read_page = nand_read_page_swecc;
+		chip->ecc.read_partial = nand_read_partial;
 		chip->ecc.write_page = nand_write_page_swecc;
 		chip->ecc.read_oob = nand_read_oob_std;
 		chip->ecc.write_oob = nand_write_oob_std;
diff -aur clear_adv/include/linux/mtd/nand.h linux-2.6.23.8-adv/include/linux/mtd/nand.h
--- clear_adv/include/linux/mtd/nand.h	2007-11-29 17:46:12.000000000 +0300
+++ linux-2.6.23.8-adv/include/linux/mtd/nand.h	2007-12-13 18:24:30.000000000 +0300
@@ -170,6 +170,8 @@
 #define NAND_NO_READRDY		0x00000100
 /* Chip does not allow subpage writes */
 #define NAND_NO_SUBPAGE_WRITE	0x00000200
+/* Chip supports partial page read  */
+#define NAND_PART_READ		0x00000400
 
 /* Options valid for Samsung large page devices */
 #define NAND_SAMSUNG_LP_OPTIONS \
@@ -183,6 +185,8 @@
 #define NAND_MUST_PAD(chip) (!(chip->options & NAND_NO_PADDING))
 #define NAND_HAS_CACHEPROG(chip) ((chip->options & NAND_CACHEPRG))
 #define NAND_HAS_COPYBACK(chip) ((chip->options & NAND_COPYBACK))
+#define NAND_CANPARTREAD(chip) ((chip->options & NAND_PART_READ) &&\
+				(chip->ecc.mode == NAND_ECC_SOFT))
 
 /* Mask to zero out the chip options, which come from the id table */
 #define NAND_CHIPOPTIONS_MSK	(0x0000ffff & ~NAND_NO_AUTOINCR)
@@ -281,6 +285,10 @@
 	int			(*read_page)(struct mtd_info *mtd,
 					     struct nand_chip *chip,
 					     uint8_t *buf);
+	int			(*read_partial)(struct mtd_info *mtd,
+					     struct nand_chip *chip, 
+					     uint32_t offs, uint32_t len,
+					     uint8_t *buf);
 	void			(*write_page)(struct mtd_info *mtd,
 					      struct nand_chip *chip,
 					      const uint8_t *buf);

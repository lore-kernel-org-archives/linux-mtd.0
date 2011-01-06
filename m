Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PaepB-0007gT-2W
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2011 01:39:33 +0000
Received: by mail-pz0-f49.google.com with SMTP id 30so3544607pzk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Jan 2011 17:39:32 -0800 (PST)
From: Charles Manning <cdhmanning@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 1/2] mtd: Add nand_base feature to align subpage read buffers
Date: Thu,  6 Jan 2011 14:39:01 +1300
Message-Id: <1294277942-1252-2-git-send-email-cdhmanning@gmail.com>
In-Reply-To: <1294277942-1252-1-git-send-email-cdhmanning@gmail.com>
References: <1294277942-1252-1-git-send-email-cdhmanning@gmail.com>
Cc: Charles Manning <cdhmanning@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some nand controllers (eg. omap2) need to have their buffers u32 aligned
to use high speed transfer mechanisms.

This commit provides a way to plug in an alignment function and provides a
32-bit algnment function.

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   22 +++++++++++++++++++++-
 include/linux/mtd/nand.h     |    5 +++--
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 1f75a1b..e8c2432 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1156,6 +1156,22 @@ static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
+ * nand_align_subpage32 - function to align subpage read to 32-bits
+ * @mtd:	mtd info structure
+ * @buf:	pointer to pointer of buffer that needs to be aligned
+ * @len:	pointer to length that needs to be aligned.
+ */
+
+void nand_align_subpage32(uint8_t **buf, int *len)
+{
+	int diff = (int)(*buf) & 3;
+	*buf =  *buf - diff;
+	*len = *len + diff;
+	*len = (*len + 3) & ~3;
+}
+EXPORT_SYMBOL(nand_align_subpage32);
+
+/**
  * nand_read_subpage - [REPLACABLE] software ecc based sub-page read function
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
@@ -1169,6 +1185,7 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	int start_step, end_step, num_steps;
 	uint32_t *eccpos = chip->ecc.layout->eccpos;
 	uint8_t *p;
+	uint8_t *b;
 	int data_col_addr, i, gaps = 0;
 	int datafrag_len, eccfrag_len, aligned_len, aligned_pos;
 	int busw = (chip->options & NAND_BUSWIDTH_16) ? 2 : 1;
@@ -1222,7 +1239,10 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 
 		chip->cmdfunc(mtd, NAND_CMD_RNDOUT,
 					mtd->writesize + aligned_pos, -1);
-		chip->read_buf(mtd, &chip->oob_poi[aligned_pos], aligned_len);
+		b =  &chip->oob_poi[aligned_pos];
+		if(chip->align_subpage)
+			chip->align_subpage(&b, &aligned_len);
+		chip->read_buf(mtd, b, aligned_len);
 	}
 
 	for (i = 0; i < eccfrag_len; i++)
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 63e17d0..6ea6177 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -474,6 +474,7 @@ struct nand_buffers {
  *			additional error status checks (determine if errors are
  *			correctable).
  * @write_page:		[REPLACEABLE] High-level page write function
+ * @align_subpage:	[OPTIONAL] Aligns subpage read buffer.
  */
 
 struct nand_chip {
@@ -501,7 +502,7 @@ struct nand_chip {
 			int status, int page);
 	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
 			const uint8_t *buf, int page, int cached, int raw);
-
+	void (*align_subpage)(uint8_t **buf, int *len);
 	int chip_delay;
 	unsigned int options;
 
@@ -597,7 +598,7 @@ extern int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 			   int allowbbt);
 extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, uint8_t *buf);
-
+extern void nand_align_subpage32(uint8_t **buf, int *len);
 /**
  * struct platform_nand_chip - chip level device structure
  * @nr_chips:		max. number of chips to scan for
-- 
1.7.1.5.g49342

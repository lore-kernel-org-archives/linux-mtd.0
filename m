From: Xander Huff <xander.huff@ni.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, michal.simek@xilinx.com,
 punnaiah.choudary.kalluri@xilinx.com
Subject: [PATCH] Zynq NAND: enable subpage reads and writes
Date: Thu, 19 Feb 2015 18:32:32 -0600
Message-Id: <1424392352-39198-1-git-send-email-xander.huff@ni.com>
Cc: jeff.westfahl@ni.com, ben.shelton@ni.com, jaeden.amero@ni.com,
 linux-mtd@lists.infradead.org, joshc@ni.com, brad.mouring@ni.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ben Shelton <ben.shelton@ni.com>

The default 3.10 NAND driver does not support subpage reads or writes
for our device, which causes it not to play nicely with partitions that
have already been formatted with this support.

Acked-by: Jeff Westfahl <jeff.westfahl@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 drivers/mtd/nand/pl353_nand.c | 55 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/mtd/nand/pl353_nand.c b/drivers/mtd/nand/pl353_nand.c
index ee74545..e2a46fc 100644
--- a/drivers/mtd/nand/pl353_nand.c
+++ b/drivers/mtd/nand/pl353_nand.c
@@ -398,6 +398,33 @@ static int pl353_nand_read_page_raw(struct mtd_info *mtd,
 }
 
 /**
+ * pl353_nand_read_subpage_raw - [Intern] read raw subpage data without ecc
+ * @mtd:	mtd info structure
+ * @chip:	nand chip info structure
+ * @data_offs:	offset of subpage within the page
+ * @readlen:	data length
+ * @buf:	data buffer
+ * @page:	page number to read
+ *
+ * Return:	Always return zero
+ */
+static int pl353_nand_read_subpage_raw(struct mtd_info *mtd,
+				    struct nand_chip *chip, uint32_t data_offs,
+				    uint32_t readlen, uint8_t *buf, int page)
+{
+	if (0 != data_offs) {
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_offs, -1);
+		buf += data_offs;
+	}
+
+	/* readlen must be a multiple of 4. */
+	readlen = (((readlen + 3) >> 2) << 2);
+
+	chip->read_buf(mtd, buf, readlen);
+	return 0;
+}
+
+/**
  * pl353_nand_write_page_raw - [Intern] raw page write function
  * @mtd:		Pointer to the mtd info structure
  * @chip:		Pointer to the NAND chip info structure
@@ -431,6 +458,23 @@ static int pl353_nand_write_page_raw(struct mtd_info *mtd,
 }
 
 /**
+ * pl353_nand_write_subpage_raw - [Intern] raw subpage write function
+ * @mtd:		mtd info structure
+ * @chip:		nand chip info structure
+ * @offset:		offset of subpage within the page
+ * @data_len:		data length
+ * @data_buf:		data buffer
+ * @oob_required:	must write chip->oob_poi to OOB
+ */
+static int pl353_nand_write_subpage_raw(struct mtd_info *mtd,
+				     struct nand_chip *chip, uint32_t offset,
+				     uint32_t data_len, const uint8_t *data_buf,
+				     int oob_required)
+{
+	return pl353_nand_write_page_raw(mtd, chip, data_buf, oob_required);
+}
+
+/**
  * nand_write_page_hwecc - Hardware ECC based page write function
  * @mtd:		Pointer to the mtd info structure
  * @chip:		Pointer to the NAND chip info structure
@@ -945,8 +989,19 @@ static void pl353_nand_ecc_init(struct mtd_info *mtd, int ondie_ecc_state)
 		nand_chip->ecc.bytes = 0;
 		nand_chip->ecc.layout = &ondie_nand_oob_64;
 		nand_chip->ecc.read_page = pl353_nand_read_page_raw;
+		nand_chip->ecc.read_subpage = pl353_nand_read_subpage_raw;
 		nand_chip->ecc.write_page = pl353_nand_write_page_raw;
+		nand_chip->ecc.write_subpage = pl353_nand_write_subpage_raw;
 		nand_chip->ecc.size = mtd->writesize;
+
+		/* NAND with on-die ECC supports subpage reads */
+		nand_chip->options |= NAND_SUBPAGE_READ;
+
+		/* NAND with on-die ECC may support subpage writes */
+		if (nand_chip->onfi_version)
+			nand_chip->ecc.size /=
+				nand_chip->onfi_params.programs_per_page;
+
 		/*
 		 * On-Die ECC spare bytes offset 8 is used for ECC codes
 		 * Use the BBT pattern descriptors
-- 
1.9.1

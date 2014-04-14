Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZmgR-0000I9-0j
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 19:36:48 +0000
From: David Mosberger <davidm@egauge.net>
To: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dedekind1@gmail.com, gsi@denx.de, pekon@ti.com
Subject: [PATCH v5 3/5] mtd: nand: Enable subpage-reads on flashes with on-die
 ECC enabled.
Date: Mon, 14 Apr 2014 13:35:32 -0600
Message-Id: <1397504134-32178-4-git-send-email-davidm@egauge.net>
In-Reply-To: <1397504134-32178-1-git-send-email-davidm@egauge.net>
References: <1397504134-32178-1-git-send-email-davidm@egauge.net>
Cc: David Mosberger <davidm@egauge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Micron chips supported through the on-die ECC all have subpage capability,
so enable that.

Signed-off-by: David Mosberger <davidm@egauge.net>
---
 drivers/mtd/nand/nand_base.c |   56 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 997d7f1..7092875 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1304,6 +1304,52 @@ static int check_read_status_on_die(struct mtd_info *mtd, int page)
 }
 
 /**
+ * nand_read_subpage_on_die - [REPLACEABLE] raw sub-page read function
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @data_offs: offset of requested data within the page
+ * @readlen: data length
+ * @bufpoi: buffer to store read data
+ */
+static int nand_read_subpage_on_die(struct mtd_info *mtd,
+				    struct nand_chip *chip,
+				    uint32_t data_offs, uint32_t readlen,
+				    uint8_t *bufpoi, int page)
+{
+	int start_step, end_step, num_steps, ret;
+	int data_col_addr;
+	int datafrag_len;
+	uint32_t failed;
+	uint8_t *p;
+
+	/* Column address within the page aligned to ECC size */
+	start_step = data_offs / chip->ecc.size;
+	end_step = (data_offs + readlen - 1) / chip->ecc.size;
+	num_steps = end_step - start_step + 1;
+
+	/* Data size aligned to ECC ecc.size */
+	datafrag_len = num_steps * chip->ecc.size;
+	data_col_addr = start_step * chip->ecc.size;
+	p = bufpoi + data_col_addr;
+
+	failed = mtd->ecc_stats.failed;
+
+	ret = check_read_status_on_die(mtd, page);
+	if (ret < 0 || mtd->ecc_stats.failed != failed) {
+		memset(p, 0, datafrag_len);
+		return ret;
+	}
+
+	/* If we read not a page aligned data */
+	if (data_col_addr != 0)
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_col_addr, -1);
+
+	chip->read_buf(mtd, p, datafrag_len);
+
+	return ret;
+}
+
+/**
  * nand_read_page_on_die - [INTERN] read raw page data without ecc
  * @mtd: mtd info structure
  * @chip: nand chip info structure
@@ -4067,6 +4113,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		chip->bbt_options |= NAND_BBT_NO_OOB;
 		chip->ecc.layout = &nand_oob_64_on_die;
 		chip->ecc.read_page = nand_read_page_on_die;
+		chip->ecc.read_subpage = nand_read_subpage_on_die;
 		chip->ecc.write_page = nand_write_page_raw;
 		chip->ecc.read_oob = nand_read_oob_std;
 		chip->ecc.read_page_raw = nand_read_page_raw;
@@ -4144,8 +4191,13 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Invalidate the pagebuffer reference */
 	chip->pagebuf = -1;
 
-	/* Large page NAND with SOFT_ECC should support subpage reads */
-	if ((ecc->mode == NAND_ECC_SOFT) && (chip->page_shift > 9))
+	/*
+	 * Large page NAND with SOFT_ECC or on-die ECC should support
+	 * subpage reads.
+	 */
+	if (((ecc->mode == NAND_ECC_SOFT)
+	     || (chip->ecc.mode == NAND_ECC_HW_ON_DIE))
+	    && (chip->page_shift > 9))
 		chip->options |= NAND_SUBPAGE_READ;
 
 	/* Fill in remaining MTD driver data */
-- 
1.7.9.5

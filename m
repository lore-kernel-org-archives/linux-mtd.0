Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUle8-0002J5-Ef
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 23:29:44 +0000
From: David Mosberger <davidm@egauge.net>
To: pekon@ti.com
Subject: [PATCH v4 2/5] mtd: nand: Add NAND_ECC_HW_ON_DIE ECC-mode.
Date: Mon, 31 Mar 2014 17:28:54 -0600
Message-Id: <1396308537-16013-3-git-send-email-davidm@egauge.net>
In-Reply-To: <1396308537-16013-1-git-send-email-davidm@egauge.net>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
Cc: David Mosberger <davidm@egauge.net>, gsi@denx.de,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some Micron chips such as the MT29F4G16ABADAWP have an internal
(on-die) ECC-controller that is useful when the host-platform doesn't
have hardware-support for multi-bit ECC.  This patch adds
NAND_ECC_HW_ON_DIE to support such chips when the driver detects that
the on-die ECC controller is enabled.

Signed-off-by: David Mosberger <davidm@egauge.net>
---
 drivers/mtd/nand/nand_base.c |  133 ++++++++++++++++++++++++++++++++++++++++++
 drivers/of/of_mtd.c          |    1 +
 include/linux/mtd/nand.h     |    2 +
 3 files changed, 136 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f145f00..7047e9f5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -78,6 +78,20 @@ static struct nand_ecclayout nand_oob_64 = {
 		 .length = 38} }
 };
 
+static struct nand_ecclayout nand_oob_64_on_die = {
+	.eccbytes = 32,
+	.eccpos = {
+		    8,  9, 10, 11, 12, 13, 14, 15,
+		   24, 25, 26, 27, 28, 29, 30, 31,
+		   40, 41, 42, 43, 44, 45, 46, 47,
+		   56, 57, 58, 59, 60, 61, 62, 63},
+	.oobfree = {
+		{.offset =  4,	 .length = 4},
+		{.offset = 20,	 .length = 4},
+		{.offset = 36,	 .length = 4},
+		{.offset = 52,	 .length = 4}}
+};
+
 static struct nand_ecclayout nand_oob_128 = {
 	.eccbytes = 48,
 	.eccpos = {
@@ -1258,6 +1272,105 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	return max_bitflips;
 }
 
+static int check_read_status_on_die(struct mtd_info *mtd,
+				    struct nand_chip *chip, int page)
+{
+	int max_bitflips = 0;
+	uint8_t status;
+
+	/* Check ECC status of page just transferred into NAND's page buffer: */
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+	status = chip->read_byte(mtd);
+
+	/* Switch back to data reading: */
+	chip->cmdfunc(mtd, NAND_CMD_READMODE, -1, -1);
+
+	if (status & NAND_STATUS_FAIL) {
+		/* Page has invalid ECC. */
+		mtd->ecc_stats.failed++;
+	} else if (status & NAND_STATUS_REWRITE) {
+		/*
+		 * Simple but suboptimal: any page with a single stuck
+		 * bit will be unusable since it'll be rewritten on
+		 * each read...
+		 */
+		max_bitflips = mtd->bitflip_threshold;
+	}
+	return max_bitflips;
+}
+
+/**
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
+	ret = check_read_status_on_die(mtd, chip, page);
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
+ * nand_read_page_on_die - [INTERN] read raw page data without ecc
+ * @mtd: mtd info structure
+ * @chip: nand chip info structure
+ * @buf: buffer to store read data
+ * @oob_required: caller requires OOB data read to chip->oob_poi
+ * @page: page number to read
+ */
+static int nand_read_page_on_die(struct mtd_info *mtd, struct nand_chip *chip,
+				 uint8_t *buf, int oob_required, int page)
+{
+	uint32_t failed;
+	int ret;
+
+	failed = mtd->ecc_stats.failed;
+
+	ret = check_read_status_on_die(mtd, chip, page);
+	if (ret < 0 || mtd->ecc_stats.failed != failed)
+		return ret;
+
+	chip->read_buf(mtd, buf, mtd->writesize);
+	if (oob_required)
+		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	return ret;
+}
+
 /**
  * nand_read_page_hwecc - [REPLACEABLE] hardware ECC based page read function
  * @mtd: mtd info structure
@@ -3069,6 +3182,7 @@ nand_onfi_detect_micron_on_die_ecc(struct mtd_info *mtd,
 		 * If the chip has on-die ECC enabled, we kind of have
 		 * to do the same...
 		 */
+		chip->ecc.mode = NAND_ECC_HW_ON_DIE;
 		pr_info("Using on-die ECC\n");
 	}
 }
@@ -3985,6 +4099,25 @@ int nand_scan_tail(struct mtd_info *mtd)
 		ecc->strength = ecc->bytes * 8 / fls(8 * ecc->size);
 		break;
 
+	case NAND_ECC_HW_ON_DIE:
+		/* nand_bbt attempts to put Bbt marker at offset 8 in
+		   oob, which is used for ECC by Micron
+		   MT29F4G16ABADAWP, for example.  Fixed by not using
+		   OOB for BBT marker.  */
+		chip->bbt_options |= NAND_BBT_NO_OOB;
+		chip->ecc.layout = &nand_oob_64_on_die;
+		chip->ecc.read_page = nand_read_page_on_die;
+		chip->ecc.read_subpage = nand_read_subpage_on_die;
+		chip->ecc.write_page = nand_write_page_raw;
+		chip->ecc.read_oob = nand_read_oob_std;
+		chip->ecc.read_page_raw = nand_read_page_raw;
+		chip->ecc.write_page_raw = nand_write_page_raw;
+		chip->ecc.write_oob = nand_write_oob_std;
+		chip->ecc.size = 512;
+		chip->ecc.bytes = 8;
+		chip->ecc.strength = 4;
+		break;
+
 	case NAND_ECC_NONE:
 		pr_warn("NAND_ECC_NONE selected by board driver. "
 			   "This is not recommended!\n");
diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index b7361ed..c844c84 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -23,6 +23,7 @@ static const char *nand_ecc_modes[] = {
 	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
 	[NAND_ECC_HW_OOB_FIRST]	= "hw_oob_first",
 	[NAND_ECC_SOFT_BCH]	= "soft_bch",
+	[NAND_ECC_HW_ON_DIE]	= "hw_on_die",
 };
 
 /**
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 780ab58..dbb99b3 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -112,6 +112,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 /* Status bits */
 #define NAND_STATUS_FAIL	0x01
 #define NAND_STATUS_FAIL_N1	0x02
+#define NAND_STATUS_REWRITE	0x08
 #define NAND_STATUS_TRUE_READY	0x20
 #define NAND_STATUS_READY	0x40
 #define NAND_STATUS_WP		0x80
@@ -126,6 +127,7 @@ typedef enum {
 	NAND_ECC_HW_SYNDROME,
 	NAND_ECC_HW_OOB_FIRST,
 	NAND_ECC_SOFT_BCH,
+	NAND_ECC_HW_ON_DIE,
 } nand_ecc_modes_t;
 
 /*
-- 
1.7.9.5

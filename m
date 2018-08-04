Received: from mo-csw1115.securemx.jp ([210.130.202.157]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1flp5n-0005It-T3
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 05:27:10 +0000
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
To: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Subject: [PATCH v6] mtd: nand: toshiba: Add support for Toshiba Memory BENAND
 (Built-in ECC NAND)
Date: Sat,  4 Aug 2018 14:25:52 +0900
Message-Id: <1533360352-2882-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is a patch to support TOSHIBA MEMORY CORPORATION BENAND
memory devices.  Check the status of the built-in ECC with the Read
Status command without using the vendor specific command.  The Read
Status command only knows whether there was bitflips above the
threshold and can not get accurate bitflips.  For now, I set
max_bitflips mtd->bitflip_threshold.

Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
---
 drivers/mtd/nand/raw/nand_toshiba.c | 88 +++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index ab43f02..8aec3fa 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -17,6 +17,89 @@
 
 #include <linux/mtd/rawnand.h>
 
+/* Bit for detecting BENAND */
+#define TOSHIBA_NAND_ID4_IS_BENAND		BIT(7)
+
+/* Recommended to rewrite for BENAND */
+#define TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED	BIT(3)
+
+static int toshiba_nand_benand_eccstatus(struct mtd_info *mtd,
+					 struct nand_chip *chip)
+{
+	int ret;
+	unsigned int max_bitflips = 0;
+	u8 status;
+
+	/* Check Status */
+	ret = nand_status_op(chip, &status);
+	if (ret)
+		return ret;
+
+	if (status & NAND_STATUS_FAIL) {
+		/* uncorrected */
+		mtd->ecc_stats.failed++;
+	} else if (status & TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED) {
+		/* corrected */
+		max_bitflips = mtd->bitflip_threshold;
+		mtd->ecc_stats.corrected += max_bitflips;
+	}
+
+	return max_bitflips;
+}
+
+static int
+toshiba_nand_read_page_benand(struct mtd_info *mtd,
+			      struct nand_chip *chip, uint8_t *buf,
+			      int oob_required, int page)
+{
+	int ret;
+
+	ret = nand_read_page_raw(mtd, chip, buf, oob_required, page);
+	if (ret)
+		return ret;
+
+	return toshiba_nand_benand_eccstatus(mtd, chip);
+}
+
+static int
+toshiba_nand_read_subpage_benand(struct mtd_info *mtd,
+				 struct nand_chip *chip, uint32_t data_offs,
+				 uint32_t readlen, uint8_t *bufpoi, int page)
+{
+	int ret;
+
+	ret = nand_read_page_op(chip, page, data_offs,
+				bufpoi + data_offs, readlen);
+	if (ret)
+		return ret;
+
+	return toshiba_nand_benand_eccstatus(mtd, chip);
+}
+
+static void toshiba_nand_benand_init(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	/*
+	 * On BENAND, the entire OOB region can be used by the MTD user.
+	 * The calculated ECC bytes are stored into other isolated
+	 * area which is not accessible to users.
+	 * This is why chip->ecc.bytes = 0.
+	 */
+	chip->ecc.bytes = 0;
+	chip->ecc.size = 512;
+	chip->ecc.strength = 8;
+	chip->ecc.read_page = toshiba_nand_read_page_benand;
+	chip->ecc.read_subpage = toshiba_nand_read_subpage_benand;
+	chip->ecc.write_page = nand_write_page_raw;
+	chip->ecc.read_page_raw = nand_read_page_raw_notsupp;
+	chip->ecc.write_page_raw = nand_write_page_raw_notsupp;
+
+	chip->options |= NAND_SUBPAGE_READ;
+
+	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+}
+
 static void toshiba_nand_decode_id(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -68,6 +151,11 @@ static int toshiba_nand_init(struct nand_chip *chip)
 	if (nand_is_slc(chip))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
+	/* Check that chip is BENAND and ECC mode is on-die */
+	if (nand_is_slc(chip) && chip->ecc.mode == NAND_ECC_ON_DIE &&
+	    chip->id.data[4] & TOSHIBA_NAND_ID4_IS_BENAND)
+		toshiba_nand_benand_init(chip);
+
 	return 0;
 }
 
-- 
2.7.4

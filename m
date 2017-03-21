Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqHBb-0004Mf-02
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:38:48 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Kumar Gala <galak@codeaurora.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Date: Tue, 21 Mar 2017 11:38:05 +0100
Message-Id: <1490092686-16509-5-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1490092686-16509-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490092686-16509-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the core NAND subsystem has support for on-die ECC, this commit
brings the necessary code to support on-die ECC on Micron NANDs.

In micron_nand_init(), if the Device Tree indicates an on-die ECC mode,
we verify if the NAND chip actually has ECC support and if so, fill in
the appropriate fields of nand_chip->ecc and defines the OOB layout
according to the NAND datasheet.

We then provide an implementation of the ->read_page(),
->read_page_raw(), ->write_page() and ->write_page_raw() operation to
properly handle the on-die ECC.

In the non-raw functions, we need to enable the internal ECC engine
before issuing the NAND_CMD_READ0 or NAND_CMD_SEQIN commands, which is
why we set the NAND_ECC_CUSTOM_PAGE_ACCESS option at initialization
time (it asks the NAND core to let the NAND driver issue those
commands).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/nand_micron.c | 147 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h       |   2 +
 2 files changed, 149 insertions(+)

diff --git a/drivers/mtd/nand/nand_micron.c b/drivers/mtd/nand/nand_micron.c
index 8770110..e9a445d 100644
--- a/drivers/mtd/nand/nand_micron.c
+++ b/drivers/mtd/nand/nand_micron.c
@@ -17,6 +17,18 @@
 
 #include <linux/mtd/nand.h>
 
+/*
+ * Special Micron status bit that indicates when the block has been
+ * corrected by on-die ECC and should be rewritten
+ */
+#define NAND_STATUS_WRITE_RECOMMENDED	BIT(3)
+
+/*
+ * READ ID bit that indicates if the NAND has on-die ECC support,
+ * located in byte 4.
+ */
+#define NAND_MICRON_ON_DIE_ECC_CAPABLE	BIT(7)
+
 struct nand_onfi_vendor_micron {
 	u8 two_plane_read;
 	u8 read_cache;
@@ -66,6 +78,121 @@ static int micron_nand_onfi_init(struct nand_chip *chip)
 	return 0;
 }
 
+static int micron_nand_on_die_ooblayout_ecc(struct mtd_info *mtd, int section,
+					    struct mtd_oob_region *oobregion)
+{
+	if (section >= 4)
+		return -ERANGE;
+
+	oobregion->offset = (section * 16) + 8;
+	oobregion->length = 8;
+
+	return 0;
+}
+
+static int micron_nand_on_die_ooblayout_free(struct mtd_info *mtd, int section,
+					     struct mtd_oob_region *oobregion)
+{
+	if (section >= 4)
+		return -ERANGE;
+
+	oobregion->offset = (section * 16) + 2;
+	oobregion->length = 6;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops micron_nand_on_die_ooblayout_ops = {
+	.ecc = micron_nand_on_die_ooblayout_ecc,
+	.free = micron_nand_on_die_ooblayout_free,
+};
+
+static void micron_nand_on_die_ecc_setup(struct nand_chip *chip, bool enable)
+{
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = { 0, };
+
+	if (enable)
+		feature[0] |= ONFI_FEATURE_ON_DIE_ECC_EN;
+
+	chip->onfi_set_features(nand_to_mtd(chip), chip,
+				ONFI_FEATURE_ON_DIE_ECC, feature);
+}
+
+static int
+micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
+				 uint8_t *buf, int oob_required,
+				 int page)
+{
+	int status;
+	int max_bitflips = 0;
+
+	micron_nand_on_die_ecc_setup(chip, true);
+
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+	status = chip->read_byte(mtd);
+	if (status & NAND_STATUS_FAIL)
+		mtd->ecc_stats.failed++;
+	/*
+	 * The internal ECC doesn't tell us the number of bitflips
+	 * that have been corrected, but tells us if it recommends to
+	 * rewrite the block. If it's the case, then we pretend we had
+	 * a number of bitflips equal to the ECC strength, which will
+	 * hint the NAND core to rewrite the block.
+	 */
+	else if (status & NAND_STATUS_WRITE_RECOMMENDED)
+		max_bitflips = chip->ecc.strength;
+
+	chip->cmdfunc(mtd, NAND_CMD_READ0, -1, -1);
+
+	nand_read_page_raw(mtd, chip, buf, oob_required, page);
+
+	micron_nand_on_die_ecc_setup(chip, false);
+
+	return max_bitflips;
+}
+
+static int
+micron_nand_write_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
+				  const uint8_t *buf, int oob_required,
+				  int page)
+{
+	micron_nand_on_die_ecc_setup(chip, true);
+
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
+	nand_write_page_raw(mtd, chip, buf, oob_required, page);
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+
+	micron_nand_on_die_ecc_setup(chip, false);
+
+	return 0;
+}
+
+static int
+micron_nand_read_page_raw_on_die_ecc(struct mtd_info *mtd,
+				     struct nand_chip *chip,
+				     uint8_t *buf, int oob_required,
+				     int page)
+{
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+	nand_read_page_raw(mtd, chip, buf, oob_required, page);
+
+	return 0;
+}
+
+static int
+micron_nand_write_page_raw_on_die_ecc(struct mtd_info *mtd,
+				      struct nand_chip *chip,
+				      const uint8_t *buf, int oob_required,
+				      int page)
+{
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
+	nand_write_page_raw(mtd, chip, buf, oob_required, page);
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+
+	return 0;
+}
+
 static int micron_nand_init(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -78,6 +205,26 @@ static int micron_nand_init(struct nand_chip *chip)
 	if (mtd->writesize == 2048)
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
+	if (chip->ecc.mode == NAND_ECC_ON_DIE) {
+		if ((chip->id.data[4] & NAND_MICRON_ON_DIE_ECC_CAPABLE) == 0) {
+			pr_err("On-die ECC selected but not supported\n");
+			return -EINVAL;
+		}
+
+		chip->ecc.options = NAND_ECC_CUSTOM_PAGE_ACCESS;
+		chip->ecc.bytes = 32;
+		chip->ecc.strength = 4;
+		chip->ecc.algo = NAND_ECC_BCH;
+		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
+		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
+		chip->ecc.read_page_raw =
+			micron_nand_read_page_raw_on_die_ecc;
+		chip->ecc.write_page_raw =
+			micron_nand_write_page_raw_on_die_ecc;
+
+		mtd_set_ooblayout(mtd, &micron_nand_on_die_ooblayout_ops);
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 5fc705d..3320ffd 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -258,6 +258,8 @@ struct nand_chip;
 
 /* Vendor-specific feature address (Micron) */
 #define ONFI_FEATURE_ADDR_READ_RETRY	0x89
+#define ONFI_FEATURE_ON_DIE_ECC		0x90
+#define   ONFI_FEATURE_ON_DIE_ECC_EN	BIT(3)
 
 /* ONFI subfeature parameters length */
 #define ONFI_SUBFEATURE_PARAM_LEN	4
-- 
2.7.4

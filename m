Received: from mo1501.tsb.2iij.net ([210.149.48.173] helo=mo.tsb.2iij.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1duu8c-0007sK-He
 for linux-mtd@lists.infradead.org; Thu, 21 Sep 2017 05:35:06 +0000
Content-Transfer-Encoding: 7bit
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Subject: [PATCH -next v2] mtd: nand: Add support for Toshiba BENAND (Built-in
 ECC NAND)
Date: Thu, 21 Sep 2017 14:32:02 +0900
Message-Id: <1505971922-4994-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch enables support for Toshiba BENAND.
The current implementation does not support vondor specific command
TOSHIBA_NAND_CMD_ECC_STATUS. I would like to add the command, when
the exec_op() [1] infrastructure is implemented.

[1] https://github.com/bbrezillon/linux/commits/nand/exec_op1

Changelog[v2]:
    Rewrite to adapt the mtd "separate vendor specific code from
    core" cleanup process that based on comments from the following
    discussion.
    http://patchwork.ozlabs.org/patch/767191/

Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
---
 drivers/mtd/nand/nand_toshiba.c | 100 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/mtd/nand/nand_toshiba.c b/drivers/mtd/nand/nand_toshiba.c
index 57df857..7a99bbe 100644
--- a/drivers/mtd/nand/nand_toshiba.c
+++ b/drivers/mtd/nand/nand_toshiba.c
@@ -17,6 +17,72 @@
 
 #include <linux/mtd/rawnand.h>
 
+/* ECC Status Read Command for BENAND */
+#define TOSHIBA_NAND_CMD_ECC_STATUS	0x7A
+
+/* Recommended to rewrite for BENAND */
+#define TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED	BIT(3)
+
+static int toshiba_nand_benand_status_chk(struct mtd_info *mtd,
+					  struct nand_chip *chip)
+{
+	unsigned int max_bitflips = 0;
+	u8 status;
+
+	/* Check Read Status */
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+	status = chip->read_byte(mtd);
+
+	/*
+	 * TOSHIBA_NAND_CMD_ECC_STATUS is vendor specific command.
+	 * We will rewrite this code, after the ->exec_op() infrastructure
+	 * is implemented
+	 * Now, we set max_bitflips mtd->bitflip_threshold.
+	 */
+	if (status & NAND_STATUS_FAIL) {
+		/* uncorrectable */
+		mtd->ecc_stats.failed++;
+	} else if (status & TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED) {
+		/* correctable */
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
+	unsigned int max_bitflips = 0;
+
+	chip->ecc.read_page_raw(mtd, chip, buf, oob_required, page);
+	max_bitflips = toshiba_nand_benand_status_chk(mtd, chip);
+
+	return max_bitflips;
+}
+
+static int
+toshiba_nand_read_subpage_benand(struct mtd_info *mtd,
+				 struct nand_chip *chip, uint32_t data_offs,
+				 uint32_t readlen, uint8_t *bufpoi, int page)
+{
+	uint8_t *p;
+	unsigned int max_bitflips = 0;
+
+	if (data_offs != 0)
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_offs, -1);
+
+	p = bufpoi + data_offs;
+	chip->read_buf(mtd, p, readlen);
+
+	max_bitflips = toshiba_nand_benand_status_chk(mtd, chip);
+
+	return max_bitflips;
+}
+
 static void toshiba_nand_decode_id(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -39,9 +105,43 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
 
 static int toshiba_nand_init(struct nand_chip *chip)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
 	if (nand_is_slc(chip))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
+	if (nand_is_slc(chip) && (chip->id.data[4] & 0x80)) {
+		/* BENAND */
+
+		/*
+		 * We can't disable the internal ECC engine, the user
+		 * has to use on-die ECC, there is no alternative.
+		 */
+		if (chip->ecc.mode != NAND_ECC_ON_DIE) {
+			pr_err("On-die ECC should be selected.\n");
+			return -EINVAL;
+		}
+
+		/*
+		 * On BENAND, all OOB reginon can be used by user (driver).
+		 * The calculated ECC bytes are stored into other isolated
+		 * area which is ubable to access from user.
+		 * This is why chip->ecc.bytes = 0.
+		 */
+		chip->ecc.bytes = 0;
+		chip->ecc.size = 512;
+		chip->ecc.strength = 8;
+		chip->ecc.read_page = toshiba_nand_read_page_benand;
+		chip->ecc.read_subpage = toshiba_nand_read_subpage_benand;
+		chip->ecc.write_page = nand_write_page_raw;
+		chip->ecc.read_page_raw = nand_read_page_raw;
+		chip->ecc.write_page_raw = nand_write_page_raw;
+
+		chip->options |= NAND_SUBPAGE_READ;
+
+		mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	}
+
 	return 0;
 }
 
-- 
2.7.4

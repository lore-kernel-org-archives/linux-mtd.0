Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUleT-0002KZ-UP
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 23:30:03 +0000
From: David Mosberger <davidm@egauge.net>
To: pekon@ti.com
Subject: [PATCH v4 5/5] mtd: nand: Improve bitflip detection for on-die ECC
 scheme.
Date: Mon, 31 Mar 2014 17:28:57 -0600
Message-Id: <1396308537-16013-6-git-send-email-davidm@egauge.net>
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

When NAND_STATUS_REWRITE is set, there is no direct indication as to
how many bits have were flipped.  This patch improves the existing
code by manually counting the number of bitflips, rather than just
assuming the worst-case of mtd->bitflip_threshold.  This avoids
unnecessary rewrites, e.g., due to a single stuck bit.

Signed-off-by: David Mosberger <davidm@egauge.net>
---
 drivers/mtd/nand/nand_base.c |   90 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 834352a..80cfaa8 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1272,6 +1272,84 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	return max_bitflips;
 }
 
+static int
+set_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip, int on)
+{
+	u8 data[ONFI_SUBFEATURE_PARAM_LEN] = { 0, };
+
+	if (chip->ecc.mode != NAND_ECC_HW_ON_DIE)
+		return 0;
+
+	if (on)
+		data[0] = ONFI_FEATURE_ARRAY_OP_MODE_ENABLE_ON_DIE_ECC;
+
+	return chip->onfi_set_features(mtd, chip,
+				       ONFI_FEATURE_ADDR_ARRAY_OP_MODE, data);
+}
+
+/*
+ * Return the number of bits that differ between buffers SRC1 and
+ * SRC2, both of which are LEN bytes long.
+ *
+ * This code could be optimized for, but it only gets called on pages
+ * with bitflips and compared to the cost of migrating an eraseblock,
+ * the execution time here is trivial...
+ */
+static int
+bitdiff(const void *s1, const void *s2, size_t len)
+{
+	const uint8_t *src1 = s1, *src2 = s2;
+	int count = 0, i;
+
+	for (i = 0; i < len; ++i)
+		count += hweight8(*src1++ ^ *src2++);
+	return count;
+}
+
+static int
+check_for_bitflips(struct mtd_info *mtd, struct nand_chip *chip, int page)
+{
+	int flips = 0, max_bitflips = 0, i, j, read_size;
+	uint8_t *chkbuf, *rawbuf, *chkoob, *rawoob;
+	uint32_t *eccpos;
+
+	chkbuf = chip->buffers->chkbuf;
+	rawbuf = chip->buffers->rawbuf;
+	read_size = mtd->writesize + mtd->oobsize;
+
+	/* Read entire page w/OOB area with on-die ECC on: */
+	chip->read_buf(mtd, chkbuf, read_size);
+
+	/* Re-read page with on-die ECC off: */
+	set_on_die_ecc(mtd, chip, 0);
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+	chip->read_buf(mtd, rawbuf, read_size);
+	set_on_die_ecc(mtd, chip, 1);
+
+	chkoob = chkbuf + mtd->writesize;
+	rawoob = rawbuf + mtd->writesize;
+	eccpos = chip->ecc.layout->eccpos;
+	for (i = 0; i < chip->ecc.steps; ++i) {
+		/* Count bit flips in the actual data area: */
+		flips = bitdiff(chkbuf, rawbuf, chip->ecc.size);
+		/* Count bit flips in the ECC bytes: */
+		for (j = 0; j < chip->ecc.bytes; ++j) {
+			flips += hweight8(chkoob[*eccpos] ^ rawoob[*eccpos]);
+			++eccpos;
+		}
+		if (flips > 0)
+			mtd->ecc_stats.corrected += flips;
+		max_bitflips = max_t(int, max_bitflips, flips);
+		chkbuf += chip->ecc.size;
+		rawbuf += chip->ecc.size;
+	}
+
+	/* Re-issue the READ command for the actual data read that follows.  */
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+
+	return max_bitflips;
+}
+
 static int check_read_status_on_die(struct mtd_info *mtd,
 				    struct nand_chip *chip, int page)
 {
@@ -1290,11 +1368,15 @@ static int check_read_status_on_die(struct mtd_info *mtd,
 		mtd->ecc_stats.failed++;
 	} else if (status & NAND_STATUS_REWRITE) {
 		/*
-		 * Simple but suboptimal: any page with a single stuck
-		 * bit will be unusable since it'll be rewritten on
-		 * each read...
+		 * The Micron chips turn on the REWRITE status bit for
+		 * ANY bit flips.  Some pages have stuck bits, so we
+		 * don't want to migrate a block just because of
+		 * single bit errors because otherwise, that block
+		 * would effectively become unusable.  So, work out in
+		 * software what the max number of flipped bits is for
+		 * all subpages in a page:
 		 */
-		max_bitflips = mtd->bitflip_threshold;
+		max_bitflips = check_for_bitflips(mtd, chip, page);
 	}
 	return max_bitflips;
 }
-- 
1.7.9.5

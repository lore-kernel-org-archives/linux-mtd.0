Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEMU7-0000mG-Pe
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2015 19:32:38 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: "Franklin S Cooper Jr." <fcooper@ti.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 2/5] mtd: nand: use nand_check_erased_ecc_chunk in default
 ECC read functions
Date: Wed, 30 Dec 2015 20:32:04 +0100
Message-Id: <1451503927-10831-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1451503927-10831-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1451503927-10831-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The default NAND read functions are relying on the underlying controller
driver to correct bitflips, but some of those controllers cannot properly
fix bitflips in erased pages.
Check for bitflips in erased pages in default core functions if the driver
delegated the this check by setting the NAND_ECC_GENERIC_ERASED_CHECK flag.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 53 ++++++++++++++++++++++++++++++++++++++------
 include/linux/mtd/nand.h     | 10 +++++++++
 2 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 928081b..909a1d4 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1426,6 +1426,16 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 
 		stat = chip->ecc.correct(mtd, p,
 			&chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
+		if (stat == -EBADMSG &&
+		    (chip->ecc.options & NAND_ECC_GENERIC_ERASED_CHECK)) {
+			/* check for empty pages with bitflips */
+			stat = nand_check_erased_ecc_chunk(p, chip->ecc.size,
+						&chip->buffers->ecccode[i],
+						chip->ecc.bytes,
+						NULL, 0,
+						chip->ecc.strength);
+		}
+
 		if (stat < 0) {
 			mtd->ecc_stats.failed++;
 		} else {
@@ -1475,6 +1485,15 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 		int stat;
 
 		stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
+		if (stat == -EBADMSG &&
+		    (chip->ecc.options & NAND_ECC_GENERIC_ERASED_CHECK)) {
+			/* check for empty pages with bitflips */
+			stat = nand_check_erased_ecc_chunk(p, eccsize,
+						&ecc_code[i], eccbytes,
+						NULL, 0,
+						chip->ecc.strength);
+		}
+
 		if (stat < 0) {
 			mtd->ecc_stats.failed++;
 		} else {
@@ -1527,6 +1546,15 @@ static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
 		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
 
 		stat = chip->ecc.correct(mtd, p, &ecc_code[i], NULL);
+		if (stat == -EBADMSG &&
+		    (chip->ecc.options & NAND_ECC_GENERIC_ERASED_CHECK)) {
+			/* check for empty pages with bitflips */
+			stat = nand_check_erased_ecc_chunk(p, eccsize,
+						&ecc_code[i], eccbytes,
+						NULL, 0,
+						chip->ecc.strength);
+		}
+
 		if (stat < 0) {
 			mtd->ecc_stats.failed++;
 		} else {
@@ -1554,6 +1582,7 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 	int i, eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
 	int eccsteps = chip->ecc.steps;
+	int eccpadbytes = eccbytes + chip->ecc.prepad + chip->ecc.postpad;
 	uint8_t *p = buf;
 	uint8_t *oob = chip->oob_poi;
 	unsigned int max_bitflips = 0;
@@ -1573,19 +1602,29 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->read_buf(mtd, oob, eccbytes);
 		stat = chip->ecc.correct(mtd, p, oob, NULL);
 
-		if (stat < 0) {
-			mtd->ecc_stats.failed++;
-		} else {
-			mtd->ecc_stats.corrected += stat;
-			max_bitflips = max_t(unsigned int, max_bitflips, stat);
-		}
-
 		oob += eccbytes;
 
 		if (chip->ecc.postpad) {
 			chip->read_buf(mtd, oob, chip->ecc.postpad);
 			oob += chip->ecc.postpad;
 		}
+
+		if (stat == -EBADMSG &&
+		    (chip->ecc.options & NAND_ECC_GENERIC_ERASED_CHECK)) {
+			/* check for empty pages with bitflips */
+			stat = nand_check_erased_ecc_chunk(p, chip->ecc.size,
+							   oob - eccpadbytes,
+							   eccpadbytes,
+							   NULL, 0,
+							   chip->ecc.strength);
+		}
+
+		if (stat < 0) {
+			mtd->ecc_stats.failed++;
+		} else {
+			mtd->ecc_stats.corrected += stat;
+			max_bitflips = max_t(unsigned int, max_bitflips, stat);
+		}
 	}
 
 	/* Calculate remaining oob bytes */
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 5189581..86487db 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -129,6 +129,14 @@ typedef enum {
 /* Enable Hardware ECC before syndrome is read back from flash */
 #define NAND_ECC_READSYN	2
 
+/*
+ * Enable generic NAND 'page erased' check. This check is only done when
+ * ecc.correct() returns -EBADMSG.
+ * Set this flag if your implementation does not fix bitflips in erased
+ * pages and you want to rely on the default implementation.
+ */
+#define NAND_ECC_GENERIC_ERASED_CHECK	BIT(0)
+
 /* Bit mask for flags passed to do_nand_read_ecc */
 #define NAND_GET_DEVICE		0x80
 
@@ -451,6 +459,7 @@ struct nand_hw_control {
  * @total:	total number of ECC bytes per page
  * @prepad:	padding information for syndrome based ECC generators
  * @postpad:	padding information for syndrome based ECC generators
+ * @options:	ECC specific options (see NAND_ECC_XXX flags defined above)
  * @layout:	ECC layout control struct pointer
  * @priv:	pointer to private ECC control data
  * @hwctl:	function to control hardware ECC generator. Must only
@@ -500,6 +509,7 @@ struct nand_ecc_ctrl {
 	int strength;
 	int prepad;
 	int postpad;
+	unsigned int options;
 	struct nand_ecclayout	*layout;
 	void *priv;
 	void (*hwctl)(struct mtd_info *mtd, int mode);
-- 
2.1.4

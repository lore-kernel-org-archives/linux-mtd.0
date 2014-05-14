Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkdSQ-0007QY-Oj
 for linux-mtd@lists.infradead.org; Wed, 14 May 2014 17:59:11 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 1/4] mtd: nand: Warn the user if the selected ECC strength
 is too weak
Date: Wed, 14 May 2014 14:58:06 -0300
Message-Id: <1400090289-24581-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1400090289-24581-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1400090289-24581-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Simon Guinot <simon.guinot@sequanux.org>,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit makes use of the chip->ecc_strength_ds and chip->ecc_step_ds which
contain the datasheet minimum requested ECC strength to produce a noisy warning
if the configured ECC strength is weaker.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7853b9b..b84450a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3769,6 +3769,39 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 }
 EXPORT_SYMBOL(nand_scan_ident);
 
+/*
+ * Check if the chip configuration meet the datasheet requirements.
+
+ * If our configuration corrects A bits per B bytes and the minimum
+ * required correction level is X bits per Y bytes, then we must ensure
+ * both of the following are true:
+ *
+ * (1) A / B >= X / Y
+ * (2) A >= X
+ *
+ * Requirement (1) ensures we can correct for the required bitflip density.
+ * Requirement (2) ensures we can correct even when all bitflips are clumped
+ * in the same sector.
+ */
+static bool nand_ecc_strength_good(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	int corr, ds_corr;
+
+	if (ecc->size == 0 || chip->ecc_step_ds == 0)
+		/* Not enough information */
+		return true;
+
+	/*
+	 * We get the number of corrected bits per page to compare
+	 * the correction density.
+	 */
+	corr = (mtd->writesize * ecc->strength) / ecc->size;
+	ds_corr = (mtd->writesize * chip->ecc_strength_ds) / chip->ecc_step_ds;
+
+	return corr >= ds_corr && ecc->strength >= chip->ecc_strength_ds;
+}
 
 /**
  * nand_scan_tail - [NAND Interface] Scan for the NAND device
@@ -3989,6 +4022,9 @@ int nand_scan_tail(struct mtd_info *mtd)
 		ecc->layout->oobavail += ecc->layout->oobfree[i].length;
 	mtd->oobavail = ecc->layout->oobavail;
 
+	/* ECC sanity check: warn noisily if it's too weak */
+	WARN_ON(!nand_ecc_strength_good(mtd));
+
 	/*
 	 * Set the number of read / write steps for one page depending on ECC
 	 * mode.
-- 
1.9.1

Received: from mail-ea0-x236.google.com ([2a00:1450:4013:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDLB1-00064m-UP
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 21:47:36 +0000
Received: by mail-ea0-f182.google.com with SMTP id r15so4015675ead.13
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 13:47:14 -0800 (PST)
From: Boris BREZILLON <b.brezillon.dev@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH v2 1/4] mtd: nand: take nand_ecc_ctrl initialization out
 of nand_scan_tail
Date: Tue, 11 Feb 2014 22:46:46 +0100
Message-Id: <1392155209-14495-2-git-send-email-b.brezillon.dev@gmail.com>
In-Reply-To: <1392155209-14495-1-git-send-email-b.brezillon.dev@gmail.com>
References: <1392155209-14495-1-git-send-email-b.brezillon.dev@gmail.com>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gupta Pekon <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Take ECC initialization code portion out of nand_scan_tail so that we can
re-use this implementation.

Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   72 +++++++++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f59a465..f2e9312 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3582,32 +3582,14 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 }
 EXPORT_SYMBOL(nand_scan_ident);
 
-
-/**
- * nand_scan_tail - [NAND Interface] Scan for the NAND device
- * @mtd: MTD device structure
- *
- * This is the second phase of the normal nand_scan() function. It fills out
- * all the uninitialized function pointers with the defaults and scans for a
- * bad block table if appropriate.
+/*
+ * Initialize ECC struct:
+ *  - fill ECC struct with default function/values when these ones are undefined
+ *  - fill ECC infos based on MTD device
  */
-int nand_scan_tail(struct mtd_info *mtd)
+static int nand_ecc_ctrl_init(struct mtd_info *mtd, struct nand_ecc_ctrl *ecc)
 {
 	int i;
-	struct nand_chip *chip = mtd->priv;
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
-
-	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
-	BUG_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
-			!(chip->bbt_options & NAND_BBT_USE_FLASH));
-
-	if (!(chip->options & NAND_OWN_BUFFERS))
-		chip->buffers = kmalloc(sizeof(*chip->buffers), GFP_KERNEL);
-	if (!chip->buffers)
-		return -ENOMEM;
-
-	/* Set the internal oob buffer location, just after the page data */
-	chip->oob_poi = chip->buffers->databuf + mtd->writesize;
 
 	/*
 	 * If no default placement scheme is given, select an appropriate one.
@@ -3633,9 +3615,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 		}
 	}
 
-	if (!chip->write_page)
-		chip->write_page = nand_write_page;
-
 	/*
 	 * Check ECC mode, default to software if 3byte/512byte hardware ECC is
 	 * selected and we have 256 byte pagesize fallback to software ECC
@@ -3802,6 +3781,47 @@ int nand_scan_tail(struct mtd_info *mtd)
 	}
 	ecc->total = ecc->steps * ecc->bytes;
 
+	return 0;
+}
+
+/**
+ * nand_scan_tail - [NAND Interface] Scan for the NAND device
+ * @mtd: MTD device structure
+ *
+ * This is the second phase of the normal nand_scan() function. It fills out
+ * all the uninitialized function pointers with the defaults and scans for a
+ * bad block table if appropriate.
+ */
+int nand_scan_tail(struct mtd_info *mtd)
+{
+	int ret;
+	struct nand_chip *chip = mtd->priv;
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+
+	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
+	BUG_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
+			!(chip->bbt_options & NAND_BBT_USE_FLASH));
+
+	if (!(chip->options & NAND_OWN_BUFFERS))
+		chip->buffers = kmalloc(sizeof(*chip->buffers), GFP_KERNEL);
+	if (!chip->buffers)
+		return -ENOMEM;
+
+	/* Set the internal oob buffer location, just after the page data */
+	chip->oob_poi = chip->buffers->databuf + mtd->writesize;
+
+	if (!chip->write_page)
+		chip->write_page = nand_write_page;
+
+	/* Initialize ECC struct */
+	ret = nand_ecc_ctrl_init(mtd, ecc);
+	if (ret) {
+		if (!(chip->options & NAND_OWN_BUFFERS))
+			kfree(chip->buffers);
+
+		return ret;
+	}
+
 	/* Allow subpage writes up to ecc.steps. Not possible for MLC flash */
 	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) && nand_is_slc(chip)) {
 		switch (ecc->steps) {
-- 
1.7.9.5

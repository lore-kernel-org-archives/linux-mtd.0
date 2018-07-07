Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbgzY-00064O-Tl
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 06:46:50 +0000
From: Daniel Mack <daniel@zonque.org>
To: miquel.raynal@bootlin.com
Cc: robert.jarzmik@free.fr, boris.brezillon@bootlin.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 3/3] mtd: rawnand: marvell: set reg_clk to NULL if it can't
 be obtained
Date: Sat,  7 Jul 2018 08:46:31 +0200
Message-Id: <20180707064631.799-3-daniel@zonque.org>
In-Reply-To: <20180707064631.799-1-daniel@zonque.org>
References: <20180707064631.799-1-daniel@zonque.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't keep an error-pointer around in the private struct. If this optional
clock can't be obtained, simply set the pointer to NULL instead so we can
use clk_prepare_enable() on it without further checks,

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/mtd/nand/raw/marvell_nand.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index e72070fe8af9..94c77271ea8b 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2752,17 +2752,19 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 		return ret;
 
 	nfc->reg_clk = devm_clk_get(&pdev->dev, "reg");
-	if (PTR_ERR(nfc->reg_clk) != -ENOENT) {
-		if (!IS_ERR(nfc->reg_clk)) {
-			ret = clk_prepare_enable(nfc->reg_clk);
-			if (ret)
-				goto unprepare_core_clk;
-		} else {
+	if (IS_ERR(nfc->reg_clk)) {
+		if (PTR_ERR(nfc->reg_clk) != -ENOENT) {
 			ret = PTR_ERR(nfc->reg_clk);
 			goto unprepare_core_clk;
 		}
+
+		nfc->reg_clk = NULL;
 	}
 
+	ret = clk_prepare_enable(nfc->reg_clk);
+	if (ret)
+		goto unprepare_core_clk;
+
 	marvell_nfc_disable_int(nfc, NDCR_ALL_INT);
 	marvell_nfc_clear_int(nfc, NDCR_ALL_INT);
 	ret = devm_request_irq(dev, irq, marvell_nfc_isr,
@@ -2843,11 +2845,9 @@ static int __maybe_unused marvell_nfc_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	if (!IS_ERR(nfc->reg_clk)) {
-		ret = clk_prepare_enable(nfc->reg_clk);
-		if (ret < 0)
-			return ret;
-	}
+	ret = clk_prepare_enable(nfc->reg_clk);
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * Reset nfc->selected_chip so the next command will cause the timing
-- 
2.17.1

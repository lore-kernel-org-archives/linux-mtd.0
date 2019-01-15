Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjJpT-0002H3-Eu
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2019 08:12:13 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH] mtd: rawnand: denali_dt: remove single anonymous clock support
Date: Tue, 15 Jan 2019 17:11:34 +0900
Message-Id: <1547539894-12898-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 6f1fe97bec34 ("mtd: rawnand: denali_dt: add more clocks based
on IP datasheet") introduced a more correct binding that requires
three named clocks.

Now that all upstream DT files migrated over to it, remove the single
anonymous clock support.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali_dt.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 7c6a8a4..0b5ae24 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -109,25 +109,17 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (IS_ERR(denali->host))
 		return PTR_ERR(denali->host);
 
-	/*
-	 * A single anonymous clock is supported for the backward compatibility.
-	 * New platforms should support all the named clocks.
-	 */
 	dt->clk = devm_clk_get(dev, "nand");
 	if (IS_ERR(dt->clk))
-		dt->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(dt->clk)) {
-		dev_err(dev, "no clk available\n");
 		return PTR_ERR(dt->clk);
-	}
 
 	dt->clk_x = devm_clk_get(dev, "nand_x");
 	if (IS_ERR(dt->clk_x))
-		dt->clk_x = NULL;
+		return PTR_ERR(dt->clk_x);
 
 	dt->clk_ecc = devm_clk_get(dev, "ecc");
 	if (IS_ERR(dt->clk_ecc))
-		dt->clk_ecc = NULL;
+		return PTR_ERR(dt->clk_ecc);
 
 	ret = clk_prepare_enable(dt->clk);
 	if (ret)
@@ -141,19 +133,8 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_disable_clk_x;
 
-	if (dt->clk_x) {
-		denali->clk_rate = clk_get_rate(dt->clk);
-		denali->clk_x_rate = clk_get_rate(dt->clk_x);
-	} else {
-		/*
-		 * Hardcode the clock rates for the backward compatibility.
-		 * This works for both SOCFPGA and UniPhier.
-		 */
-		dev_notice(dev,
-			   "necessary clock is missing. default clock rates are used.\n");
-		denali->clk_rate = 50000000;
-		denali->clk_x_rate = 200000000;
-	}
+	denali->clk_rate = clk_get_rate(dt->clk);
+	denali->clk_x_rate = clk_get_rate(dt->clk_x);
 
 	ret = denali_init(denali);
 	if (ret)
-- 
2.7.4

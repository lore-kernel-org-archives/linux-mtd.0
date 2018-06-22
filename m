Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWOak-0005q4-TU
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2018 16:07:23 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v4 2/5] mtd: rawnand: denali_dt: use dev as a shorthand of
 &pdev->dev
Date: Sat, 23 Jun 2018 01:06:35 +0900
Message-Id: <1529683598-25783-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1529683598-25783-1-git-send-email-yamada.masahiro@socionext.com>
References: <1529683598-25783-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The probe function references &pdev->dev many times, and I will add
more soon.  Add 'dev' as a shorthand.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Richard Weinberger <richard@nod.at>
Tested-by: Richard Weinberger <richard@nod.at>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/raw/denali_dt.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 5869e90..6b4bd16 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -79,44 +79,45 @@ MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 
 static int denali_dt_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct denali_dt *dt;
 	const struct denali_dt_data *data;
 	struct denali_nand_info *denali;
 	int ret;
 
-	dt = devm_kzalloc(&pdev->dev, sizeof(*dt), GFP_KERNEL);
+	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
 	if (!dt)
 		return -ENOMEM;
 	denali = &dt->denali;
 
-	data = of_device_get_match_data(&pdev->dev);
+	data = of_device_get_match_data(dev);
 	if (data) {
 		denali->revision = data->revision;
 		denali->caps = data->caps;
 		denali->ecc_caps = data->ecc_caps;
 	}
 
-	denali->dev = &pdev->dev;
+	denali->dev = dev;
 	denali->irq = platform_get_irq(pdev, 0);
 	if (denali->irq < 0) {
-		dev_err(&pdev->dev, "no irq defined\n");
+		dev_err(dev, "no irq defined\n");
 		return denali->irq;
 	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "denali_reg");
-	denali->reg = devm_ioremap_resource(&pdev->dev, res);
+	denali->reg = devm_ioremap_resource(dev, res);
 	if (IS_ERR(denali->reg))
 		return PTR_ERR(denali->reg);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
-	denali->host = devm_ioremap_resource(&pdev->dev, res);
+	denali->host = devm_ioremap_resource(dev, res);
 	if (IS_ERR(denali->host))
 		return PTR_ERR(denali->host);
 
-	dt->clk = devm_clk_get(&pdev->dev, NULL);
+	dt->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(dt->clk)) {
-		dev_err(&pdev->dev, "no clk available\n");
+		dev_err(dev, "no clk available\n");
 		return PTR_ERR(dt->clk);
 	}
 	ret = clk_prepare_enable(dt->clk);
-- 
2.7.4

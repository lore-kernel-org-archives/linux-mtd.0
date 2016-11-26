Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNm-00050y-Qd
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:34 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 08/39] mtd: nand: denali: introduce capability flag
Date: Sun, 27 Nov 2016 03:05:54 +0900
Message-Id: <1480183585-592-9-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Denali NAND controller IP has several customizable features.
SoC vendors can choose desired functions when a delivery RTL is
created.  It means this IP has various variants.  For example,
the Intel version is equipped with 32bit DMA, whereas the IP for
UniPhier SoC family with 64bit DMA.

This driver was originally written for some Intel platforms with
Intel specific things hard-coded.  What is worse, the revision
register of this IP does not work to distinguish such features.
We need to do something to make the driver available for other SoCs.

Let's introduce a caps member to the denali_nand_info structure to
switch on/off various features.  Also, add struct denali_dt_data to
store the capability associated with compatible string.

Refer to the Link tag for discussion where Boris suggested this
approach instead of a new DT property for every feature.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Link: https://lkml.org/lkml/2016/3/29/142
---

 drivers/mtd/nand/denali.h    |  1 +
 drivers/mtd/nand/denali_dt.c | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 8bec980..95ed32e 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -420,6 +420,7 @@ struct denali_nand_info {
 	uint32_t devnum;	/* represent how many nands connected */
 	uint32_t bbtskipbytes;
 	uint32_t max_banks;
+	unsigned int caps;
 };
 
 extern int denali_init(struct denali_nand_info *denali);
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 5607fcd..293ddb8 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -29,6 +29,10 @@ struct denali_dt {
 	struct clk		*clk;
 };
 
+struct denali_dt_data {
+	unsigned int caps;
+};
+
 static const struct of_device_id denali_nand_dt_ids[] = {
 		{ .compatible = "denali,denali-nand-dt" },
 		{ /* sentinel */ }
@@ -42,23 +46,19 @@ static int denali_dt_probe(struct platform_device *ofdev)
 {
 	struct resource *denali_reg, *nand_data;
 	struct denali_dt *dt;
+	const struct denali_dt_data *data;
 	struct denali_nand_info *denali;
 	int ret;
-	const struct of_device_id *of_id;
-
-	of_id = of_match_device(denali_nand_dt_ids, &ofdev->dev);
-	if (of_id) {
-		ofdev->id_entry = of_id->data;
-	} else {
-		pr_err("Failed to find the right device id.\n");
-		return -ENOMEM;
-	}
 
 	dt = devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
 	if (!dt)
 		return -ENOMEM;
 	denali = &dt->denali;
 
+	data = of_device_get_match_data(&ofdev->dev);
+	if (data)
+		denali->caps = data->caps;
+
 	denali->platform = DT;
 	denali->dev = &ofdev->dev;
 	denali->irq = platform_get_irq(ofdev, 0);
-- 
2.7.4

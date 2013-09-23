Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VO1ds-0007WZ-CG
 for linux-mtd@lists.infradead.org; Mon, 23 Sep 2013 08:37:22 +0000
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MTK0043AL97K6H0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Mon, 23 Sep 2013 17:36:47 +0900 (KST)
From: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
To: kyungmin.park@samsung.com
Subject: [PATCH] MTD: Onenand: Add device tree support for samsung onenand
Date: Mon, 23 Sep 2013 10:36:28 +0200
Message-id: <1379925388-25051-1-git-send-email-m.krawczuk@partner.samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Mateusz Krawczuk <m.krawczuk@partner.samsung.com>, pawel.moll@arm.com,
 swarren@wwwdotorg.org, t.figa@samsung.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rob.herring@calxeda.com,
 linux-mtd@lists.infradead.org, rob@landley.net, grant.likely@linaro.org,
 dwmw2@infradead.org, m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch add clk and device tree nodes for samsung onenand driver.

Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/mtd/samsung-onenand.txt    | 40 ++++++++++++++++++++++
 drivers/mtd/onenand/samsung.c                      | 37 +++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung-onenand.txt

diff --git a/Documentation/devicetree/bindings/mtd/samsung-onenand.txt b/Documentation/devicetree/bindings/mtd/samsung-onenand.txt
new file mode 100644
index 0000000..cc46160
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/samsung-onenand.txt
@@ -0,0 +1,40 @@
+Device tree bindings for Samsung Onenand
+
+Required properties:
+  - compatible: value should be either of the following.
+      (a) "samsung, s3c6400-onenand", for onenand compatible with s3c6400 onenand.
+      (b) "samsung, s3c6410-onenand", for onenand compatible with s3c6410 onenand.
+      (c) "samsung, s5pc100-onenand", for onenand compatible with s5pc100 onenand.
+      (d) "samsung, s5pc110-onenand", for s5pc100-like onenand used
+	   on s5pc110 which supports DMA.
+
+Required properties:
+
+ - reg:					The CS line the peripheral
+					is connected to
+ - interrupt-parent, interrupts		Width of the ONENAND device
+ - 					connected to the Samsung SoC
+					in bytes. Must be 1 or 2.
+
+Optional properties:
+
+ - dma-channel:		DMA Channel index
+
+For inline partiton table parsing (optional):
+
+ - #address-cells: should be set to 1
+ - #size-cells: should be set to 1
+
+Example for an s5pv210 board:
+
+		onenand@b0000000 {
+			compatible = "samsung,s5pc110-onenand";
+			reg = <0xb0000000 0x20000>, <0xb0600000 0x2000>;
+			interrupt-parent = <&vic1>;
+			interrupts = <31>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&clocks NANDXL>;
+			clock-names = "gate";
+			status = "okay";
+		};
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index df7400d..5a2cc4b 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -14,6 +14,7 @@
  *	S5PC110: use DMA
  */
 
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
@@ -24,6 +25,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/of.h>
 
 #include <asm/mach/flash.h>
 
@@ -133,6 +135,7 @@ enum soc_type {
 struct s3c_onenand {
 	struct mtd_info	*mtd;
 	struct platform_device	*pdev;
+	struct clk *gate;
 	enum soc_type	type;
 	void __iomem	*base;
 	struct resource *base_res;
@@ -859,6 +862,19 @@ static void s3c_onenand_setup(struct mtd_info *mtd)
 	this->write_bufferram = onenand_write_bufferram;
 }
 
+static const struct of_device_id onenand_s3c_dt_match[] = {
+	{ .compatible = "samsung,s3c6400-onenand",
+		.data = (void *)TYPE_S3C6400 },
+	{ .compatible = "samsung,s3c6410-onenand",
+		.data = (void *)TYPE_S3C6410 },
+	{ .compatible = "samsung,s5pc100-onenand",
+		.data = (void *)TYPE_S5PC100 },
+	{ .compatible = "samsung,s5pc110-onenand",
+		.data = (void *)TYPE_S5PC110 },
+	{},
+};
+MODULE_DEVICE_TABLE(of, onenand_s3c_dt_match);
+
 static int s3c_onenand_probe(struct platform_device *pdev)
 {
 	struct onenand_platform_data *pdata;
@@ -883,12 +899,26 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		goto onenand_fail;
 	}
 
+	onenand->gate = clk_get(&pdev->dev, "gate");
+	if (IS_ERR(onenand->gate))
+		return PTR_ERR(onenand->gate);
+	clk_prepare_enable(onenand->gate);
+
 	this = (struct onenand_chip *) &mtd[1];
 	mtd->priv = this;
 	mtd->dev.parent = &pdev->dev;
 	mtd->owner = THIS_MODULE;
 	onenand->pdev = pdev;
-	onenand->type = platform_get_device_id(pdev)->driver_data;
+
+	if (pdev->dev.of_node) {
+		const struct of_device_id *match;
+
+		match = of_match_node(onenand_s3c_dt_match, pdev->dev.of_node);
+		onenand->type = (enum soc_type)match->data;
+	} else {
+		onenand->type = platform_get_device_id(pdev)->driver_data;
+	}
+
 
 	s3c_onenand_setup(mtd);
 
@@ -1077,6 +1107,10 @@ static int s3c_onenand_remove(struct platform_device *pdev)
 	kfree(onenand->page_buf);
 	kfree(onenand);
 	kfree(mtd);
+
+	clk_disable_unprepare(onenand->gate);
+	clk_put(onenand->gate);
+
 	return 0;
 }
 
@@ -1125,6 +1159,7 @@ MODULE_DEVICE_TABLE(platform, s3c_onenand_driver_ids);
 static struct platform_driver s3c_onenand_driver = {
 	.driver         = {
 		.name	= "samsung-onenand",
+		.of_match_table = of_match_ptr(onenand_s3c_dt_match),
 		.pm	= &s3c_pm_ops,
 	},
 	.id_table	= s3c_onenand_driver_ids,
-- 
1.8.1.2

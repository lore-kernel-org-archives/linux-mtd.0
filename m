Received: from smtp39.i.mail.ru ([94.100.177.99])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhEVy-0006Z2-2K
 for linux-mtd@lists.infradead.org; Tue, 28 May 2013 07:40:16 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [RFC] mtd: nand-gpio: Prepare driver to support multichip devices
Date: Tue, 28 May 2013 11:39:28 +0400
Message-Id: <1369726768-11945-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/mach-clps711x/board-autcpu12.c |  4 +--
 arch/arm/mach-clps711x/board-p720t.c    |  4 +--
 arch/arm/mach-pxa/cm-x255.c             | 10 ++++----
 drivers/mtd/nand/gpio.c                 | 45 +++++++++++++++------------------
 include/linux/mtd/nand-gpio.h           | 12 +++++----
 5 files changed, 37 insertions(+), 38 deletions(-)

diff --git a/arch/arm/mach-clps711x/board-autcpu12.c b/arch/arm/mach-clps711x/board-autcpu12.c
index f385847..260a28a 100644
--- a/arch/arm/mach-clps711x/board-autcpu12.c
+++ b/arch/arm/mach-clps711x/board-autcpu12.c
@@ -107,11 +107,11 @@ static void __init autcpu12_adjust_parts(struct gpio_nand_platdata *pdata,
 }
 
 static struct gpio_nand_platdata autcpu12_nand_pdata __initdata = {
-	.gpio_rdy	= AUTCPU12_SMC_RDY,
-	.gpio_nce	= AUTCPU12_SMC_NCE,
 	.gpio_ale	= AUTCPU12_SMC_ALE,
 	.gpio_cle	= AUTCPU12_SMC_CLE,
 	.gpio_nwp	= -1,
+	.gpio_nce[0]	= AUTCPU12_SMC_NCE,
+	.gpio_rdy[0]	= AUTCPU12_SMC_RDY,
 	.chip_delay	= 20,
 	.parts		= autcpu12_nand_parts,
 	.num_parts	= ARRAY_SIZE(autcpu12_nand_parts),
diff --git a/arch/arm/mach-clps711x/board-p720t.c b/arch/arm/mach-clps711x/board-p720t.c
index 8d3ee67..82a81de 100644
--- a/arch/arm/mach-clps711x/board-p720t.c
+++ b/arch/arm/mach-clps711x/board-p720t.c
@@ -69,11 +69,11 @@ static struct mtd_partition p720t_nand_parts[] __initdata = {
 };
 
 static struct gpio_nand_platdata p720t_nand_pdata __initdata = {
-	.gpio_rdy	= -1,
-	.gpio_nce	= P720T_NAND_NCE,
 	.gpio_ale	= P720T_NAND_ALE,
 	.gpio_cle	= P720T_NAND_CLE,
 	.gpio_nwp	= -1,
+	.gpio_nce[0]	= P720T_NAND_NCE,
+	.gpio_rdy[0]	= -1,
 	.chip_delay	= 15,
 	.parts		= p720t_nand_parts,
 	.num_parts	= ARRAY_SIZE(p720t_nand_parts),
diff --git a/arch/arm/mach-pxa/cm-x255.c b/arch/arm/mach-pxa/cm-x255.c
index be75147..40ae03f 100644
--- a/arch/arm/mach-pxa/cm-x255.c
+++ b/arch/arm/mach-pxa/cm-x255.c
@@ -198,11 +198,11 @@ static struct mtd_partition cmx255_nand_parts[] = {
 };
 
 static struct gpio_nand_platdata cmx255_nand_platdata = {
-	.gpio_nce = GPIO_NAND_CS,
-	.gpio_cle = GPIO_NAND_CLE,
-	.gpio_ale = GPIO_NAND_ALE,
-	.gpio_rdy = GPIO_NAND_RB,
-	.gpio_nwp = -1,
+	.gpio_ale	= GPIO_NAND_ALE,
+	.gpio_cle	= GPIO_NAND_CLE,
+	.gpio_nwp	= -1,
+	.gpio_nce[0]	= GPIO_NAND_CS,
+	.gpio_rdy[0]	= GPIO_NAND_RB,
 	.parts = cmx255_nand_parts,
 	.num_parts = ARRAY_SIZE(cmx255_nand_parts),
 	.chip_delay = 25,
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 800a1cc..a7d661e 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -41,7 +41,6 @@ struct gpiomtd {
 
 #define gpio_nand_getpriv(x) container_of(x, struct gpiomtd, mtd_info)
 
-
 #ifdef CONFIG_ARM
 /* gpio_nand_dosync()
  *
@@ -75,7 +74,7 @@ static void gpio_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	gpio_nand_dosync(gpiomtd);
 
 	if (ctrl & NAND_CTRL_CHANGE) {
-		gpio_set_value(gpiomtd->plat.gpio_nce, !(ctrl & NAND_NCE));
+		gpio_set_value(gpiomtd->plat.gpio_nce[0], !(ctrl & NAND_NCE));
 		gpio_set_value(gpiomtd->plat.gpio_cle, !!(ctrl & NAND_CLE));
 		gpio_set_value(gpiomtd->plat.gpio_ale, !!(ctrl & NAND_ALE));
 		gpio_nand_dosync(gpiomtd);
@@ -91,7 +90,7 @@ static int gpio_nand_devready(struct mtd_info *mtd)
 {
 	struct gpiomtd *gpiomtd = gpio_nand_getpriv(mtd);
 
-	return gpio_get_value(gpiomtd->plat.gpio_rdy);
+	return gpio_get_value(gpiomtd->plat.gpio_rdy[0]);
 }
 
 #ifdef CONFIG_OF
@@ -118,8 +117,8 @@ static int gpio_nand_get_config_of(const struct device *dev,
 		}
 	}
 
-	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
-	plat->gpio_nce = of_get_gpio(dev->of_node, 1);
+	plat->gpio_rdy[0] = of_get_gpio(dev->of_node, 0);
+	plat->gpio_nce[0] = of_get_gpio(dev->of_node, 1);
 	plat->gpio_ale = of_get_gpio(dev->of_node, 2);
 	plat->gpio_cle = of_get_gpio(dev->of_node, 3);
 	plat->gpio_nwp = of_get_gpio(dev->of_node, 4);
@@ -194,7 +193,7 @@ static int gpio_nand_remove(struct platform_device *pdev)
 
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
 		gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
-	gpio_set_value(gpiomtd->plat.gpio_nce, 1);
+	gpio_set_value(gpiomtd->plat.gpio_nce[0], 1);
 
 	return 0;
 }
@@ -234,34 +233,34 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
+	ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_ale,
+				    GPIOF_OUT_INIT_LOW, "NAND ALE");
+	if (ret)
+		return ret;
+
+	ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_cle,
+				    GPIOF_OUT_INIT_LOW, "NAND CLE");
 	if (ret)
 		return ret;
-	gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
 
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp)) {
-		ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nwp,
-					"NAND NWP");
+		ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_nwp,
+					    GPIOF_OUT_INIT_LOW, "NAND NWP");
 		if (ret)
 			return ret;
 	}
 
-	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_ale, "NAND ALE");
+	ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_nce[0],
+				    GPIOF_OUT_INIT_HIGH, "NAND NCE");
 	if (ret)
 		return ret;
-	gpio_direction_output(gpiomtd->plat.gpio_ale, 0);
 
-	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_cle, "NAND CLE");
-	if (ret)
-		return ret;
-	gpio_direction_output(gpiomtd->plat.gpio_cle, 0);
-
-	if (gpio_is_valid(gpiomtd->plat.gpio_rdy)) {
-		ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_rdy,
-					"NAND RDY");
+	if (gpio_is_valid(gpiomtd->plat.gpio_rdy[0])) {
+		ret = devm_gpio_request_one(&pdev->dev,
+					    gpiomtd->plat.gpio_rdy[0], GPIOF_IN,
+					    "NAND RDY");
 		if (ret)
 			return ret;
-		gpio_direction_input(gpiomtd->plat.gpio_rdy);
 		chip->dev_ready = gpio_nand_devready;
 	}
 
@@ -270,14 +269,13 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	chip->options		= gpiomtd->plat.options;
 	chip->chip_delay	= gpiomtd->plat.chip_delay;
 	chip->cmd_ctrl		= gpio_nand_cmd_ctrl;
-
 	gpiomtd->mtd_info.priv	= chip;
 	gpiomtd->mtd_info.owner	= THIS_MODULE;
 
 	platform_set_drvdata(pdev, gpiomtd);
 
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
-		gpio_direction_output(gpiomtd->plat.gpio_nwp, 1);
+		gpio_set_value(gpiomtd->plat.gpio_nwp, 1);
 
 	if (nand_scan(&gpiomtd->mtd_info, 1)) {
 		ret = -ENXIO;
@@ -311,7 +309,6 @@ static struct platform_driver gpio_nand_driver = {
 		.of_match_table = of_match_ptr(gpio_nand_id_table),
 	},
 };
-
 module_platform_driver(gpio_nand_driver);
 
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/nand-gpio.h b/include/linux/mtd/nand-gpio.h
index 51534e5..0e66068 100644
--- a/include/linux/mtd/nand-gpio.h
+++ b/include/linux/mtd/nand-gpio.h
@@ -3,12 +3,14 @@
 
 #include <linux/mtd/nand.h>
 
+#define MAX_NAND_PER_CHIP	1	
+
 struct gpio_nand_platdata {
-	int	gpio_nce;
-	int	gpio_nwp;
-	int	gpio_cle;
-	int	gpio_ale;
-	int	gpio_rdy;
+	int	gpio_ale;			/* ALE */
+	int	gpio_cle;			/* CLE */
+	int	gpio_nwp;			/* NWP (Optional) */
+	int	gpio_nce[MAX_NAND_PER_CHIP];	/* NCE */
+	int	gpio_rdy[MAX_NAND_PER_CHIP];	/* RDY (Optional) */
 	void	(*adjust_parts)(struct gpio_nand_platdata *, size_t);
 	struct mtd_partition *parts;
 	unsigned int num_parts;
-- 
1.8.1.5

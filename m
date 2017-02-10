Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccBla-0000El-El
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 14:01:44 +0000
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] mtd: nand: gpio: make nCE GPIO optional
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <20170210140110.87903682E7@localhost.localdomain>
Date: Fri, 10 Feb 2017 15:01:10 +0100 (CET)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On some hardware, the nCE signal is wired to the ChipSelect associated
to bus address of the NAND, so it is automatically driven during the
memory access and it is not managed by a GPIO.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/mtd/nand/gpio.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 0d24857..85294f1 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -78,7 +78,9 @@ static void gpio_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	gpio_nand_dosync(gpiomtd);
 
 	if (ctrl & NAND_CTRL_CHANGE) {
-		gpio_set_value(gpiomtd->plat.gpio_nce, !(ctrl & NAND_NCE));
+		if (gpio_is_valid(gpiomtd->plat.gpio_nce))
+			gpio_set_value(gpiomtd->plat.gpio_nce,
+				       !(ctrl & NAND_NCE));
 		gpio_set_value(gpiomtd->plat.gpio_cle, !!(ctrl & NAND_CLE));
 		gpio_set_value(gpiomtd->plat.gpio_ale, !!(ctrl & NAND_ALE));
 		gpio_nand_dosync(gpiomtd);
@@ -201,7 +203,8 @@ static int gpio_nand_remove(struct platform_device *pdev)
 
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
 		gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
-	gpio_set_value(gpiomtd->plat.gpio_nce, 1);
+	if (gpio_is_valid(gpiomtd->plat.gpio_nce))
+		gpio_set_value(gpiomtd->plat.gpio_nce, 1);
 
 	return 0;
 }
@@ -239,10 +242,13 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce, "NAND NCE");
-	if (ret)
-		return ret;
-	gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
+	if (gpio_is_valid(gpiomtd->plat.gpio_nce)) {
+		ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nce,
+					"NAND NCE");
+		if (ret)
+			return ret;
+		gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
+	}
 
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp)) {
 		ret = devm_gpio_request(&pdev->dev, gpiomtd->plat.gpio_nwp,
-- 
2.10.1

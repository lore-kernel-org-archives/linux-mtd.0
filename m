Received: from smtp25.mail.ru ([94.100.176.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V47lL-0002RG-Or
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 11:06:46 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/4] mtd: nand: gpio: Return real nand_scan() error code on
 fail and simplify error path
Date: Tue, 30 Jul 2013 15:06:16 +0400
Message-Id: <1375182376-30043-2-git-send-email-shc_work@mail.ru>
In-Reply-To: <1375182376-30043-1-git-send-email-shc_work@mail.ru>
References: <1375182376-30043-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
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
 drivers/mtd/nand/gpio.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index e432f1d..5eabd19 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -212,7 +212,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	struct nand_chip *chip;
 	struct resource *res;
 	struct mtd_part_parser_data ppdata = {};
-	int ret = 0;
+	int ret;
 
 	if (!pdev->dev.of_node && !pdev->dev.platform_data)
 		return -EINVAL;
@@ -288,23 +288,20 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	gpio_nand_set_wp(gpiomtd, 1);
 
-	if (nand_scan(&gpiomtd->mtd_info, 1)) {
-		ret = -ENXIO;
-		goto err_wp;
+	ret = nand_scan(&gpiomtd->mtd_info, 1);
+	if (!ret) {
+		if (gpiomtd->plat.adjust_parts)
+			gpiomtd->plat.adjust_parts(&gpiomtd->plat,
+						   gpiomtd->mtd_info.size);
+
+		ppdata.of_node = pdev->dev.of_node;
+		ret = mtd_device_parse_register(&gpiomtd->mtd_info, NULL,
+						&ppdata, gpiomtd->plat.parts,
+						gpiomtd->plat.num_parts);
+		if (!ret)
+			return 0;
 	}
 
-	if (gpiomtd->plat.adjust_parts)
-		gpiomtd->plat.adjust_parts(&gpiomtd->plat,
-					   gpiomtd->mtd_info.size);
-
-	ppdata.of_node = pdev->dev.of_node;
-	ret = mtd_device_parse_register(&gpiomtd->mtd_info, NULL, &ppdata,
-					gpiomtd->plat.parts,
-					gpiomtd->plat.num_parts);
-	if (!ret)
-		return 0;
-
-err_wp:
 	gpio_nand_set_wp(gpiomtd, 0);
 
 	return ret;
-- 
1.8.1.5

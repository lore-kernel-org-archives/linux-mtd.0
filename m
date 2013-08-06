Received: from smtp31.i.mail.ru ([94.100.177.91])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6d7B-0006oS-Ml
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 08:59:40 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 3/4] mtd: nand: gpio: Return real nand_scan() error code on
 fail
Date: Tue,  6 Aug 2013 12:59:04 +0400
Message-Id: <1375779544-510-3-git-send-email-shc_work@mail.ru>
In-Reply-To: <1375779544-510-1-git-send-email-shc_work@mail.ru>
References: <1375779544-510-1-git-send-email-shc_work@mail.ru>
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
 drivers/mtd/nand/gpio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 203db72..d4c123e 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -215,7 +215,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	struct nand_chip *chip;
 	struct resource *res;
 	struct mtd_part_parser_data ppdata = {};
-	int ret = 0;
+	int ret;
 
 	if (!pdev->dev.of_node && !pdev->dev.platform_data)
 		return -EINVAL;
@@ -291,10 +291,9 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	gpio_nand_set_wp(gpiomtd, 1);
 
-	if (nand_scan(&gpiomtd->mtd_info, 1)) {
-		ret = -ENXIO;
+	ret = nand_scan(&gpiomtd->mtd_info, 1);
+	if (ret)
 		goto err_wp;
-	}
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat,
-- 
1.8.1.5

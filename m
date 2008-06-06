Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K4eY6-0006TI-0h
	for linux-mtd@lists.infradead.org; Fri, 06 Jun 2008 16:12:18 +0000
Received: from bagnes.atmel.com ([10.175.100.4])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id m56GBZ0b003318
	for <linux-mtd@lists.infradead.org>;
	Fri, 6 Jun 2008 09:11:36 -0700 (PDT)
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: linux-mtd@lists.infradead.org, kernel@avr32linux.org
Subject: [PATCH 1/8] at91_nand: Convert to generic GPIO API
Date: Fri,  6 Jun 2008 18:04:51 +0200
Message-Id: <1212768298-13614-2-git-send-email-haavard.skinnemoen@atmel.com>
In-Reply-To: <1212768298-13614-1-git-send-email-haavard.skinnemoen@atmel.com>
References: <1212768298-13614-1-git-send-email-haavard.skinnemoen@atmel.com>
Cc: Patrice VILCHEZ <patrice.vilchez@atmel.com>,
	Andrew Victor <avictor.za@gmail.com>,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No point in using an AT91-specific GPIO API when the generic API works
just as well.

Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
---
 drivers/mtd/nand/at91_nand.c |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/at91_nand.c b/drivers/mtd/nand/at91_nand.c
index 0adb287..2dcaeea 100644
--- a/drivers/mtd/nand/at91_nand.c
+++ b/drivers/mtd/nand/at91_nand.c
@@ -31,12 +31,10 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 
+#include <asm/gpio.h>
 #include <asm/io.h>
-#include <asm/sizes.h>
 
-#include <asm/hardware.h>
 #include <asm/arch/board.h>
-#include <asm/arch/gpio.h>
 
 #ifdef CONFIG_MTD_NAND_AT91_ECC_HW
 #define hard_ecc	1
@@ -99,7 +97,7 @@ struct at91_nand_host {
 static void at91_nand_enable(struct at91_nand_host *host)
 {
 	if (host->board->enable_pin)
-		at91_set_gpio_value(host->board->enable_pin, 0);
+		gpio_set_value(host->board->enable_pin, 0);
 }
 
 /*
@@ -108,7 +106,7 @@ static void at91_nand_enable(struct at91_nand_host *host)
 static void at91_nand_disable(struct at91_nand_host *host)
 {
 	if (host->board->enable_pin)
-		at91_set_gpio_value(host->board->enable_pin, 1);
+		gpio_set_value(host->board->enable_pin, 1);
 }
 
 /*
@@ -142,7 +140,7 @@ static int at91_nand_device_ready(struct mtd_info *mtd)
 	struct nand_chip *nand_chip = mtd->priv;
 	struct at91_nand_host *host = nand_chip->priv;
 
-	return at91_get_gpio_value(host->board->rdy_pin);
+	return gpio_get_value(host->board->rdy_pin);
 }
 
 /*
@@ -447,7 +445,7 @@ static int __init at91_nand_probe(struct platform_device *pdev)
 	at91_nand_enable(host);
 
 	if (host->board->det_pin) {
-		if (at91_get_gpio_value(host->board->det_pin)) {
+		if (gpio_get_value(host->board->det_pin)) {
 			printk ("No SmartMedia card inserted.\n");
 			res = ENXIO;
 			goto out;
-- 
1.5.5.1

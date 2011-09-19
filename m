Received: from mo1.mail-out.ovh.net ([178.32.228.1])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5emw-0005NL-UL
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 14:25:42 +0000
Received: from mail179.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 9165C1014FDA
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Sep 2011 16:26:27 +0200 (CEST)
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/11] at92/nand: use gpio_is_valid to check the gpio
Date: Mon, 19 Sep 2011 16:03:18 +0200
Message-Id: <1316441002-27381-2-git-send-email-plagnioj@jcrosoft.com>
In-Reply-To: <1316436695-19194-1-git-send-email-plagnioj@jcrosoft.com>
References: <1316436695-19194-1-git-send-email-plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: linux-mtd@lists.infradead.org
---
Hi,

	I'd like to apply this patch via AT91 with the whole gpio patch series

Best Regards,
J.
 drivers/mtd/nand/atmel_nand.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 55da20c..e20ac1f 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -113,7 +113,7 @@ static int cpu_has_dma(void)
  */
 static void atmel_nand_enable(struct atmel_nand_host *host)
 {
-	if (host->board->enable_pin)
+	if (gpio_is_valid(host->board->enable_pin))
 		gpio_set_value(host->board->enable_pin, 0);
 }
 
@@ -122,7 +122,7 @@ static void atmel_nand_enable(struct atmel_nand_host *host)
  */
 static void atmel_nand_disable(struct atmel_nand_host *host)
 {
-	if (host->board->enable_pin)
+	if (gpio_is_valid(host->board->enable_pin))
 		gpio_set_value(host->board->enable_pin, 1);
 }
 
@@ -535,7 +535,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	nand_chip->IO_ADDR_W = host->io_base;
 	nand_chip->cmd_ctrl = atmel_nand_cmd_ctrl;
 
-	if (host->board->rdy_pin)
+	if (gpio_is_valid(host->board->rdy_pin))
 		nand_chip->dev_ready = atmel_nand_device_ready;
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
@@ -573,7 +573,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, host);
 	atmel_nand_enable(host);
 
-	if (host->board->det_pin) {
+	if (gpio_is_valid(host->board->det_pin)) {
 		if (gpio_get_value(host->board->det_pin)) {
 			printk(KERN_INFO "No SmartMedia card inserted.\n");
 			res = -ENXIO;
-- 
1.7.5.4

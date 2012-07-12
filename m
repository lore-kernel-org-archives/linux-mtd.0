Received: from 5.mo3.mail-out.ovh.net ([87.98.178.36]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SpEnX-00058a-Tf
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2012 08:31:03 +0000
Received: from mail241.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id EF7B2FF88FC
 for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2012 10:35:53 +0200 (CEST)
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1 v2] MTD: atmel nand: fix gpio missing request
Date: Thu, 12 Jul 2012 10:31:08 +0200
Message-Id: <1342081868-5995-1-git-send-email-plagnioj@jcrosoft.com>
In-Reply-To: <1342071036-15905-1-git-send-email-plagnioj@jcrosoft.com>
References: <1342071036-15905-1-git-send-email-plagnioj@jcrosoft.com>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 linux-mtd@lists.infradead.org, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

without this the gpio will not be muxed as a gpio by the current custom pinmux
or later by the pinctrl

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
---
V2:

	set the direction too

	today this is invisible as you mostly boot from nand and the
	bootloader configured them but if you load the kernel via nor you need
	to do it

Best Regards,
J.
 drivers/mtd/nand/atmel_nand.c |   56 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 97ac671..eef9f80 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -583,8 +583,39 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	nand_chip->IO_ADDR_W = host->io_base;
 	nand_chip->cmd_ctrl = atmel_nand_cmd_ctrl;
 
-	if (gpio_is_valid(host->board.rdy_pin))
+	if (gpio_is_valid(host->board.rdy_pin)) {
+		res = gpio_request(host->board.rdy_pin, "nand_rdy");
+		if (res < 0) {
+			dev_err(&pdev->dev,
+				"can't request rdy gpio %d\n", host->board.rdy_pin);
+			goto err_ecc_ioremap;
+		}
+
+		res = gpio_direction_input(host->board.rdy_pin);
+		if (res < 0) {
+			dev_err(&pdev->dev,
+				"can't request input direction rdy gpio %d\n", host->board.rdy_pin);
+			goto err_ecc_ioremap;
+		}
+
 		nand_chip->dev_ready = atmel_nand_device_ready;
+	}
+
+	if (gpio_is_valid(host->board.enable_pin)) {
+		res = gpio_request(host->board.enable_pin, "nand_enable");
+		if (res < 0) {
+			dev_err(&pdev->dev,
+				"can't request enable gpio %d\n", host->board.enable_pin);
+			goto err_ecc_ioremap;
+		}
+
+		res = gpio_direction_output(host->board.enable_pin, 1);
+		if (res < 0) {
+			dev_err(&pdev->dev,
+				"can't request output direction enable gpio %d\n", host->board.enable_pin);
+			goto err_ecc_ioremap;
+		}
+	}
 
 	nand_chip->ecc.mode = host->board.ecc_mode;
 
@@ -622,6 +653,20 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	atmel_nand_enable(host);
 
 	if (gpio_is_valid(host->board.det_pin)) {
+		res = gpio_request(host->board.det_pin, "nand_det");
+		if (res < 0) {
+			dev_err(&pdev->dev,
+				"can't request det gpio %d\n", host->board.det_pin);
+			goto err_no_card;
+		}
+
+		res = gpio_direction_input(host->board.det_pin);
+		if (res < 0) {
+			dev_err(&pdev->dev,
+				"can't request input direction det gpio %d\n", host->board.det_pin);
+			goto err_no_card;
+		}
+
 		if (gpio_get_value(host->board.det_pin)) {
 			printk(KERN_INFO "No SmartMedia card inserted.\n");
 			res = -ENXIO;
@@ -738,6 +783,15 @@ static int __exit atmel_nand_remove(struct platform_device *pdev)
 
 	atmel_nand_disable(host);
 
+	if (gpio_is_valid(host->board.det_pin))
+		gpio_free(host->board.det_pin);
+
+	if (gpio_is_valid(host->board.enable_pin))
+		gpio_free(host->board.enable_pin);
+
+	if (gpio_is_valid(host->board.rdy_pin))
+		gpio_free(host->board.rdy_pin);
+
 	if (host->ecc)
 		iounmap(host->ecc);
 
-- 
1.7.10

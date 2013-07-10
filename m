Received: from sauhun.de ([89.238.76.85] helo=pokefinder.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uwwo8-0000sU-5N
 for linux-mtd@lists.infradead.org; Wed, 10 Jul 2013 15:59:58 +0000
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] drivers/mtd/nand: don't use
 devm_pinctrl_get_select_default() in probe
Date: Wed, 10 Jul 2013 16:57:40 +0100
Message-Id: <1373471889-18107-5-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1373471889-18107-1-git-send-email-wsa@the-dreams.de>
References: <1373471889-18107-1-git-send-email-wsa@the-dreams.de>
Cc: Wolfram Sang <wsa@the-dreams.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Josh Wu <josh.wu@atmel.com>,
 linux-mtd@lists.infradead.org,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since commit ab78029 (drivers/pinctrl: grab default handles from device core),
we can rely on device core for setting the default pins. Compile tested only.

Acked-by: Linus Walleij <linus.walleij@linaro.org> (personally at LCE13)
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 drivers/mtd/nand/atmel_nand.c |    9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 2d23d29..4653b64a 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -41,7 +41,6 @@
 #include <linux/gpio.h>
 #include <linux/io.h>
 #include <linux/platform_data/atmel.h>
-#include <linux/pinctrl/consumer.h>
 
 #include <mach/cpu.h>
 
@@ -1470,7 +1469,6 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	struct resource *mem;
 	struct mtd_part_parser_data ppdata = {};
 	int res;
-	struct pinctrl *pinctrl;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem) {
@@ -1515,13 +1513,6 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	nand_chip->IO_ADDR_W = host->io_base;
 	nand_chip->cmd_ctrl = atmel_nand_cmd_ctrl;
 
-	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
-	if (IS_ERR(pinctrl)) {
-		dev_err(host->dev, "Failed to request pinctrl\n");
-		res = PTR_ERR(pinctrl);
-		goto err_ecc_ioremap;
-	}
-
 	if (gpio_is_valid(host->board.rdy_pin)) {
 		res = gpio_request(host->board.rdy_pin, "nand_rdy");
 		if (res < 0) {
-- 
1.7.10.4

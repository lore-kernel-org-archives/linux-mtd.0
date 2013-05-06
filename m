Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZPoL-0001KP-CJ
 for linux-mtd@lists.infradead.org; Mon, 06 May 2013 18:06:54 +0000
From: Fabio Estevam <fabio.estevam@freescale.com>
To: <shawn.guo@linaro.org>
Subject: [PATCH 05/13] mtd: gpmi-nand : Let device core handle pinctrl
Date: Mon, 6 May 2013 15:05:53 -0300
Message-ID: <1367863561-11534-5-git-send-email-fabio.estevam@freescale.com>
In-Reply-To: <1367863561-11534-1-git-send-email-fabio.estevam@freescale.com>
References: <1367863561-11534-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, festevam@gmail.com, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since commit ab78029 (drivers/pinctrl: grab default handles from device core),
we can rely on device core for handling pinctrl.

So remove devm_pinctrl_get_select_default() from the driver. 

Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: <linux-mtd@lists.infradead.org>
Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 717881a..e8adefa 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -26,7 +26,6 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/mtd/partitions.h>
-#include <linux/pinctrl/consumer.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_mtd.h>
@@ -565,7 +564,6 @@ err_clock:
 
 static int acquire_resources(struct gpmi_nand_data *this)
 {
-	struct pinctrl *pinctrl;
 	int ret;
 
 	ret = acquire_register_block(this, GPMI_NAND_GPMI_REGS_ADDR_RES_NAME);
@@ -584,19 +582,12 @@ static int acquire_resources(struct gpmi_nand_data *this)
 	if (ret)
 		goto exit_dma_channels;
 
-	pinctrl = devm_pinctrl_get_select_default(&this->pdev->dev);
-	if (IS_ERR(pinctrl)) {
-		ret = PTR_ERR(pinctrl);
-		goto exit_pin;
-	}
-
 	ret = gpmi_get_clks(this);
 	if (ret)
 		goto exit_clock;
 	return 0;
 
 exit_clock:
-exit_pin:
 	release_dma_channels(this);
 exit_dma_channels:
 	release_bch_irq(this);
-- 
1.7.9.5

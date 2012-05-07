Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRCZC-00036f-4m
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 01:16:47 +0000
Received: by mail-pz0-f49.google.com with SMTP id m1so2038646dad.36
 for <linux-mtd@lists.infradead.org>; Sun, 06 May 2012 18:16:45 -0700 (PDT)
From: Shawn Guo <shawn.guo@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND 5/9] mtd: nand: gpmi: adopt pinctrl support
Date: Mon,  7 May 2012 09:16:10 +0800
Message-Id: <1336353374-28939-6-git-send-email-shawn.guo@linaro.org>
In-Reply-To: <1336353374-28939-1-git-send-email-shawn.guo@linaro.org>
References: <1336353374-28939-1-git-send-email-shawn.guo@linaro.org>
Cc: Olof Johansson <olof@lixom.net>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 9ec51ce..8478fd9 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/mtd/gpmi-nand.h>
 #include <linux/mtd/partitions.h>
+#include <linux/pinctrl/consumer.h>
 #include "gpmi-nand.h"
 
 /* add our owner bbt descriptor */
@@ -476,6 +477,7 @@ acquire_err:
 static int __devinit acquire_resources(struct gpmi_nand_data *this)
 {
 	struct resources *res = &this->resources;
+	struct pinctrl *pinctrl;
 	int ret;
 
 	ret = acquire_register_block(this, GPMI_NAND_GPMI_REGS_ADDR_RES_NAME);
@@ -494,6 +496,12 @@ static int __devinit acquire_resources(struct gpmi_nand_data *this)
 	if (ret)
 		goto exit_dma_channels;
 
+	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
+	if (IS_ERR(pinctrl)) {
+		ret = PTR_ERR(pinctrl);
+		goto exit_pin;
+	}
+
 	res->clock = clk_get(&this->pdev->dev, NULL);
 	if (IS_ERR(res->clock)) {
 		pr_err("can not get the clock\n");
@@ -503,6 +511,7 @@ static int __devinit acquire_resources(struct gpmi_nand_data *this)
 	return 0;
 
 exit_clock:
+exit_pin:
 	release_dma_channels(this);
 exit_dma_channels:
 	release_bch_irq(this);
-- 
1.7.5.4

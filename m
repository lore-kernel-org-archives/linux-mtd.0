Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG5Ec-0003I3-CQ
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 10:18:07 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa12so1969527pbc.8
 for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2013 03:18:04 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] mtd: gpio: Use of_match_ptr() macro
Date: Thu, 14 Mar 2013 15:37:03 +0530
Message-Id: <1363255624-20885-4-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1363255624-20885-1-git-send-email-sachin.kamat@linaro.org>
References: <1363255624-20885-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, artem.bityutskiy@linux.intel.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This eliminates having an #ifdef returning NULL for the case
when OF is disabled.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/gpio.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 0cc1394..89065dd 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -190,7 +190,6 @@ static struct resource *gpio_nand_get_io_sync_of(struct platform_device *pdev)
 	return r;
 }
 #else /* CONFIG_OF */
-#define gpio_nand_id_table NULL
 static inline int gpio_nand_get_config_of(const struct device *dev,
 					  struct gpio_nand_platdata *plat)
 {
@@ -418,7 +417,7 @@ static struct platform_driver gpio_nand_driver = {
 	.remove		= gpio_nand_remove,
 	.driver		= {
 		.name	= "gpio-nand",
-		.of_match_table = gpio_nand_id_table,
+		.of_match_table = of_match_ptr(gpio_nand_id_table),
 	},
 };
 
-- 
1.7.4.1

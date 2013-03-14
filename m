Received: from mail-pb0-f52.google.com ([209.85.160.52])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG5EZ-0003HR-5f
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 10:18:07 +0000
Received: by mail-pb0-f52.google.com with SMTP id ma3so1991491pbc.11
 for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2013 03:18:01 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] mtd: gpio: Use devm_kzalloc()
Date: Thu, 14 Mar 2013 15:37:02 +0530
Message-Id: <1363255624-20885-3-git-send-email-sachin.kamat@linaro.org>
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

devm_kzalloc() is device managed and makes cleanup simpler.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/gpio.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index e789e3f..0cc1394 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -259,8 +259,6 @@ static int gpio_nand_remove(struct platform_device *dev)
 	if (gpio_is_valid(gpiomtd->plat.gpio_rdy))
 		gpio_free(gpiomtd->plat.gpio_rdy);
 
-	kfree(gpiomtd);
-
 	return 0;
 }
 
@@ -297,7 +295,7 @@ static int gpio_nand_probe(struct platform_device *dev)
 	if (!res0)
 		return -EINVAL;
 
-	gpiomtd = kzalloc(sizeof(*gpiomtd), GFP_KERNEL);
+	gpiomtd = devm_kzalloc(&dev->dev, sizeof(*gpiomtd), GFP_KERNEL);
 	if (gpiomtd == NULL) {
 		dev_err(&dev->dev, "failed to create NAND MTD\n");
 		return -ENOMEM;
@@ -412,7 +410,6 @@ err_sync:
 	iounmap(gpiomtd->nand_chip.IO_ADDR_R);
 	release_mem_region(res0->start, resource_size(res0));
 err_map:
-	kfree(gpiomtd);
 	return ret;
 }
 
-- 
1.7.4.1

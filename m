Received: from mail-pa0-f54.google.com ([209.85.220.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UYEVz-0005ot-Ab
 for linux-mtd@lists.infradead.org; Fri, 03 May 2013 11:51:04 +0000
Received: by mail-pa0-f54.google.com with SMTP id kx1so887702pab.41
 for <linux-mtd@lists.infradead.org>; Fri, 03 May 2013 04:50:41 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: onenand/omap2: Remove redundant
 platform_set_drvdata()
Date: Fri,  3 May 2013 17:07:42 +0530
Message-Id: <1367581063-24295-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1367581063-24295-1-git-send-email-sachin.kamat@linaro.org>
References: <1367581063-24295-1-git-send-email-sachin.kamat@linaro.org>
Cc: artem.bityutskiy@linux.intel.com, kyungmin.park@samsung.com,
 dwmw2@infradead.org, Jarkko Lavinen <jarkko.lavinen@nokia.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 0998d06310 (device-core: Ensure drvdata = NULL when no
driver is bound) removes the need to set driver data field to
NULL.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>
---
 drivers/mtd/onenand/omap2.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index d98b198..cd43cea 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -810,7 +810,6 @@ static int omap2_onenand_remove(struct platform_device *pdev)
 	if (c->dma_channel != -1)
 		omap_free_dma(c->dma_channel);
 	omap2_onenand_shutdown(pdev);
-	platform_set_drvdata(pdev, NULL);
 	if (c->gpio_irq) {
 		free_irq(gpio_to_irq(c->gpio_irq), c);
 		gpio_free(c->gpio_irq);
-- 
1.7.9.5

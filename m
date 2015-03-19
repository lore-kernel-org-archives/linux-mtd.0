Received: from mo6-p04-ob.smtp.rzone.de ([2a01:238:20a:202:5304::7])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYabB-000544-QJ
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 13:34:59 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: fsmc_nand.c: Use default timings if none are provided in
 the dts
Date: Thu, 19 Mar 2015 14:34:29 +0100
Message-Id: <1426772069-12677-1-git-send-email-sr@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Viresh Kumar <viresh.linux@gmail.com>,
 Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Without this patch the timings are all set to 0 if not specified in the dts.
With this patch the driver falls back to use the defaults that are already
present in the driver and are known to work okay for some (older) boards.

Tested on a custom SPEAr600 based board.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Viresh Kumar <viresh.linux@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>
---
 drivers/mtd/nand/fsmc_nand.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index edfaa21..e58af4b 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -873,6 +873,7 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 {
 	struct fsmc_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	u32 val;
+	int ret;
 
 	/* Set default NAND width to 8 bits */
 	pdata->width = 8;
@@ -891,8 +892,12 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 				sizeof(*pdata->nand_timings), GFP_KERNEL);
 	if (!pdata->nand_timings)
 		return -ENOMEM;
-	of_property_read_u8_array(np, "timings", (u8 *)pdata->nand_timings,
+	ret = of_property_read_u8_array(np, "timings", (u8 *)pdata->nand_timings,
 						sizeof(*pdata->nand_timings));
+	if (ret) {
+		dev_info(&pdev->dev, "No timings in dts specified, using default timings!\n");
+		pdata->nand_timings = NULL;
+	}
 
 	/* Set default NAND bank to 0 */
 	pdata->bank = 0;
-- 
2.3.3

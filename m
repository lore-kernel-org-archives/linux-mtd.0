Received: from mail-ig0-f179.google.com ([209.85.213.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnR75-0003dc-9D
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 11:24:44 +0000
Received: by mail-ig0-f179.google.com with SMTP id hn18so3362948igb.12
 for <linux-mtd@lists.infradead.org>; Thu, 22 May 2014 04:24:21 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] mtd: st_spi_fsm: Obtain and use EMI clock if provided
Date: Thu, 22 May 2014 12:24:00 +0100
Message-Id: <1400757848-18075-3-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
References: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ST's Common Clk Framework is now available. This patch ensures the FSM
makes use of it by obtaining and enabling the EMI clock if provided. If
system fails to provide the EMI clock FSM uses its original default
rate.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 45 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index aca4d72..fe54533 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -24,6 +24,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/clk.h>
 
 #include "serial_flash_cmds.h"
 
@@ -262,6 +263,7 @@ struct stfsm {
 	struct mtd_info		mtd;
 	struct mutex		lock;
 	struct flash_info       *info;
+	struct clk              *clk;
 
 	uint32_t                configuration;
 	uint32_t                fifo_dir_delay;
@@ -1907,8 +1909,13 @@ static void stfsm_set_freq(struct stfsm *fsm, uint32_t spi_freq)
 	uint32_t emi_freq;
 	uint32_t clk_div;
 
-	/* TODO: Make this dynamic */
-	emi_freq = STFSM_DEFAULT_EMI_FREQ;
+	if (!fsm->clk) {
+		dev_warn(fsm->dev,
+			 "No EMI clock available. Using default 100MHz.\n");
+
+		emi_freq = STFSM_DEFAULT_EMI_FREQ;
+	} else
+		emi_freq = clk_get_rate(fsm->clk);
 
 	/*
 	 * Calculate clk_div - values between 2 and 128
@@ -2058,6 +2065,15 @@ static int stfsm_probe(struct platform_device *pdev)
 		return PTR_ERR(fsm->base);
 	}
 
+	fsm->clk = devm_clk_get(&pdev->dev, "emi_clk");
+	if (IS_ERR(fsm->clk)) {
+		dev_warn(fsm->dev, "Couldn't find EMI clock.\n");
+		fsm->clk = NULL;
+	} else if (clk_prepare_enable(fsm->clk)) {
+		dev_warn(fsm->dev, "Failed to enable EMI clock.\n");
+		fsm->clk = NULL;
+	}
+
 	mutex_init(&fsm->lock);
 
 	ret = stfsm_init(fsm);
@@ -2122,6 +2138,30 @@ static int stfsm_remove(struct platform_device *pdev)
 	return mtd_device_unregister(&fsm->mtd);
 }
 
+#ifdef CONFIG_PM
+static int stfsmfsm_suspend(struct device *dev)
+{
+	struct stfsm *fsm = dev_get_drvdata(dev);
+
+	if (fsm->clk)
+		clk_disable_unprepare(fsm->clk);
+
+	return 0;
+}
+
+static int stfsmfsm_resume(struct device *dev)
+{
+	struct stfsm *fsm = dev_get_drvdata(dev);
+
+	if (fsm->clk)
+		clk_prepare_enable(fsm->clk);
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(stfsm_pm_ops, stfsmfsm_suspend, stfsmfsm_resume);
+
 static struct of_device_id stfsm_match[] = {
 	{ .compatible = "st,spi-fsm", },
 	{},
@@ -2135,6 +2175,7 @@ static struct platform_driver stfsm_driver = {
 		.name	= "st-spi-fsm",
 		.owner	= THIS_MODULE,
 		.of_match_table = stfsm_match,
+		.pm     = &stfsm_pm_ops,
 	},
 };
 module_platform_driver(stfsm_driver);
-- 
1.8.3.2

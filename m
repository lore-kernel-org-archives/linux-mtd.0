Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Umidr-0002NB-71
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2013 10:51:04 +0000
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
 by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5CAoe7O010144
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jun 2013 05:50:40 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
 by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5CAoccf009757
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jun 2013 05:50:38 -0500
From: Pekon Gupta <pekon@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 3/3] mtd: devices: elm: Low power transition support
Date: Wed, 12 Jun 2013 16:20:35 +0530
Message-ID: <1371034235-18720-3-git-send-email-pekon@ti.com>
In-Reply-To: <1371034235-18720-1-git-send-email-pekon@ti.com>
References: <1371034235-18720-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: avinash philip <avinashphilip@ti.com>

In low power modes of AM335X platforms, peripherals power is cut off.
This patch supports low power sleep transition support for ELM driver.

Signed-off-by: Philip Avinash <avinashphilip@ti.com>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/devices/elm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index dccef9f..171efcd 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -20,6 +20,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/sched.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_data/elm.h>
 
@@ -385,6 +386,23 @@ static int elm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int elm_suspend(struct device *dev)
+{
+	pm_runtime_put_sync(dev);
+	return 0;
+}
+
+static int elm_resume(struct device *dev)
+{
+	struct elm_info *info = dev_get_drvdata(dev);
+
+	pm_runtime_get_sync(dev);
+	elm_config(dev, info->bch_type);
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(elm_pm_ops, elm_suspend, elm_resume);
+
 #ifdef CONFIG_OF
 static const struct of_device_id elm_of_match[] = {
 	{ .compatible = "ti,am3352-elm" },
@@ -398,6 +416,7 @@ static struct platform_driver elm_driver = {
 		.name	= "elm",
 		.owner	= THIS_MODULE,
 		.of_match_table = of_match_ptr(elm_of_match),
+		.pm	= &elm_pm_ops,
 	},
 	.probe	= elm_probe,
 	.remove	= elm_remove,
-- 
1.8.1

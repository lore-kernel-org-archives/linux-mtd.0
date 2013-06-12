Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Umidr-0002NA-6z
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2013 10:51:04 +0000
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
 by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5CAoe2h010143
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jun 2013 05:50:40 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
 by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5CAocqc009756
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jun 2013 05:50:38 -0500
From: Pekon Gupta <pekon@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 2/3] arm: gpmc: Low power transition support
Date: Wed, 12 Jun 2013 16:20:34 +0530
Message-ID: <1371034235-18720-2-git-send-email-pekon@ti.com>
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

With GPMC converted to platform driver recently, adds low power
transition support in driver itself.

Signed-off-by: Philip Avinash <avinashphilip@ti.com>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 arch/arm/mach-omap2/gpmc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
index 1380cee..b5c4752 100644
--- a/arch/arm/mach-omap2/gpmc.c
+++ b/arch/arm/mach-omap2/gpmc.c
@@ -1655,6 +1655,24 @@ static int gpmc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int gpmc_suspend(struct device *dev)
+{
+	omap3_gpmc_save_context();
+	pm_runtime_put_sync(dev);
+	return 0;
+}
+
+static int gpmc_resume(struct device *dev)
+{
+	pm_runtime_get_sync(dev);
+	omap3_gpmc_restore_context();
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(gpmc_pm_ops, gpmc_suspend, gpmc_resume);
+
 static struct platform_driver gpmc_driver = {
 	.probe		= gpmc_probe,
 	.remove		= gpmc_remove,
@@ -1662,6 +1680,7 @@ static struct platform_driver gpmc_driver = {
 		.name	= DEVICE_NAME,
 		.owner	= THIS_MODULE,
 		.of_match_table = of_match_ptr(gpmc_dt_ids),
+		.pm	= &gpmc_pm_ops,
 	},
 };
 
-- 
1.8.1

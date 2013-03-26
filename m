Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UKNmE-0002z7-IC
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2013 06:54:35 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MK90062O9ROGGR0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 26 Mar 2013 15:54:23 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>
References: <000f01ce29ee$90692c10$b13b8430$%han@samsung.com>
In-reply-to: <000f01ce29ee$90692c10$b13b8430$%han@samsung.com>
Subject: [PATCH 3/3] mtd: spear_smi: add CONFIG_PM_SLEEP to suspend/resume
 functions
Date: Tue, 26 Mar 2013 15:54:22 +0900
Message-id: <001101ce29ee$bf191390$3d4b3ab0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add CONFIG_PM_SLEEP to suspend/resume functions to fix the following
build warning when CONFIG_PM_SLEEP is not selected. This is because
sleep PM callbacks defined by SIMPLE_DEV_PM_OPS are only used when
the CONFIG_PM_SLEEP is enabled. Also, unnecessary CONFIG_PM ifdefs
are removed

drivers/mtd/devices/spear_smi.c:1049:12: warning: 'spear_smi_suspend' defined but not used [-Wunused-function]
drivers/mtd/devices/spear_smi.c:1059:12: warning: 'spear_smi_resume' defined but not used [-Wunused-function]

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/devices/spear_smi.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 8a82b8b..0e1c22e 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -1045,7 +1045,7 @@ static int spear_smi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
+#ifdef CONFIG_PM_SLEEP
 static int spear_smi_suspend(struct device *dev)
 {
 	struct spear_smi *sdev = dev_get_drvdata(dev);
@@ -1068,9 +1068,9 @@ static int spear_smi_resume(struct device *dev)
 		spear_smi_hw_init(sdev);
 	return ret;
 }
+#endif
 
 static SIMPLE_DEV_PM_OPS(spear_smi_pm_ops, spear_smi_suspend, spear_smi_resume);
-#endif
 
 #ifdef CONFIG_OF
 static const struct of_device_id spear_smi_id_table[] = {
@@ -1086,9 +1086,7 @@ static struct platform_driver spear_smi_driver = {
 		.bus = &platform_bus_type,
 		.owner = THIS_MODULE,
 		.of_match_table = of_match_ptr(spear_smi_id_table),
-#ifdef CONFIG_PM
 		.pm = &spear_smi_pm_ops,
-#endif
 	},
 	.probe = spear_smi_probe,
 	.remove = spear_smi_remove,
-- 
1.7.2.5

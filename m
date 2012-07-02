Received: from eu1sys200aog117.obsmtp.com ([207.126.144.143])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SlZfj-00067S-3c
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2012 05:59:43 +0000
From: Shiraz Hashim <shiraz.hashim@st.com>
To: <dwmw2@infradead.org>, <viresh.linux@gmail.com>
Subject: [PATCH 1/3] mtd/spear_smi: Move suspend/resume to follow dev_pm_ops
Date: Mon, 2 Jul 2012 11:28:45 +0530
Message-ID: <1341208727-22476-1-git-send-email-shiraz.hashim@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: spear--sw-devel@lists.codex.cro.st.com, sr@denx.de,
 linux-mtd@lists.infradead.org, Viresh Kumar <viresh.kumar@st.com>,
 spear-devel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Viresh Kumar <viresh.kumar@st.com>

Use dev_pm_ops to support PM specific callbacks.

Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
---
 drivers/mtd/devices/spear_smi.c |   28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 6796036..cffd36a 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -26,6 +26,7 @@
 #include <linux/module.h>
 #include <linux/param.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/spear_smi.h>
@@ -1086,29 +1087,33 @@ static int __devexit spear_smi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-int spear_smi_suspend(struct platform_device *pdev, pm_message_t state)
+#ifdef CONFIG_PM
+static int spear_smi_suspend(struct device *dev)
 {
-	struct spear_smi *dev = platform_get_drvdata(pdev);
+	struct spear_smi *sdev = dev_get_drvdata(dev);
 
-	if (dev && dev->clk)
-		clk_disable_unprepare(dev->clk);
+	if (sdev && sdev->clk)
+		clk_disable_unprepare(sdev->clk);
 
 	return 0;
 }
 
-int spear_smi_resume(struct platform_device *pdev)
+static int spear_smi_resume(struct device *dev)
 {
-	struct spear_smi *dev = platform_get_drvdata(pdev);
+	struct spear_smi *sdev = dev_get_drvdata(dev);
 	int ret = -EPERM;
 
-	if (dev && dev->clk)
-		ret = clk_prepare_enable(dev->clk);
+	if (sdev && sdev->clk)
+		ret = clk_prepare_enable(sdev->clk);
 
 	if (!ret)
-		spear_smi_hw_init(dev);
+		spear_smi_hw_init(sdev);
 	return ret;
 }
 
+static SIMPLE_DEV_PM_OPS(spear_smi_pm_ops, spear_smi_suspend, spear_smi_resume);
+#endif
+
 #ifdef CONFIG_OF
 static const struct of_device_id spear_smi_id_table[] = {
 	{ .compatible = "st,spear600-smi" },
@@ -1123,11 +1128,12 @@ static struct platform_driver spear_smi_driver = {
 		.bus = &platform_bus_type,
 		.owner = THIS_MODULE,
 		.of_match_table = of_match_ptr(spear_smi_id_table),
+#ifdef CONFIG_PM
+		.pm = &spear_smi_pm_ops,
+#endif
 	},
 	.probe = spear_smi_probe,
 	.remove = __devexit_p(spear_smi_remove),
-	.suspend = spear_smi_suspend,
-	.resume = spear_smi_resume,
 };
 
 static int spear_smi_init(void)
-- 
1.7.10

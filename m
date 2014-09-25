Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXHbe-0002bM-4T
 for linux-mtd@lists.infradead.org; Thu, 25 Sep 2014 22:33:47 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v1 1/2] mtd: docg3: add device-tree support
Date: Fri, 26 Sep 2014 00:33:15 +0200
Message-Id: <1411684396-12094-1-git-send-email-robert.jarzmik@free.fr>
Cc: devicetree@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add device-tree support. This is straightforward as docg3 only uses the
standard IOMEM resources.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: devicetree@vger.kernel.org
---
 drivers/mtd/devices/docg3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 91a169c..fc05f81 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -22,6 +22,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/errno.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/slab.h>
@@ -2126,10 +2127,17 @@ static int __exit docg3_release(struct platform_device *pdev)
 	return 0;
 }
 
+static struct of_device_id docg3_dt_ids[] = {
+	{ .compatible = "sandisk,docg3" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, docg3_dt_ids);
+
 static struct platform_driver g3_driver = {
 	.driver		= {
 		.name	= "docg3",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(docg3_dt_ids),
 	},
 	.suspend	= docg3_suspend,
 	.resume		= docg3_resume,
-- 
2.0.0.rc2

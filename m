Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXxlz-0003f1-0K
 for linux-mtd@lists.infradead.org; Sat, 27 Sep 2014 19:35:15 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/2] mtd: docg3: add device-tree support
Date: Sat, 27 Sep 2014 21:34:29 +0200
Message-Id: <1411846470-30041-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
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
Cc: Mark Rutland <mark.rutland@arm.com>

---
Since v1: Mark's review: changed compatible string
---
 drivers/mtd/devices/docg3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 91a169c..e2e0713 100644
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
+	{ .compatible = "m-systems,diskonchip-g3" },
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
2.1.0

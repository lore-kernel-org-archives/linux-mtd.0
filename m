Received: from smtp-out-171.synserver.de ([212.40.185.171])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yf3q4-0002Aa-Dl
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2015 10:01:05 +0000
From: Lars-Peter Clausen <lars@metafoo.de>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: Switch to PM ops
Date: Mon,  6 Apr 2015 12:00:39 +0200
Message-Id: <1428314439-10853-1-git-send-email-lars@metafoo.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use dev_pm_ops instead of the legacy suspend/resume callbacks for the MTD
class suspend and resume operations.

While we are at it slightly reorder things to avoid the need for forward
declarations.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/mtd/mtdcore.c | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 11883bd..8e2399d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -47,14 +47,34 @@
 static struct backing_dev_info mtd_bdi = {
 };
 
-static int mtd_cls_suspend(struct device *dev, pm_message_t state);
-static int mtd_cls_resume(struct device *dev);
+#ifdef CONFIG_PM_SLEEP
+
+static int mtd_cls_suspend(struct device *dev)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	return mtd ? mtd_suspend(mtd) : 0;
+}
+
+static int mtd_cls_resume(struct device *dev)
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+
+	if (mtd)
+		mtd_resume(mtd);
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(mtd_cls_pm_ops, mtd_cls_suspend, mtd_cls_resume);
+#define MTD_CLS_PM_OPS (&mtd_cls_pm_ops)
+#else
+#define MTD_CLS_PM_OPS NULL
+#endif
 
 static struct class mtd_class = {
 	.name = "mtd",
 	.owner = THIS_MODULE,
-	.suspend = mtd_cls_suspend,
-	.resume = mtd_cls_resume,
+	.pm = MTD_CLS_PM_OPS,
 };
 
 static DEFINE_IDR(mtd_idr);
@@ -87,22 +107,6 @@ static void mtd_release(struct device *dev)
 	device_destroy(&mtd_class, index + 1);
 }
 
-static int mtd_cls_suspend(struct device *dev, pm_message_t state)
-{
-	struct mtd_info *mtd = dev_get_drvdata(dev);
-
-	return mtd ? mtd_suspend(mtd) : 0;
-}
-
-static int mtd_cls_resume(struct device *dev)
-{
-	struct mtd_info *mtd = dev_get_drvdata(dev);
-
-	if (mtd)
-		mtd_resume(mtd);
-	return 0;
-}
-
 static ssize_t mtd_type_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-- 
1.8.0

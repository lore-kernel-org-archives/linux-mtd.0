Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xgzdh-0000mj-87
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 17:24:01 +0000
Received: by mail-pa0-f48.google.com with SMTP id ey11so2107522pad.35
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 10:23:39 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: docg3: fix 'defined but not used' warning
Date: Wed, 22 Oct 2014 10:23:26 -0700
Message-Id: <1413998606-9589-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

   drivers/mtd/devices/docg3.c:2122:28: warning: 'docg3_dt_ids' defined but not used [-Wunused-variable]
    static struct of_device_id docg3_dt_ids[] = {

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index abd94668a05d..0d9d3ee68b61 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2119,11 +2119,13 @@ static int __exit docg3_release(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
 static struct of_device_id docg3_dt_ids[] = {
 	{ .compatible = "m-systems,diskonchip-g3" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, docg3_dt_ids);
+#endif
 
 static struct platform_driver g3_driver = {
 	.driver		= {
-- 
1.9.1

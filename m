Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GQVuc-0001LJ-Hq
	for linux-mtd@lists.infradead.org; Thu, 21 Sep 2006 17:17:01 -0400
Date: Thu, 21 Sep 2006 23:16:48 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] physmap: add power management support
Message-ID: <20060921211648.GA30338@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: David Anders <dave123_aml@yahoo.com>,
	Steven Scholz <steven.scholz@imc-berlin.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implement PM handling for physmap.  Idea from Steven Scholz, patch
by David Anders.

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>

Index: linux-2.6.18/drivers/mtd/maps/physmap.c
===================================================================
--- linux-2.6.18.orig/drivers/mtd/maps/physmap.c
+++ linux-2.6.18/drivers/mtd/maps/physmap.c
@@ -158,9 +158,44 @@ err_out:
 	return err;
 }
 
+#ifdef CONFIG_PM
+static int physmap_flash_suspend(struct platform_device *dev, pm_message_t state)
+{
+	struct physmap_flash_info *info = platform_get_drvdata(dev);
+	int ret = 0;
+
+	if (info)
+		ret = info->mtd->suspend(info->mtd);
+
+	return ret;
+}
+
+static int physmap_flash_resume(struct platform_device *dev)
+{
+	struct physmap_flash_info *info = platform_get_drvdata(dev);
+	if (info)
+		info->mtd->resume(info->mtd);
+	return 0;
+}
+
+static void physmap_flash_shutdown(struct platform_device *dev)
+{
+	struct physmap_flash_info *info = platform_get_drvdata(dev);
+	if (info && info->mtd->suspend(info->mtd) == 0)
+		info->mtd->resume(info->mtd);
+}
+#else
+#define physmap_flash_suspend NULL
+#define physmap_flash_resume  NULL
+#define physmap_flash_shutdown NULL
+#endif
+
 static struct platform_driver physmap_flash_driver = {
 	.probe		= physmap_flash_probe,
 	.remove		= physmap_flash_remove,
+	.suspend	= physmap_flash_suspend,
+	.resume		= physmap_flash_resume,
+	.shutdown	= physmap_flash_shutdown,
 	.driver		= {
 		.name	= "physmap-flash",
 	},

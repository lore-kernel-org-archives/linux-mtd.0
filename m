Received: from smtp119.sbc.mail.sp1.yahoo.com ([69.147.64.92])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jix1q-0007B2-7g
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 19:29:18 +0000
Date: Mon, 07 Apr 2008 12:29:23 -0700
From: David Brownell <david-b@pacbell.net>
To: linux-mtd@lists.infradead.org
Subject: [patch 2.6.25-rc8] omap_nor section fixes
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <20080407192923.807E7235001@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Minor tweaks to omap_nor ... as with most platform drivers, its probe
and remove logic can (and should!) safely vanish in most configs.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>

--- a/drivers/mtd/maps/omap_nor.c
+++ b/drivers/mtd/maps/omap_nor.c
@@ -70,7 +70,7 @@ static void omap_set_vpp(struct map_info *map, int enable)
 	}
 }
 
-static int __devinit omapflash_probe(struct platform_device *pdev)
+static int __init omapflash_probe(struct platform_device *pdev)
 {
 	int err;
 	struct omapflash_info *info;
@@ -130,7 +130,7 @@ out_free_info:
 	return err;
 }
 
-static int __devexit omapflash_remove(struct platform_device *pdev)
+static int __exit omapflash_remove(struct platform_device *pdev)
 {
 	struct omapflash_info *info = platform_get_drvdata(pdev);
 
@@ -152,8 +152,7 @@ static int __devexit omapflash_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver omapflash_driver = {
-	.probe	= omapflash_probe,
-	.remove	= __devexit_p(omapflash_remove),
+	.remove	= __exit_p(omapflash_remove),
 	.driver = {
 		.name	= "omapflash",
 	},
@@ -161,7 +160,7 @@ static struct platform_driver omapflash_driver = {
 
 static int __init omapflash_init(void)
 {
-	return platform_driver_register(&omapflash_driver);
+	return platform_driver_probe(&omapflash_driver, omapflash_probe);
 }
 
 static void __exit omapflash_exit(void)

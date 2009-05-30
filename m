Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=teyla.home.fluff.org)
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MATEx-0002CP-Iy
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 18:25:14 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [MTD] [NAND] S3C2410: Move to using platform device table
Date: Sat, 30 May 2009 18:41:28 +0100
Message-Id: <1243705298-21814-2-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
Cc: Eric Miao <eric.miao@marvell.com>, Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 57fee4a58fe802272742caae248872c392a60670 added an
method to specify the platform device compatibility by using
an id-table instead of registering multiple drivers.

Move the S3C24XX NAND driver to using this ID table.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
CC: Eric Miao <eric.miao@marvell.com>
---
 drivers/mtd/nand/s3c2410.c |   78 ++++++++++++++-----------------------------
 1 files changed, 26 insertions(+), 52 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 8e375d5..b7f0740 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -593,7 +593,7 @@ static inline void s3c2410_nand_cpufreq_deregister(struct s3c2410_nand_info *inf
 
 /* device management functions */
 
-static int s3c2410_nand_remove(struct platform_device *pdev)
+static int s3c24xx_nand_remove(struct platform_device *pdev)
 {
 	struct s3c2410_nand_info *info = to_nand_info(pdev);
 
@@ -788,18 +788,17 @@ static void s3c2410_nand_update_chip(struct s3c2410_nand_info *info,
 	}
 }
 
-/* s3c2410_nand_probe
+/* s3c24xx_nand_probe
  *
  * called by device layer when it finds a device matching
  * one our driver can handled. This code checks to see if
  * it can allocate all necessary resources then calls the
  * nand layer to look for devices
 */
-
-static int s3c24xx_nand_probe(struct platform_device *pdev,
-			      enum s3c_cpu_type cpu_type)
+static int s3c24xx_nand_probe(struct platform_device *pdev)
 {
 	struct s3c2410_platform_nand *plat = to_nand_plat(pdev);
+	enum s3c_cpu_type cpu_type; 
 	struct s3c2410_nand_info *info;
 	struct s3c2410_nand_mtd *nmtd;
 	struct s3c2410_nand_set *sets;
@@ -809,6 +808,8 @@ static int s3c24xx_nand_probe(struct platform_device *pdev,
 	int nr_sets;
 	int setno;
 
+	cpu_type = platform_get_device_id(pdev)->driver_data;
+
 	pr_debug("s3c2410_nand_probe(%p)\n", pdev);
 
 	info = kmalloc(sizeof(*info), GFP_KERNEL);
@@ -922,7 +923,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev,
 	return 0;
 
  exit_error:
-	s3c2410_nand_remove(pdev);
+	s3c24xx_nand_remove(pdev);
 
 	if (err == 0)
 		err = -EINVAL;
@@ -983,50 +984,30 @@ static int s3c24xx_nand_resume(struct platform_device *dev)
 
 /* driver device registration */
 
-static int s3c2410_nand_probe(struct platform_device *dev)
-{
-	return s3c24xx_nand_probe(dev, TYPE_S3C2410);
-}
-
-static int s3c2440_nand_probe(struct platform_device *dev)
-{
-	return s3c24xx_nand_probe(dev, TYPE_S3C2440);
-}
-
-static int s3c2412_nand_probe(struct platform_device *dev)
-{
-	return s3c24xx_nand_probe(dev, TYPE_S3C2412);
-}
-
-static struct platform_driver s3c2410_nand_driver = {
-	.probe		= s3c2410_nand_probe,
-	.remove		= s3c2410_nand_remove,
-	.suspend	= s3c24xx_nand_suspend,
-	.resume		= s3c24xx_nand_resume,
-	.driver		= {
-		.name	= "s3c2410-nand",
-		.owner	= THIS_MODULE,
+static struct platform_device_id s3c24xx_driver_ids[] = {
+	{
+		.name		= "s3c2410-nand",
+		.driver_data	= TYPE_S3C2410,
+	}, {
+		.name		= "s3c2440-nand",
+		.driver_data	= TYPE_S3C2440,
+	}, {
+		.name		= "s3c2412-nand",
+		.driver_data	= TYPE_S3C2412,
 	},
+	{ }
 };
 
-static struct platform_driver s3c2440_nand_driver = {
-	.probe		= s3c2440_nand_probe,
-	.remove		= s3c2410_nand_remove,
-	.suspend	= s3c24xx_nand_suspend,
-	.resume		= s3c24xx_nand_resume,
-	.driver		= {
-		.name	= "s3c2440-nand",
-		.owner	= THIS_MODULE,
-	},
-};
+MODULE_DEVICE_TABLE(platform, s3c24xx_driver_ids);
 
-static struct platform_driver s3c2412_nand_driver = {
-	.probe		= s3c2412_nand_probe,
-	.remove		= s3c2410_nand_remove,
+static struct platform_driver s3c24xx_nand_driver = {
+	.probe		= s3c24xx_nand_probe,
+	.remove		= s3c24xx_nand_remove,
 	.suspend	= s3c24xx_nand_suspend,
 	.resume		= s3c24xx_nand_resume,
+	.id_table	= s3c24xx_driver_ids,
 	.driver		= {
-		.name	= "s3c2412-nand",
+		.name	= "s3c24xx-nand",
 		.owner	= THIS_MODULE,
 	},
 };
@@ -1035,16 +1016,12 @@ static int __init s3c2410_nand_init(void)
 {
 	printk("S3C24XX NAND Driver, (c) 2004 Simtec Electronics\n");
 
-	platform_driver_register(&s3c2412_nand_driver);
-	platform_driver_register(&s3c2440_nand_driver);
-	return platform_driver_register(&s3c2410_nand_driver);
+	return platform_driver_register(&s3c24xx_nand_driver);
 }
 
 static void __exit s3c2410_nand_exit(void)
 {
-	platform_driver_unregister(&s3c2412_nand_driver);
-	platform_driver_unregister(&s3c2440_nand_driver);
-	platform_driver_unregister(&s3c2410_nand_driver);
+	platform_driver_unregister(&s3c24xx_nand_driver);
 }
 
 module_init(s3c2410_nand_init);
@@ -1053,6 +1030,3 @@ module_exit(s3c2410_nand_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
 MODULE_DESCRIPTION("S3C24XX MTD NAND driver");
-MODULE_ALIAS("platform:s3c2410-nand");
-MODULE_ALIAS("platform:s3c2412-nand");
-MODULE_ALIAS("platform:s3c2440-nand");
-- 
1.5.6.5

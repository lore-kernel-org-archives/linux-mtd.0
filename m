Received: from fg-out-1718.google.com ([72.14.220.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqc3n-00049M-ST
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 23:15:16 +0000
Received: by fg-out-1718.google.com with SMTP id l26so165587fgb.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Oct 2008 16:15:15 -0700 (PDT)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/6] [MTD] sharpsl_nand: switch to driver model usage.
Date: Fri, 17 Oct 2008 03:15:04 +0400
Message-Id: <1224198909-17568-1-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <20081016231127.GA17131@doriath.ww600.siemens.net>
References: <20081016231127.GA17131@doriath.ww600.siemens.net>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Eric Miao <eric.miao@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Start cleanup of sharpsl_nand driver. Convert it to platform driver.
Corresponding device is temprorary registered in sharpsl.c but will be
later moved to corresponding board files.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/sharpsl.c |   63 +++++++++++++++++++++++++++++++++++++++-----
 1 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 30a518e..0a99188 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -20,12 +20,13 @@
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 #include <linux/interrupt.h>
+#include <linux/platform_device.h>
+
 #include <asm/io.h>
 #include <mach/hardware.h>
 #include <asm/mach-types.h>
 
 static void __iomem *sharpsl_io_base;
-static int sharpsl_phys_base = 0x0C000000;
 
 /* register offset */
 #define ECCLPLB	 	sharpsl_io_base+0x00	/* line parity 7 - 0 bit */
@@ -150,10 +151,11 @@ const char *part_probes[] = { "cmdlinepart", NULL };
 /*
  * Main initialization routine
  */
-static int __init sharpsl_nand_init(void)
+static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
 	struct mtd_partition *sharpsl_partition_info;
+	struct resource *r;
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
@@ -163,8 +165,15 @@ static int __init sharpsl_nand_init(void)
 		return -ENOMEM;
 	}
 
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r) {
+		dev_err(&pdev->dev, "no io memory resource defined!\n");
+		err = -ENODEV;
+		goto err_get_res;
+	}
+
 	/* map physical address */
-	sharpsl_io_base = ioremap(sharpsl_phys_base, 0x1000);
+	sharpsl_io_base = ioremap(r->start, resource_size(r));
 	if (!sharpsl_io_base) {
 		printk("ioremap to access Sharp SL NAND chip failed\n");
 		kfree(sharpsl_mtd);
@@ -242,14 +251,16 @@ static int __init sharpsl_nand_init(void)
 
 	/* Return happy */
 	return 0;
-}
 
-module_init(sharpsl_nand_init);
+err_get_res:
+	kfree(sharpsl_mtd);
+	return err;
+}
 
 /*
  * Clean up routine
  */
-static void __exit sharpsl_nand_cleanup(void)
+static int __devexit sharpsl_nand_remove(struct platform_device *pdev)
 {
 	/* Release resources, unregister device */
 	nand_release(sharpsl_mtd);
@@ -258,9 +269,47 @@ static void __exit sharpsl_nand_cleanup(void)
 
 	/* Free the MTD device structure */
 	kfree(sharpsl_mtd);
+
+	return 0;
+}
+
+static struct platform_driver sharpsl_nand_driver = {
+	.driver = {
+		.name	= "sharpsl-nand",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= sharpsl_nand_probe,
+	.remove		= __devexit_p(sharpsl_nand_remove),
+};
+
+static struct resource sharpsl_nand_resources[] = {
+	{
+		.start	= 0x0C000000,
+		.end	= 0x0C000FFF,
+		.flags	= IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device sharpsl_nand_device = {
+	.name		= "sharpsl-nand",
+	.id		= -1,
+	.resource	= sharpsl_nand_resources,
+	.num_resources	= ARRAY_SIZE(sharpsl_nand_resources),
+};
+
+static int __init sharpsl_nand_init(void)
+{
+	platform_device_register(&sharpsl_nand_device);
+	return platform_driver_register(&sharpsl_nand_driver);
 }
+module_init(sharpsl_nand_init);
 
-module_exit(sharpsl_nand_cleanup);
+static void __exit sharpsl_nand_exit(void)
+{
+	platform_driver_unregister(&sharpsl_nand_driver);
+	platform_device_unregister(&sharpsl_nand_device);
+}
+module_exit(sharpsl_nand_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Richard Purdie <rpurdie@rpsys.net>");
-- 
1.5.6.5

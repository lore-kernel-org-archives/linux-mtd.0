Received: from smtp110.sbc.mail.mud.yahoo.com ([68.142.198.209])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jl5v2-0007wR-Fz
	for linux-mtd@lists.infradead.org; Sun, 13 Apr 2008 17:23:09 +0000
From: David Brownell <david-b@pacbell.net>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-mtd@lists.infradead.org
Subject: [patch 2.6.25-rc9] mtd maps: fix platform driver hotplug/coldplug
Date: Sun, 13 Apr 2008 10:14:32 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200804131014.32835.david-b@pacbell.net>
Cc: kay.sievers@vrfy.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kay Sievers <kay.sievers@vrfy.org>

Since 43cc71eed1250755986da4c0f9898f9a635cb3bf, the platform
modalias is prefixed with "platform:". Add MODULE_ALIAS() to the
hotpluggable MTD mapping platform drivers, to re-enable auto loading.

NOTE oddness with physmap ... it's a legacy driver in some configs,
which means it can't always support hotplugging.  (Not that most
of these mapping drivers would often be used as modules...)

[ dbrownell@users.sourceforge.net: bugfix, more drivers, registration fixes ]
Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
 drivers/mtd/maps/bast-flash.c       |    1 +
 drivers/mtd/maps/integrator-flash.c |    2 ++
 drivers/mtd/maps/ixp2000.c          |    3 ++-
 drivers/mtd/maps/ixp4xx.c           |    2 ++
 drivers/mtd/maps/omap_nor.c         |    3 ++-
 drivers/mtd/maps/physmap.c          |    8 ++++++++
 drivers/mtd/maps/plat-ram.c         |    3 +++
 drivers/mtd/maps/sa1100-flash.c     |    2 ++
 8 files changed, 22 insertions(+), 2 deletions(-)

--- g26.orig/drivers/mtd/maps/bast-flash.c	2008-04-13 09:23:35.000000000 -0700
+++ g26/drivers/mtd/maps/bast-flash.c	2008-04-13 09:24:59.000000000 -0700
@@ -223,3 +223,4 @@ module_exit(bast_flash_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
 MODULE_DESCRIPTION("BAST MTD Map driver");
+MODULE_ALIAS("platform:bast-nor");
--- g26.orig/drivers/mtd/maps/integrator-flash.c	2008-04-13 09:23:35.000000000 -0700
+++ g26/drivers/mtd/maps/integrator-flash.c	2008-04-13 09:36:21.000000000 -0700
@@ -190,6 +190,7 @@ static struct platform_driver armflash_d
 	.remove		= armflash_remove,
 	.driver		= {
 		.name	= "armflash",
+		.owner	= THIS_MODULE,
 	},
 };
 
@@ -209,3 +210,4 @@ module_exit(armflash_exit);
 MODULE_AUTHOR("ARM Ltd");
 MODULE_DESCRIPTION("ARM Integrator CFI map driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:armflash");
--- g26.orig/drivers/mtd/maps/ixp2000.c	2008-04-13 09:23:35.000000000 -0700
+++ g26/drivers/mtd/maps/ixp2000.c	2008-04-13 09:36:36.000000000 -0700
@@ -253,6 +253,7 @@ static struct platform_driver ixp2000_fl
 	.remove		= ixp2000_flash_remove,
 	.driver		= {
 		.name	= "IXP2000-Flash",
+		.owner	= THIS_MODULE,
 	},
 };
 
@@ -270,4 +271,4 @@ module_init(ixp2000_flash_init);
 module_exit(ixp2000_flash_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Deepak Saxena <dsaxena@plexity.net>");
-
+MODULE_ALIAS("platform:IXP2000-Flash");
--- g26.orig/drivers/mtd/maps/ixp4xx.c	2008-04-13 09:23:35.000000000 -0700
+++ g26/drivers/mtd/maps/ixp4xx.c	2008-04-13 09:36:45.000000000 -0700
@@ -275,6 +275,7 @@ static struct platform_driver ixp4xx_fla
 	.remove		= ixp4xx_flash_remove,
 	.driver		= {
 		.name	= "IXP4XX-Flash",
+		.owner	= THIS_MODULE,
 	},
 };
 
@@ -295,3 +296,4 @@ module_exit(ixp4xx_flash_exit);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("MTD map driver for Intel IXP4xx systems");
 MODULE_AUTHOR("Deepak Saxena");
+MODULE_ALIAS("platform:IXP4XX-Flash");
--- g26.orig/drivers/mtd/maps/omap_nor.c	2008-04-13 09:23:35.000000000 -0700
+++ g26/drivers/mtd/maps/omap_nor.c	2008-04-13 09:36:50.000000000 -0700
@@ -155,6 +155,7 @@ static struct platform_driver omapflash_
 	.remove	= __exit_p(omapflash_remove),
 	.driver = {
 		.name	= "omapflash",
+		.owner	= THIS_MODULE,
 	},
 };
 
@@ -173,4 +174,4 @@ module_exit(omapflash_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("MTD NOR map driver for TI OMAP boards");
-
+MODULE_ALIAS("platform:omapflash");
--- g26.orig/drivers/mtd/maps/physmap.c	2008-04-13 09:23:35.000000000 -0700
+++ g26/drivers/mtd/maps/physmap.c	2008-04-13 09:39:35.000000000 -0700
@@ -242,6 +242,7 @@ static struct platform_driver physmap_fl
 	.shutdown	= physmap_flash_shutdown,
 	.driver		= {
 		.name	= "physmap-flash",
+		.owner	= THIS_MODULE,
 	},
 };
 
@@ -319,3 +320,10 @@ module_exit(physmap_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
 MODULE_DESCRIPTION("Generic configurable MTD map driver");
+
+/* legacy platform drivers can't hotplug or coldplg */
+#ifndef PHYSMAP_COMPAT
+/* work with hotplug and coldplug */
+MODULE_ALIAS("platform:physmap-flash");
+#endif
+
--- g26.orig/drivers/mtd/maps/plat-ram.c	2008-04-13 09:35:48.000000000 -0700
+++ g26/drivers/mtd/maps/plat-ram.c	2008-04-13 09:40:45.000000000 -0700
@@ -251,6 +251,9 @@ static int platram_probe(struct platform
 
 /* device driver info */
 
+/* work with hotplug and coldplug */
+MODULE_ALIAS("platform:mtd-ram");
+
 static struct platform_driver platram_driver = {
 	.probe		= platram_probe,
 	.remove		= platram_remove,
--- g26.orig/drivers/mtd/maps/sa1100-flash.c	2008-04-13 09:23:35.000000000 -0700
+++ g26/drivers/mtd/maps/sa1100-flash.c	2008-04-13 09:40:52.000000000 -0700
@@ -456,6 +456,7 @@ static struct platform_driver sa1100_mtd
 	.shutdown	= sa1100_mtd_shutdown,
 	.driver		= {
 		.name	= "flash",
+		.owner	= THIS_MODULE,
 	},
 };
 
@@ -475,3 +476,4 @@ module_exit(sa1100_mtd_exit);
 MODULE_AUTHOR("Nicolas Pitre");
 MODULE_DESCRIPTION("SA1100 CFI map driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:flash");

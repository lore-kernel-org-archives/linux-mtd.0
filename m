Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORN2-0002Tm-Ph
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:18 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:16 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/62] mtd/s3c2410: remove CONFIG_MTD_PARTITIONS test
Date: Mon, 23 May 2011 10:22:51 +0100
Message-Id: <1306142623-24952-11-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org,
	Ben Dooks <ben-linux@fluff.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD is now always build with partitioning support so this can be
removed.

Cc: Ben Dooks <ben-linux@fluff.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/arm/mach-s3c2410/mach-amlm5900.c   |    5 -----
 arch/arm/mach-s3c2410/mach-tct_hammer.c |    6 ------
 2 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-s3c2410/mach-amlm5900.c b/arch/arm/mach-s3c2410/mach-amlm5900.c
index 44440cb..dabc141 100644
--- a/arch/arm/mach-s3c2410/mach-amlm5900.c
+++ b/arch/arm/mach-s3c2410/mach-amlm5900.c
@@ -58,8 +58,6 @@
 #include <plat/cpu.h>
 #include <plat/gpio-cfg.h>
 
-#ifdef CONFIG_MTD_PARTITIONS
-
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/map.h>
@@ -113,7 +111,6 @@ static struct platform_device amlm5900_device_nor = {
 	.num_resources	= 1,
 	.resource	= &amlm5900_nor_resource,
 };
-#endif
 
 static struct map_desc amlm5900_iodesc[] __initdata = {
 };
@@ -158,9 +155,7 @@ static struct platform_device *amlm5900_devices[] __initdata = {
  	&s3c_device_rtc,
 	&s3c_device_usbgadget,
         &s3c_device_sdi,
-#ifdef CONFIG_MTD_PARTITIONS
 	&amlm5900_device_nor,
-#endif
 };
 
 static void __init amlm5900_map_io(void)
diff --git a/arch/arm/mach-s3c2410/mach-tct_hammer.c b/arch/arm/mach-s3c2410/mach-tct_hammer.c
index a15d062..43c2b83 100644
--- a/arch/arm/mach-s3c2410/mach-tct_hammer.c
+++ b/arch/arm/mach-s3c2410/mach-tct_hammer.c
@@ -49,8 +49,6 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 
-#ifdef CONFIG_MTD_PARTITIONS
-
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/map.h>
@@ -91,8 +89,6 @@ static struct platform_device tct_hammer_device_nor = {
 	.resource	= &tct_hammer_nor_resource,
 };
 
-#endif
-
 static struct map_desc tct_hammer_iodesc[] __initdata = {
 };
 
@@ -133,9 +129,7 @@ static struct platform_device *tct_hammer_devices[] __initdata = {
 	&s3c_device_rtc,
 	&s3c_device_usbgadget,
 	&s3c_device_sdi,
-#ifdef CONFIG_MTD_PARTITIONS
 	&tct_hammer_device_nor,
-#endif
 };
 
 static void __init tct_hammer_map_io(void)
-- 
1.7.4.4

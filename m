Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DoWES-0005vr-UI
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2005 20:51:46 -0400
Date: Fri, 1 Jul 2005 17:51:38 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: Todd Blumer <todd@sdgsystems.com>, Aric Blumer <aric@sdgsystems.com>
Message-ID: <20050702005138.GA7696@slurryseal.ddns.mvista.com>
References: <429FC658.7030206@sdgsystems.com> <42A102D2.5090108@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42A102D2.5090108@mvista.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD PM Resume
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 03, 2005 at 06:24:34PM -0700, Todd Poynor wrote:
...
> If you initiated the suspend via a call to pm_suspend() or 
> /sys/power/state then LDM suspend/resume driver methods will be called, 
> and it looks like nothing in the mtd core will automatically register 
> drivers or devices in LDM.  There are existing examples of registering 
> with LDM in some map drivers, registering a driver with the platform 
> bus.  Looks like boards that power cycle flash chips for certain sleep 
> states need to also register a device, and add suspend/resume callbacks 
> in the struct_driver that end up calling the chip driver suspend/resume 
> methods (even if they don't use flash that powers up locked, since the 
> mtd state machine needs to be reset to assume the flash chips are in 
> ready state).  Documentation/power/devices.txt has some more info on 
> those interfaces.
> 
> Or if anybody has a better way to handle this I'm all ears.  A class 
> device for generic mtd might do it, not sure.
> 
> You just reminded me I need to figure out how to do this for a couple of 
> boards, thanks.  If there's no disagreement on the above being the 
> correct approach I'll float a patch soon.

Here's an example of how it might be done via a board mapping driver,
for the PXA27x Mainstone board.  I'm not sure if this is the ultimate in
mtd + ldm + pm integration, but it's something.  Any comments appreciated.

Index: linux-2.6.12/arch/arm/mach-pxa/mainstone.c
===================================================================
--- linux-2.6.12.orig/arch/arm/mach-pxa/mainstone.c	2005-06-17 19:48:29.000000000 +0000
+++ linux-2.6.12/arch/arm/mach-pxa/mainstone.c	2005-07-02 00:33:23.000000000 +0000
@@ -189,6 +189,11 @@
 	.dev		= { .platform_data = &mst_audio_ops },
 };
 
+static struct platform_device mainstone_flash_device = {
+	.name		= "mainstone-flash",
+	.id		= -1,
+};
+
 static void mainstone_backlight_power(int on)
 {
 	if (on) {
@@ -304,6 +309,7 @@
 
 	platform_device_register(&smc91x_device);
 	platform_device_register(&mst_audio_device);
+	platform_device_register(&mainstone_flash_device);
 
 	/* reading Mainstone's "Virtual Configuration Register"
 	   might be handy to select LCD type here */
Index: linux-2.6.12/drivers/mtd/maps/mainstone-flash.c
===================================================================
--- linux-2.6.12.orig/drivers/mtd/maps/mainstone-flash.c	2005-07-01 22:22:30.000000000 +0000
+++ linux-2.6.12/drivers/mtd/maps/mainstone-flash.c	2005-07-02 00:35:56.000000000 +0000
@@ -15,6 +15,7 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
@@ -69,7 +70,8 @@
 
 static const char *probes[] = { "RedBoot", "cmdlinepart", NULL };
 
-static int __init init_mainstone(void)
+
+static int __init mainstone_flash_probe(struct device *_dev)
 {
 	int SW7 = 0;  /* FIXME: get from SCR (Mst doc section 3.2.1.1) */
 	int ret = 0, i;
@@ -147,10 +149,11 @@
 			add_mtd_device(mymtds[i]);
 		}
 	}
+
 	return 0;
 }
 
-static void __exit cleanup_mainstone(void)
+static int mainstone_flash_remove(struct device *_dev)
 {
 	int i;
 	for (i = 0; i < 2; i++) {
@@ -168,6 +171,59 @@
 			iounmap(mainstone_maps[i].cached);
 		kfree(parsed_parts[i]);
 	}
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+
+static int mainstone_flash_suspend(struct device *dev, u32 state, u32 level)
+{
+	int i;
+
+	if (level == SUSPEND_DISABLE) {
+		for (i = 0; i < 2; i++)
+			if (mymtds[i] && mymtds[i]->suspend)
+				mymtds[i]->suspend(mymtds[i]);
+	}
+
+	return 0;
+}
+
+static int mainstone_flash_resume(struct device *dev, u32 level)
+{
+	int i;
+
+	if (level == RESUME_ENABLE) {
+		for (i = 0; i < 2; i++)
+			if (mymtds[i] && mymtds[i]->resume)
+				mymtds[i]->resume(mymtds[i]);
+
+	}
+	return 0;
+}
+
+#endif
+
+static struct device_driver mainstone_flash_driver = {
+	.name		= "mainstone-flash",
+	.bus		= &platform_bus_type,
+	.probe		= &mainstone_flash_probe,
+	.remove		= &mainstone_flash_remove,
+#ifdef CONFIG_PM
+	.suspend	= &mainstone_flash_suspend,
+	.resume		= &mainstone_flash_resume,
+#endif
+};
+
+static int __init init_mainstone(void)
+{
+	return driver_register(&mainstone_flash_driver);
+}
+
+static void __exit cleanup_mainstone(void)
+{
+	driver_unregister(&mainstone_flash_driver);
 }
 
 module_init(init_mainstone);

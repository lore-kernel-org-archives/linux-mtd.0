Received: from ip10.savigear.adsl.uk.xo.com ([195.147.222.170] helo=xerp.secret.org.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vkQd-00008A-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2002 20:40:19 +0100
From: spse@secret.org.uk
To: mike@forestsidingsupply.com (Mike Mattice)
cc: linux-mtd@lists.infradead.org
Subject: Re: PATCH: ability to build blkmtd into the kernel and still use it 
In-Reply-To: Message from mike@forestsidingsupply.com (Mike Mattice)
   of "Thu, 11 Apr 2002 11:43:10 CDT." <20020411114310.A12149@ns2.forestsidingsupply.com>
References: <20020411114310.A12149@ns2.forestsidingsupply.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 11 Apr 2002 20:39:43 +0100
Message-Id: <E16vkQ4-0005zG-00@spoinky.renegade.org.uk>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

The blkmtd.c in 2.4.18 should already have the code in it to take a kernel
argument (blkmtd_device).

The reason you cant use /dev/discs/... is because you may not have a root fs
at the time the module is initialised in the kernel (esp if you are
using the device as the root device). Therefore the only names allowed
are those sepecified in init/main.c (ie you have to use the non devfs name)
When compiled and built into the kernel it uses name_to_kdev_t to get the
major/minor.


cheers
si

>Basically all this does is point the *device to a bootdevice
>var that's initialized by passing the kernel 'blkmtd=<non devfs device>'.
>I have no idea why giving it arguments like /dev/discs/disc0/disc doesn't
>work with devfs compiled in, but apparantly support is just not set
>up by that time.  
>
>I'd ultimately like to be able to set blkmtd devices up at build time,
>but my current project has enough room on the ide-emulated flash to 
>fit a stripped down lilo on it so it doesn't matter much now.
>
>
>diff -rNubBw linux-2.4.18.orig/drivers/mtd/devices/blkmtd.c linux-2.4.18.mtdde
>vel/drivers/mtd/devices/blkmtd.c
>--- linux-2.4.18.orig/drivers/mtd/devices/blkmtd.c	Tue Apr  9 11:08:22 200
>2
>+++ linux-2.4.18.mtddevel/drivers/mtd/devices/blkmtd.c	Thu Apr 11 11:26:31 200
>2
>@@ -4,6 +4,7 @@
>  * blkmtd.c - use a block device as a fake MTD
>  *
>  * Author: Simon Evans <spse@secret.org.uk>
>+ * Modified: Michael Mattice <mike@mattice.org>
>  *
>  * Copyright (C) 2001 Simon Evans
>  * 
>@@ -53,6 +54,7 @@
> #include <linux/pagemap.h>
> #include <linux/mtd/compatmac.h>
> #include <linux/mtd/mtd.h>
>+#include <linux/ctype.h>
> 
> #ifdef CONFIG_MTD_DEBUG
> #ifdef CONFIG_PROC_FS
>@@ -130,6 +132,8 @@
> int bs;          /* optionally force the block size (avoid using) */
> int count;       /* optionally force the block count (avoid using) */
> int wqs;         /* optionally set the write queue size */
>+char bootdevice[64];	/* boot device option */
>+int bootdevset = 0;	/* flag for above */
> 
> 
> #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
>@@ -1073,9 +1077,13 @@
> 
>   /* Check args */
>   if(device == 0) {
>+    if (bootdevset) {
>+      device = &bootdevice;
>+    } else {
>     printk("blkmtd: error, missing `device' name\n");
>     return -EINVAL;
>   }
>+  }
> 
>   if(ro)
>     readonly = 1;
>@@ -1312,6 +1320,26 @@
>     __free_pages(erase_page, 0);
>   return err;
> }
>+
>+static int __init blkmtd_setup(char *line)
>+{
>+        int i;
>+        char ch;
>+
>+	bootdevset = 1;
>+        memset (bootdevice, 0, sizeof bootdevice);
>+        for (i = 0; i < sizeof bootdevice - 1; ++i)
>+        {
>+            ch = line[i];
>+            if ( isspace (ch) || (ch == ',') || (ch == '\0') ) break;  
>+	    // don't have to worry about setting the last char to \0, 
>+	    // because the memset has taken care of that for us.
>+            bootdevice[i] = ch;
>+        }
>+        return 1;
>+}
>+
>+__setup("blkmtd=", blkmtd_setup);
> 
> module_init(init_blkmtd);
> module_exit(cleanup_blkmtd);
>

Received: from wsip68-15-115-9.ok.ok.cox.net ([68.15.115.9] helo=mail.forestsidingsupply.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vhfO-0008Pw-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2002 17:43:22 +0100
Date: Thu, 11 Apr 2002 11:43:10 -0500
To: linux-mtd@lists.infradead.org
Cc: Simon Evans <spse@secret.org.uk>
Subject: PATCH: ability to build blkmtd into the kernel and still use it
Message-ID: <20020411114310.A12149@ns2.forestsidingsupply.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: mike@forestsidingsupply.com (Mike Mattice)
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

Basically all this does is point the *device to a bootdevice
var that's initialized by passing the kernel 'blkmtd=<non devfs device>'.
I have no idea why giving it arguments like /dev/discs/disc0/disc doesn't
work with devfs compiled in, but apparantly support is just not set
up by that time.  

I'd ultimately like to be able to set blkmtd devices up at build time,
but my current project has enough room on the ide-emulated flash to 
fit a stripped down lilo on it so it doesn't matter much now.


diff -rNubBw linux-2.4.18.orig/drivers/mtd/devices/blkmtd.c linux-2.4.18.mtddevel/drivers/mtd/devices/blkmtd.c
--- linux-2.4.18.orig/drivers/mtd/devices/blkmtd.c	Tue Apr  9 11:08:22 2002
+++ linux-2.4.18.mtddevel/drivers/mtd/devices/blkmtd.c	Thu Apr 11 11:26:31 2002
@@ -4,6 +4,7 @@
  * blkmtd.c - use a block device as a fake MTD
  *
  * Author: Simon Evans <spse@secret.org.uk>
+ * Modified: Michael Mattice <mike@mattice.org>
  *
  * Copyright (C) 2001 Simon Evans
  * 
@@ -53,6 +54,7 @@
 #include <linux/pagemap.h>
 #include <linux/mtd/compatmac.h>
 #include <linux/mtd/mtd.h>
+#include <linux/ctype.h>
 
 #ifdef CONFIG_MTD_DEBUG
 #ifdef CONFIG_PROC_FS
@@ -130,6 +132,8 @@
 int bs;          /* optionally force the block size (avoid using) */
 int count;       /* optionally force the block count (avoid using) */
 int wqs;         /* optionally set the write queue size */
+char bootdevice[64];	/* boot device option */
+int bootdevset = 0;	/* flag for above */
 
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
@@ -1073,9 +1077,13 @@
 
   /* Check args */
   if(device == 0) {
+    if (bootdevset) {
+      device = &bootdevice;
+    } else {
     printk("blkmtd: error, missing `device' name\n");
     return -EINVAL;
   }
+  }
 
   if(ro)
     readonly = 1;
@@ -1312,6 +1320,26 @@
     __free_pages(erase_page, 0);
   return err;
 }
+
+static int __init blkmtd_setup(char *line)
+{
+        int i;
+        char ch;
+
+	bootdevset = 1;
+        memset (bootdevice, 0, sizeof bootdevice);
+        for (i = 0; i < sizeof bootdevice - 1; ++i)
+        {
+            ch = line[i];
+            if ( isspace (ch) || (ch == ',') || (ch == '\0') ) break;  
+	    // don't have to worry about setting the last char to \0, 
+	    // because the memset has taken care of that for us.
+            bootdevice[i] = ch;
+        }
+        return 1;
+}
+
+__setup("blkmtd=", blkmtd_setup);
 
 module_init(init_blkmtd);
 module_exit(cleanup_blkmtd);

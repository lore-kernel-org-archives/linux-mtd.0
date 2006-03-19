Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FL6QS-00027c-9B
	for linux-mtd@lists.infradead.org; Sun, 19 Mar 2006 17:31:06 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1FL6QE-0001KV-JD
	for linux-mtd@lists.infradead.org; Sun, 19 Mar 2006 23:30:50 +0100
Received: from ool-4355be81.dyn.optonline.net ([67.85.190.129])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 19 Mar 2006 23:30:50 +0100
Received: from micah by ool-4355be81.dyn.optonline.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 19 Mar 2006 23:30:50 +0100
To: linux-mtd@lists.infradead.org
From: Micah Anderson <micah@riseup.net>
Date: Sun, 19 Mar 2006 18:28:39 +0000 (UTC)
Message-ID: <slrne1r8ne.u13.micah@pond.riseup.net>
Sender: news <news@sea.gmane.org>
Subject: local redeclaration of name_to_dev_t in drivers/mtd/devices/blkmtd.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is a local redeclaration of name_to_dev_t in
drivers/mtd/devices/blkmtd.c:617 which is inconsistant with the
function in mount.h.

The way to fix this would be to remove the declaration and include the
mount.h as the attached patch does.

Note: this issue appears in 2.6.15 (and likely 2.6.16) and should be
fixed there as well.

Thanks,
Micah

--- drivers/mtd/devices/blkmtd.c	2006-01-02 22:21:10.000000000 -0500
+++ /usr/src/linux-source-2.6.15/drivers/mtd/devices/blkmtd.c	2006-03-17 19:03:21.000000000 -0500
@@ -29,6 +29,7 @@
 #include <linux/list.h>
 #include <linux/init.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mount.h>
 
 
 #define err(format, arg...) printk(KERN_ERR "blkmtd: " format "\n" , ## arg)
@@ -614,8 +615,6 @@
 }
 
 
-extern dev_t __init name_to_dev_t(const char *line);
-
 static struct blkmtd_dev *add_device(char *devname, int readonly, int erase_size)
 {
 	struct block_device *bdev;

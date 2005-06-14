Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Di09O-0001i7-N7
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2005 21:23:38 -0400
Received: from slurryseal.ddns.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id SAA09994
	for <linux-mtd@lists.infradead.org>; Mon, 13 Jun 2005 18:23:31 -0700
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8) with ESMTP id
	j5E1NV1n009121
	for <linux-mtd@lists.infradead.org>; Mon, 13 Jun 2005 18:23:31 -0700
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8/Submit) id j5E1NV23009119
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2005 18:23:31 -0700
Date: Mon, 13 Jun 2005 18:23:30 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050614012330.GA9112@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: mtdchar device nodes via udev
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From Paolo Galtieri, a patch to convert the soon-to-be-history DEVFS
dynamic device nodes for mtdchar to the udev method (mtdblock is already
handled by the disk subsystem).  Any comments?  Thanks -- Todd

Index: linux-mtd/drivers/mtd/mtdchar.c
===================================================================
--- linux-mtd.orig/drivers/mtd/mtdchar.c	2005-06-14 00:21:40.000000000 +0000
+++ linux-mtd/drivers/mtd/mtdchar.c	2005-06-14 00:45:16.000000000 +0000
@@ -15,27 +15,30 @@
 #include <linux/fs.h>
 #include <asm/uaccess.h>
 
-#ifdef CONFIG_DEVFS_FS
-#include <linux/devfs_fs_kernel.h>
+#include <linux/device.h>
+
+static struct class_simple *mtd_class;
 
 static void mtd_notify_add(struct mtd_info* mtd)
 {
 	if (!mtd)
 		return;
 
-	devfs_mk_cdev(MKDEV(MTD_CHAR_MAJOR, mtd->index*2),
-		      S_IFCHR | S_IRUGO | S_IWUGO, "mtd/%d", mtd->index);
-		
-	devfs_mk_cdev(MKDEV(MTD_CHAR_MAJOR, mtd->index*2+1),
-		      S_IFCHR | S_IRUGO, "mtd/%dro", mtd->index);
+	class_simple_device_add(mtd_class, MKDEV(MTD_CHAR_MAJOR, mtd->index*2),
+				NULL, "mtd%d", mtd->index);
+
+	class_simple_device_add(mtd_class, 
+				MKDEV(MTD_CHAR_MAJOR, mtd->index*2+1),
+				NULL, "mtd%dro", mtd->index);
 }
 
 static void mtd_notify_remove(struct mtd_info* mtd)
 {
 	if (!mtd)
 		return;
-	devfs_remove("mtd/%d", mtd->index);
-	devfs_remove("mtd/%dro", mtd->index);
+
+	class_simple_device_remove(MKDEV(MTD_CHAR_MAJOR, mtd->index*2));
+	class_simple_device_remove(MKDEV(MTD_CHAR_MAJOR, mtd->index*2+1));
 }
 
 static struct mtd_notifier notifier = {
@@ -43,22 +46,6 @@
 	.remove	= mtd_notify_remove,
 };
 
-static inline void mtdchar_devfs_init(void)
-{
-	devfs_mk_dir("mtd");
-	register_mtd_user(&notifier);
-}
-
-static inline void mtdchar_devfs_exit(void)
-{
-	unregister_mtd_user(&notifier);
-	devfs_remove("mtd");
-}
-#else /* !DEVFS */
-#define mtdchar_devfs_init() do { } while(0)
-#define mtdchar_devfs_exit() do { } while(0)
-#endif
-
 /*
  * We use file->private_data to store a pointer to the MTDdevice.
  * Since alighment is at least 32 bits, we have 2 bits free for OTP
@@ -657,13 +644,22 @@
 		return -EAGAIN;
 	}
 
-	mtdchar_devfs_init();
+	mtd_class = class_simple_create(THIS_MODULE, "mtd");
+
+	if (IS_ERR(mtd_class)) {
+		printk(KERN_ERR "Error creating mtd class.\n");
+		unregister_chrdev(MTD_CHAR_MAJOR, "mtd");
+		return 1;
+	}
+
+	register_mtd_user(&notifier);
 	return 0;
 }
 
 static void __exit cleanup_mtdchar(void)
 {
-	mtdchar_devfs_exit();
+	unregister_mtd_user(&notifier);
+	class_simple_destroy(mtd_class);
 	unregister_chrdev(MTD_CHAR_MAJOR, "mtd");
 }
 

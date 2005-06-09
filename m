Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DgNpZ-0002ZA-SS
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2005 10:16:27 -0400
Received: from playin.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id HAA03239
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2005 07:16:20 -0700
From: Paolo Galtieri <pgaltieri@mvista.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-rrjqQpLHQEtVpj4ZACyo"
Message-Id: <1118327333.2401.42.camel@playin.mvista.com>
Mime-Version: 1.0
Subject: patch to create sysfs char device nodes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Thu, 09 Jun 2005 14:16:27 -0000



--=-rrjqQpLHQEtVpj4ZACyo
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,
  with DEVFS going away I discovered that no character device nodes are
created if a flash device is present which contains filesystems. The
mtd-utils package requires the existence of character device nodes for
performing erase, lock and unlock functions.  The problem is that the
flash device driver has not been modified to use sysfs instead of devfs.

I have attached a patch to mtdchar.c which uses the sysfs interface to
create the appropriate nodes.  Please let me know if you have comments.

The changes are for linux-2.6.12-rc5

Thanks
Paolo

--=-rrjqQpLHQEtVpj4ZACyo
Content-Disposition: attachment; filename=MTDCnew
Content-Type: text/plain; name=MTDCnew; charset=UTF-8
Content-Transfer-Encoding: 7bit

--- drivers/mtd/OLDmtdchar.c	2005-06-06 16:10:39.000000000 -0700
+++ drivers/mtd/mtdchar.c	2005-06-06 16:18:39.000000000 -0700
@@ -15,27 +15,29 @@
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
+		NULL, "mtd%d", mtd->index);
+
+	class_simple_device_add(mtd_class, MKDEV(MTD_CHAR_MAJOR, mtd->index*2+1),
+		NULL, "mtd%dro", mtd->index);
+
 }
 
 static void mtd_notify_remove(struct mtd_info* mtd)
 {
 	if (!mtd)
 		return;
-	devfs_remove("mtd/%d", mtd->index);
-	devfs_remove("mtd/%dro", mtd->index);
+	class_simple_device_remove(MKDEV(MTD_CHAR_MAJOR, mtd->index*2));
+	class_simple_device_remove(MKDEV(MTD_CHAR_MAJOR, mtd->index*2+1));
 }
 
 static struct mtd_notifier notifier = {
@@ -45,19 +47,13 @@
 
 static inline void mtdchar_devfs_init(void)
 {
-	devfs_mk_dir("mtd");
 	register_mtd_user(&notifier);
 }
 
 static inline void mtdchar_devfs_exit(void)
 {
 	unregister_mtd_user(&notifier);
-	devfs_remove("mtd");
 }
-#else /* !DEVFS */
-#define mtdchar_devfs_init() do { } while(0)
-#define mtdchar_devfs_exit() do { } while(0)
-#endif
 
 static loff_t mtd_lseek (struct file *file, loff_t offset, int orig)
 {
@@ -543,6 +539,14 @@
 		return -EAGAIN;
 	}
 
+	mtd_class = class_simple_create(THIS_MODULE, "mtd");
+
+	if (IS_ERR(mtd_class)) {
+		printk(KERN_ERR "Error creating mtd class.\n");
+		unregister_chrdev(MTD_CHAR_MAJOR, "mtd");
+		return 1;
+	}
+
 	mtdchar_devfs_init();
 	return 0;
 }
@@ -550,6 +554,7 @@
 static void __exit cleanup_mtdchar(void)
 {
 	mtdchar_devfs_exit();
+	class_simple_destroy(mtd_class);
 	unregister_chrdev(MTD_CHAR_MAJOR, "mtd");
 }
 

--=-rrjqQpLHQEtVpj4ZACyo--

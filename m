Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zon3-0004cL-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2002 02:40:33 +0100
Received: from fencepost.gnu.org ([199.232.76.164])
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 17zon0-0002jc-00
	for linux-mtd@lists.infradead.org; Fri, 11 Oct 2002 02:40:31 +0100
Received: from proski by fencepost.gnu.org with local (Exim 4.10)
	id 17zomv-0000T4-00
	for mtd@infradead.org; Thu, 10 Oct 2002 21:40:25 -0400
Date: Thu, 10 Oct 2002 21:40:24 -0400 (EDT)
From: Pavel Roskin <proski@gnu.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] devfs support for read-only MTD block driver
Message-ID: <Pine.LNX.4.44.0210102118130.9952-100000@marabou.research.att.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hello!

If I enable devfs and CONFIG_MTD_BLOCK_RO, but not CONFIG_MTD_BLOCK, I
don't have /dev/mtdblock/ directory.  I tested this with 2.4.17 kernel on
an embedded i386 system, but I don't see this being fixed in either
2.4.20-pre10 or 2.5.41.

I don't really know much about MTD drivers, so please be careful with my
patch, although it works for me.

The idea of my patch is to copy the devfs code from the read-write block
driver.  I'm assuming that both drivers cannot coexist in the running
kernel, but please correct me if I'm wrong.

I renamed devfs_rw_handle to devfs_ro_handle.  Not sure if it makes sense, 
but it's just a name of a static variable.

The patch was tested with Linux 2.4.17, but this version has been
readjusted for 2.5.41 for your convenience.  Note that the read-write
driver in Linux 2.4.x uses register_blkdev() or devfs_register_blkdev()
dependent on whether devfs is enabled, so the same precaution should
probably be taken when backporting the patch to 2.4.x kernels.

======================================
--- linux.orig/drivers/mtd/mtdblock_ro.c
+++ linux/drivers/mtd/mtdblock_ro.c
@@ -22,6 +22,19 @@
 #define DEVICE_NR(device) (device)
 #include <linux/blk.h>
 
+#ifdef CONFIG_DEVFS_FS
+#include <linux/devfs_fs_kernel.h>
+static void mtd_notify_add(struct mtd_info* mtd);
+static void mtd_notify_remove(struct mtd_info* mtd);
+static struct mtd_notifier notifier = {
+        mtd_notify_add,
+        mtd_notify_remove,
+        NULL
+};
+static devfs_handle_t devfs_dir_handle = NULL;
+static devfs_handle_t devfs_ro_handle[MAX_MTD_DEVICES];
+#endif
+
 #define RQFUNC_ARG request_queue_t *q
 
 #ifdef MTDBLOCK_DEBUG
@@ -216,6 +229,33 @@ static struct block_device_operations mt
 	.ioctl		= mtdblock_ioctl
 };
 
+#ifdef CONFIG_DEVFS_FS
+/* Notification that a new device has been added. Create the devfs entry for
+ * it. This code is only used if the read-write driver doesn't do it for us. */
+
+static void mtd_notify_add(struct mtd_info* mtd)
+{
+        char name[8];
+
+        if (!mtd || mtd->type == MTD_ABSENT)
+                return;
+
+        sprintf(name, "%d", mtd->index);
+        devfs_ro_handle[mtd->index] = devfs_register(devfs_dir_handle, name,
+                        DEVFS_FL_DEFAULT, MTD_BLOCK_MAJOR, mtd->index,
+                        S_IFBLK | S_IRUGO | S_IWUGO,
+                        &mtd_fops, NULL);
+}
+
+static void mtd_notify_remove(struct mtd_info* mtd)
+{
+        if (!mtd || mtd->type == MTD_ABSENT)
+                return;
+
+        devfs_unregister(devfs_ro_handle[mtd->index]);
+}
+#endif
+
 int __init init_mtdblock(void)
 {
 	int err = -ENOMEM;
@@ -238,6 +278,10 @@ int __init init_mtdblock(void)
 		err = -EAGAIN;
 		goto out;
 	}
+#ifdef CONFIG_DEVFS_FS
+	devfs_dir_handle = devfs_mk_dir(NULL, DEVICE_NAME, NULL);
+	register_mtd_user(&notifier);
+#endif
 
 	blk_init_queue(BLK_DEFAULT_QUEUE(MAJOR_NR), &mtdblock_request);
 	return 0;
@@ -250,6 +294,10 @@ out:
 static void __exit cleanup_mtdblock(void)
 {
 	int i;
+#ifdef CONFIG_DEVFS_FS
+	unregister_mtd_user(&notifier);
+	devfs_unregister(devfs_dir_handle);
+#endif
 	unregister_blkdev(MAJOR_NR,DEVICE_NAME);
 	blk_cleanup_queue(BLK_DEFAULT_QUEUE(MAJOR_NR));
 	for (i = 0; i < MAX_MTD_DEVICES; i++)
======================================

-- 
Regards,
Pavel Roskin

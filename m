Received: from mail.timesys.com ([65.117.135.102] helo=exchange.timesys.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMTwN-00049w-4F
	for <linux-mtd@lists.infradead.org>; Wed, 19 Nov 2003 15:08:23 +0000
Date: Wed, 19 Nov 2003 10:06:45 -0500
From: John Whitney <john.whitney@timesys.com>
To: <linux-mtd@lists.infradead.org>
Message-ID: <BBE0F135.26DA%john.whitney@timesys.com>
Mime-version: 1.0
Content-type: text/plain; charset="US-ASCII"
Content-transfer-encoding: 7bit
Subject: Suggested patch for mtdchar.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've checked out the latest MTD source, and when I added it to my 2.6.0-pre9
LinuxPPC kernel tree, encountered devfs issues with mtdchar.c.  Listed below
is a patch created from my updated file.  Sorry if something about this has
been posted before, but I didn't find any mention of it in the archives.

--- mtdchar.c.orig    2003-11-19 10:00:54.000000000 -0500
+++ mtdchar.c    2003-11-18 09:37:16.000000000 -0500
@@ -24,10 +24,6 @@
     .add    = mtd_notify_add,
     .remove    = mtd_notify_remove,
 };
-
-static devfs_handle_t devfs_dir_handle;
-static devfs_handle_t devfs_rw_handle[MAX_MTD_DEVICES];
-static devfs_handle_t devfs_ro_handle[MAX_MTD_DEVICES];
 #endif
 
 static loff_t mtd_lseek (struct file *file, loff_t offset, int orig)
@@ -477,22 +473,15 @@
 
 static void mtd_notify_add(struct mtd_info* mtd)
 {
-    char name[8];
-
     if (!mtd)
         return;
 
-    sprintf(name, "%d", mtd->index);
-    devfs_rw_handle[mtd->index] = devfs_register(devfs_dir_handle, name,
-            DEVFS_FL_DEFAULT, MTD_CHAR_MAJOR, mtd->index*2,
-            S_IFCHR | S_IRUGO | S_IWUGO,
-            &mtd_fops, NULL);
-
-    sprintf(name, "%dro", mtd->index);
-    devfs_ro_handle[mtd->index] = devfs_register(devfs_dir_handle, name,
-            DEVFS_FL_DEFAULT, MTD_CHAR_MAJOR, mtd->index*2+1,
-            S_IFCHR | S_IRUGO,
-            &mtd_fops, NULL);
+    devfs_mk_cdev (MKDEV(MTD_CHAR_MAJOR, mtd->index*2),
+                   S_IFCHR | S_IRUGO | S_IWUGO,
+                   "mtd/%d", mtd->index);
+    devfs_mk_cdev (MKDEV(MTD_CHAR_MAJOR, mtd->index*2+1),
+                   S_IFCHR | S_IRUGO | S_IWUGO,
+                   "mtd/%dro", mtd->index);
 }
 
 static void mtd_notify_remove(struct mtd_info* mtd)
@@ -500,8 +489,8 @@
     if (!mtd)
         return;
 
-    devfs_unregister(devfs_rw_handle[mtd->index]);
-    devfs_unregister(devfs_ro_handle[mtd->index]);
+    devfs_remove ("mtd/%d", mtd->index*2);
+    devfs_remove ("mtd/%dro", mtd->index*2);
 }
 #endif
 
@@ -515,7 +504,7 @@
     }
 
 #ifdef CONFIG_DEVFS_FS
-    devfs_dir_handle = devfs_mk_dir(NULL, "mtd", NULL);
+    devfs_mk_dir("mtd");
 
     register_mtd_user(&notifier);
 #endif
@@ -526,7 +515,7 @@
 {
 #ifdef CONFIG_DEVFS_FS
     unregister_mtd_user(&notifier);
-    devfs_unregister(devfs_dir_handle);
+    devfs_remove ("mtd");
 #endif
     unregister_chrdev(MTD_CHAR_MAJOR, "mtd");
 }

Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J5Kxz-00024D-3c
	for linux-mtd@lists.infradead.org; Thu, 20 Dec 2007 12:57:41 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Date: Thu, 20 Dec 2007 16:22:56 +0200
Message-Id: <20071220142256.30834.15540.sendpatchset@golum>
In-Reply-To: <20071220142251.30834.86791.sendpatchset@golum>
References: <20071220142251.30834.86791.sendpatchset@golum>
Subject: [PATCH v2 1/6] UBI: add UBI control device
Cc: Frank Haverkamp <haver@vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 028997ff1dca743d538187962133ea77aefbc510 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 16 Dec 2007 16:59:31 +0200
Subject: [PATCH] UBI: add UBI control device

This patch is a preparation to make UBI devices dynamic. It
adds an UBI control device which has dynamically allocated
major number and registers itself as "ubi_ctrl". It does not
do anything so far. The idea is that this device will allow
to attach/detach MTD devices from userspace.

This is symilar to what the Linux device mapper has.

The next things to do are:
* Fix UBI, because it now assumes UBI devices cannot go away
* Implement control device ioctls which will attach/detach MTD
  devices

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |   69 ++++++++++++++++++++++++++++++++++++++++-------
 drivers/mtd/ubi/cdev.c  |   10 +++++++
 drivers/mtd/ubi/ubi.h   |    3 +-
 3 files changed, 71 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index b3efb2f..8d05d96 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -21,11 +21,16 @@
  */
 
 /*
- * This file includes UBI initialization and building of UBI devices. At the
- * moment UBI devices may only be added while UBI is initialized, but dynamic
- * device add/remove functionality is planned. Also, at the moment we only
- * attach UBI devices by scanning, which will become a bottleneck when flashes
- * reach certain large size. Then one may improve UBI and add other methods.
+ * This file includes UBI initialization and building of UBI devices.
+ *
+ * When UBI is initialized, it attaches all the MTD devices specified as the
+ * module load parameters or the kernel boot parameters. If MTD devices were
+ * specified, UBI does not attach any MTD device, but it is possible to do
+ * later using the "UBI control device".
+ *
+ * At the moment we only attach UBI devices by scanning, which will become a
+ * bottleneck when flashes reach certain large size. Then one may improve UBI
+ * and add other methods, although it does not seem to be easy to do.
  */
 
 #include <linux/err.h>
@@ -70,6 +75,11 @@ struct kmem_cache *ubi_ltree_slab;
 /* Slab cache for wear-leveling entries */
 struct kmem_cache *ubi_wl_entry_slab;
 
+/* UBI control character device major number */
+static int ubi_ctrl_major;
+
+/* Linux device model object corresponding to the control UBI device */
+static struct device ubi_ctrl_dev;
 
 /* "Show" method for files in '/<sysfs>/class/ubi/' */
 static ssize_t ubi_version_show(struct class *class, char *buf)
@@ -142,6 +152,9 @@ static ssize_t dev_attribute_show(struct device *dev,
 /* Fake "release" method for UBI devices */
 static void dev_release(struct device *dev) { }
 
+/* Fake "release" method for UBI control device */
+static void ctrl_dev_release(struct device *dev) { }
+
 /**
  * ubi_sysfs_init - initialize sysfs for an UBI device.
  * @ubi: UBI device description object
@@ -701,19 +714,45 @@ static int __init ubi_init(void)
 		return -EINVAL;
 	}
 
+	/* Allocate major number for the UBI control device and register it */
+	ubi_ctrl_major = register_chrdev(0, "ubi_ctrl",
+					 &ubi_ctrl_cdev_operations);
+	if (ubi_ctrl_major < 0) {
+		err = ubi_ctrl_major;
+		printk(KERN_ERR "UBI error: cannot register control device\n");
+		return err;
+	}
+
+	/* Create base sysfs directory and sysfs files */
 	ubi_class = class_create(THIS_MODULE, UBI_NAME_STR);
-	if (IS_ERR(ubi_class))
-		return PTR_ERR(ubi_class);
+	if (IS_ERR(ubi_class)) {
+		err = PTR_ERR(ubi_class);
+		printk(KERN_ERR "UBI error: cannot create UBI class\n");
+		goto out_cdev_unreg;
+	}
 
 	err = class_create_file(ubi_class, &ubi_version);
-	if (err)
+	if (err) {
+		printk(KERN_ERR "UBI error: cannot create sysfs file\n");
 		goto out_class;
+	}
+
+	/* Register the control device in the Linux device system */
+	ubi_ctrl_dev.release = ctrl_dev_release;
+	ubi_ctrl_dev.devt = MKDEV(ubi_ctrl_major, 0);
+	ubi_ctrl_dev.class = ubi_class;
+	sprintf(&ubi_ctrl_dev.bus_id[0], "ubi_ctrl");
+	err = device_register(&ubi_ctrl_dev);
+	if (err) {
+		printk(KERN_ERR "UBI error: cannot register device\n");
+		goto out_version;
+	}
 
 	ubi_ltree_slab = kmem_cache_create("ubi_ltree_slab",
 					   sizeof(struct ubi_ltree_entry), 0,
 					   0, &ltree_entry_ctor);
 	if (!ubi_ltree_slab)
-		goto out_version;
+		goto out_dev_unreg;
 
 	ubi_wl_entry_slab = kmem_cache_create("ubi_wl_entry_slab",
 						sizeof(struct ubi_wl_entry),
@@ -727,8 +766,11 @@ static int __init ubi_init(void)
 
 		cond_resched();
 		err = attach_mtd_dev(p->name, p->vid_hdr_offs, p->data_offs);
-		if (err)
+		if (err) {
+			printk(KERN_ERR "UBI error: cannot attach %s\n",
+			       p->name);
 			goto out_detach;
+		}
 	}
 
 	return 0;
@@ -739,10 +781,15 @@ out_detach:
 	kmem_cache_destroy(ubi_wl_entry_slab);
 out_ltree:
 	kmem_cache_destroy(ubi_ltree_slab);
+out_dev_unreg:
+	device_unregister(&ubi_ctrl_dev);
 out_version:
 	class_remove_file(ubi_class, &ubi_version);
 out_class:
 	class_destroy(ubi_class);
+out_cdev_unreg:
+	unregister_chrdev(ubi_ctrl_major, "ubi_ctrl");
+	printk(KERN_ERR "UBI error: cannot initialize UBI, error %d\n", err);
 	return err;
 }
 module_init(ubi_init);
@@ -756,8 +803,10 @@ static void __exit ubi_exit(void)
 			detach_mtd_dev(ubi_devices[i]);
 	kmem_cache_destroy(ubi_wl_entry_slab);
 	kmem_cache_destroy(ubi_ltree_slab);
+	device_unregister(&ubi_ctrl_dev);
 	class_remove_file(ubi_class, &ubi_version);
 	class_destroy(ubi_class);
+	unregister_chrdev(ubi_ctrl_major, "ubi_ctrl");
 }
 module_exit(ubi_exit);
 
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 22c15a3..bc900d2 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -28,6 +28,11 @@
  *
  * Major and minor numbers are assigned dynamically to both UBI and volume
  * character devices.
+ *
+ * Well, there is the third kind of character devices - the UBI control
+ * character device, which allows to manipulate by UBI devices - create and
+ * delete them. In other words, it is used for attaching and detaching MTD
+ * devices.
  */
 
 #include <linux/module.h>
@@ -693,6 +698,11 @@ static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
 	return err;
 }
 
+/* UBI control character device operations */
+struct file_operations ubi_ctrl_cdev_operations = {
+	.owner = THIS_MODULE,
+};
+
 /* UBI character device operations */
 struct file_operations ubi_cdev_operations = {
 	.owner = THIS_MODULE,
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 994233d..21c0283 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -235,7 +235,7 @@ struct ubi_wl_entry;
 
 /**
  * struct ubi_device - UBI device description structure
- * @dev: class device object to use the the Linux device model
+ * @dev: UBI device object to use the the Linux device model
  * @cdev: character device object to create character device
  * @ubi_num: UBI device number
  * @ubi_name: UBI device name
@@ -398,6 +398,7 @@ struct ubi_device {
 
 extern struct kmem_cache *ubi_ltree_slab;
 extern struct kmem_cache *ubi_wl_entry_slab;
+extern struct file_operations ubi_ctrl_cdev_operations;
 extern struct file_operations ubi_cdev_operations;
 extern struct file_operations ubi_vol_cdev_operations;
 extern struct ubi_device *ubi_devices[];
-- 
1.5.3.4

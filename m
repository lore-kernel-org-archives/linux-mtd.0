Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dDSbq-0006Gi-Uh
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 09:29:43 +0000
From: Rabin Vincent <rabin.vincent@axis.com>
To: dedekind1@gmail.com,
	richard@nod.at,
	adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rabin Vincent <rabinv@axis.com>
Subject: [PATCH] ubifs: allow userspace to map mounts to volumes
Date: Wed, 24 May 2017 11:21:42 +0200
Message-Id: <1495617702-18345-1-git-send-email-rabin.vincent@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rabin Vincent <rabinv@axis.com>

There currently appears to be no way for userspace to find out the
underlying volume number for a mounted ubifs file system, since ubifs
uses anonymous block devices.  The volume name is present in
/proc/mounts but UBI volumes can be renamed after the volume has been
mounted.

To remedy this, provide a directory in /sys/fs/ubifs named after the
underlying anonymous block device's number (obtainable by userspace via
stat(2)) and provide a link named "ubi" to the underlying UBI volume.

 # mount | head -1
 ubi0:rootfs on / type ubifs (rw,relatime)
 # ubirename /dev/ubi0 rootfs foo
 # mount | head -1
 ubi0:rootfs on / type ubifs (rw,relatime)
 # stat /
   File: /
   Size: 1520      	Blocks: 0          IO Block: 4096   directory
 Device: dh/13d	Inode: 1           Links: 18
 ...
 # ls -l /sys/fs/ubifs/
 drwxr-xr-x    2 root     root             0 May 23 09:57 0:13
 drwxr-xr-x    2 root     root             0 May 23 09:57 0:17
 # ls -l /sys/fs/ubifs/0\:13/
 lrwxrwxrwx    1 root     root             0 May 23 11:45 ubi
   -> ../../../devices/virtual/ubi/ubi0/ubi0_10

Signed-off-by: Rabin Vincent <rabinv@axis.com>
---
 Documentation/ABI/testing/sysfs-fs-ubifs |  6 +++
 drivers/mtd/ubi/kapi.c                   | 12 ++++++
 fs/ubifs/Makefile                        |  2 +-
 fs/ubifs/super.c                         | 16 +++++++-
 fs/ubifs/sysfs.c                         | 66 ++++++++++++++++++++++++++++++++
 fs/ubifs/sysfs.h                         | 11 ++++++
 fs/ubifs/ubifs.h                         |  7 ++++
 include/linux/mtd/ubi.h                  |  3 ++
 8 files changed, 121 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-fs-ubifs
 create mode 100644 fs/ubifs/sysfs.c
 create mode 100644 fs/ubifs/sysfs.h

diff --git a/Documentation/ABI/testing/sysfs-fs-ubifs b/Documentation/ABI/testing/sysfs-fs-ubifs
new file mode 100644
index 0000000..1735859
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-fs-ubifs
@@ -0,0 +1,6 @@
+What:		/sys/fs/ubifs/<disk>/ubi
+Date:		May 2017
+Description:
+		This symbolic link points to the file system's underlying UBI
+		volume.  The <disk> is the major:minor numbers of the anonymous
+		block device backing the file system.
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index d4b2e87..aa766d9 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -107,6 +107,18 @@ void ubi_get_volume_info(struct ubi_volume_desc *desc,
 EXPORT_SYMBOL_GPL(ubi_get_volume_info);
 
 /**
+ * ubi_volume_kobject - get kobject for a UBI volume.
+ * @desc: volume descriptor
+ *
+ * Retrieves a pointer to the struct kobject underlying the UBI volume.
+ * The caller must hold a reference to the UBI volume.
+ */
+struct kobject *ubi_volume_kobj(struct ubi_volume_desc *desc)
+{
+	return &desc->vol->dev.kobj;
+}
+
+/**
  * ubi_open_volume - open UBI volume.
  * @ubi_num: UBI device number
  * @vol_id: volume ID
diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
index 6f3251c..7bf4689 100644
--- a/fs/ubifs/Makefile
+++ b/fs/ubifs/Makefile
@@ -4,5 +4,5 @@ ubifs-y += shrinker.o journal.o file.o dir.o super.o sb.o io.o
 ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
 ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
 ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o xattr.o debug.o
-ubifs-y += misc.o
+ubifs-y += sysfs.o misc.o
 ubifs-$(CONFIG_UBIFS_FS_ENCRYPTION) += crypto.o
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index cf4cc99..fdcfefe 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1164,6 +1164,10 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		return err;
 
+	err = ubifs_sysfs_register(c);
+	if (err)
+		goto out_debugging;
+
 	err = check_volume_empty(c);
 	if (err)
 		goto out_free;
@@ -1496,6 +1500,8 @@ static int mount_ubifs(struct ubifs_info *c)
 	vfree(c->ileb_buf);
 	vfree(c->sbuf);
 	kfree(c->bottom_up_buf);
+	ubifs_sysfs_unregister(c);
+out_debugging:
 	ubifs_debugging_exit(c);
 	return err;
 }
@@ -1536,6 +1542,7 @@ static void ubifs_umount(struct ubifs_info *c)
 	vfree(c->sbuf);
 	kfree(c->bottom_up_buf);
 	ubifs_debugging_exit(c);
+	ubifs_sysfs_unregister(c);
 }
 
 /**
@@ -2271,14 +2278,20 @@ static int __init ubifs_init(void)
 	if (err)
 		goto out_compr;
 
+	err = ubifs_sysfs_init();
+	if (err)
+		goto out_dbg;
+
 	err = register_filesystem(&ubifs_fs_type);
 	if (err) {
 		pr_err("UBIFS error (pid %d): cannot register file system, error %d",
 		       current->pid, err);
-		goto out_dbg;
+		goto out_sysfs;
 	}
 	return 0;
 
+out_sysfs:
+	ubifs_sysfs_exit();
 out_dbg:
 	dbg_debugfs_exit();
 out_compr:
@@ -2308,6 +2321,7 @@ static void __exit ubifs_exit(void)
 	rcu_barrier();
 	kmem_cache_destroy(ubifs_inode_slab);
 	unregister_filesystem(&ubifs_fs_type);
+	ubifs_sysfs_exit();
 }
 module_exit(ubifs_exit);
 
diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
new file mode 100644
index 0000000..8f2cba1
--- /dev/null
+++ b/fs/ubifs/sysfs.c
@@ -0,0 +1,66 @@
+#include <linux/fs.h>
+
+#include "ubifs.h"
+
+static struct kset *ubifs_kset;
+
+static void ubifs_sb_release(struct kobject *kobj)
+{
+	struct ubifs_info *c = container_of(kobj, struct ubifs_info, kobj);
+
+	complete(&c->kobj_unregister);
+}
+
+static struct kobj_type ubifs_sb_ktype = {
+	.sysfs_ops	= &kobj_sysfs_ops,
+	.release	= ubifs_sb_release,
+};
+
+int ubifs_sysfs_register(struct ubifs_info *c)
+{
+	dev_t devt = c->vfs_sb->s_dev;
+	int ret;
+
+	c->kobj.kset = ubifs_kset;
+	init_completion(&c->kobj_unregister);
+
+	ret = kobject_init_and_add(&c->kobj, &ubifs_sb_ktype, NULL,
+				   "%u:%u", MAJOR(devt), MINOR(devt));
+	if (ret)
+		goto out_put;
+
+	ret = sysfs_create_link(&c->kobj, ubi_volume_kobj(c->ubi), "ubi");
+	if (ret)
+		goto out_del;
+
+	return 0;
+
+out_del:
+	kobject_del(&c->kobj);
+out_put:
+	kobject_put(&c->kobj);
+	wait_for_completion(&c->kobj_unregister);
+	return ret;
+}
+
+void ubifs_sysfs_unregister(struct ubifs_info *c)
+{
+	sysfs_remove_link(&c->kobj, "ubi");
+	kobject_del(&c->kobj);
+	kobject_put(&c->kobj);
+	wait_for_completion(&c->kobj_unregister);
+}
+
+int __init ubifs_sysfs_init(void)
+{
+	ubifs_kset = kset_create_and_add("ubifs", NULL, fs_kobj);
+	if (!ubifs_kset)
+		return -ENOMEM;
+
+	return 0;
+}
+
+void ubifs_sysfs_exit(void)
+{
+	kset_unregister(ubifs_kset);
+}
diff --git a/fs/ubifs/sysfs.h b/fs/ubifs/sysfs.h
new file mode 100644
index 0000000..4b7e70b
--- /dev/null
+++ b/fs/ubifs/sysfs.h
@@ -0,0 +1,11 @@
+#ifndef __UBIFS_SYSFS_H__
+#define __UBIFS_SYSFS_H__
+
+struct ubifs_info;
+
+int ubifs_sysfs_init(void);
+void ubifs_sysfs_exit(void);
+int ubifs_sysfs_register(struct ubifs_info *c);
+void ubifs_sysfs_unregister(struct ubifs_info *c);
+
+#endif
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 298b4d8..3a3154f 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -43,7 +43,10 @@
 #else
 #include <linux/fscrypt_notsupp.h>
 #endif
+#include <linux/sysfs.h>
+#include <linux/completion.h>
 #include <linux/random.h>
+#include "sysfs.h"
 #include "ubifs-media.h"
 
 /* Version of this UBIFS implementation */
@@ -1216,6 +1219,8 @@ struct ubifs_debug_info;
  * @mount_opts: UBIFS-specific mount options
  *
  * @dbg: debugging-related information
+ * @kobj: kobject for /sys/fs/ubifs/
+ * @kobj_unregister: completion to unregister sysfs kobject
  */
 struct ubifs_info {
 	struct super_block *vfs_sb;
@@ -1446,6 +1451,8 @@ struct ubifs_info {
 	struct ubifs_mount_opts mount_opts;
 
 	struct ubifs_debug_info *dbg;
+	struct kobject kobj;
+	struct completion kobj_unregister;
 };
 
 extern struct list_head ubifs_infos;
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index 1e271cb..d35e84f 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -26,6 +26,8 @@
 #include <linux/scatterlist.h>
 #include <mtd/ubi-user.h>
 
+struct kobject;
+
 /* All voumes/LEBs */
 #define UBI_ALL -1
 
@@ -241,6 +243,7 @@ struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode);
 struct ubi_volume_desc *ubi_open_volume_nm(int ubi_num, const char *name,
 					   int mode);
 struct ubi_volume_desc *ubi_open_volume_path(const char *pathname, int mode);
+struct kobject *ubi_volume_kobj(struct ubi_volume_desc *desc);
 
 int ubi_register_volume_notifier(struct notifier_block *nb,
 				 int ignore_existing);
-- 
2.1.4

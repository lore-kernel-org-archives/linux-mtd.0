Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9V-0002qj-7L
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:43:54 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 05/25] fs: char_dev: introduce lookup_cdev function to find
 cdev by name
Date: Tue, 21 Jul 2015 16:37:36 +0800
Message-ID: <1437467876-22106-6-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Function lookup_cdev works similar with lookup_bdev, we can get
a cdev instance by lookup_cdev with a parameter of dev name.

This function will be used in quotactl to get a cdev by a dev name.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/char_dev.c      | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  2 ++
 2 files changed, 74 insertions(+)

diff --git a/fs/char_dev.c b/fs/char_dev.c
index ea06a3d..899f08b 100644
--- a/fs/char_dev.c
+++ b/fs/char_dev.c
@@ -22,6 +22,9 @@
 #include <linux/backing-dev.h>
 #include <linux/tty.h>
 
+#include <linux/namei.h>
+#include <linux/mount.h>
+
 #include "internal.h"
 
 static struct kobj_map *cdev_map;
@@ -439,6 +442,74 @@ static int exact_lock(dev_t dev, void *data)
 	return cdev_get(p) ? 0 : -1;
 }
 
+static struct cdev *cd_acquire(struct inode *inode)
+{
+	struct cdev *cdev;
+	struct cdev *new = NULL;
+
+	spin_lock(&cdev_lock);
+	cdev = inode->i_cdev;
+	if (!cdev) {
+		struct kobject *kobj;
+		int idx;
+		spin_unlock(&cdev_lock);
+		kobj = kobj_lookup(cdev_map, inode->i_rdev, &idx);
+		if (!kobj) {
+			cdev = NULL;
+			goto out;
+		}
+		new = container_of(kobj, struct cdev, kobj);
+		spin_lock(&cdev_lock);
+		/* Check i_cdev again in case somebody beat us to it while
+		   we dropped the lock. */
+		cdev = inode->i_cdev;
+		if (!cdev) {
+			inode->i_cdev = cdev = new;
+			list_add(&inode->i_devices, &cdev->list);
+		}
+	}
+
+	if (!cdev_get(cdev))
+		cdev = NULL;
+	spin_unlock(&cdev_lock);
+
+out:
+	return cdev;
+}
+
+struct cdev *lookup_cdev(const char *pathname)
+{
+	struct cdev *cdev;
+	struct inode *inode;
+	struct path path;
+	int error;
+
+	if (!pathname || !*pathname)
+		return ERR_PTR(-EINVAL);
+
+	error = kern_path(pathname, LOOKUP_FOLLOW, &path);
+	if (error)
+		return ERR_PTR(error);
+
+	inode = d_backing_inode(path.dentry);
+	error = -ENODEV;
+	if (!S_ISCHR(inode->i_mode))
+		goto fail;
+	error = -EACCES;
+	if (path.mnt->mnt_flags & MNT_NODEV)
+		goto fail;
+	error = -ENXIO;
+	cdev = cd_acquire(inode);
+	if (!cdev)
+		goto fail;
+out:
+	path_put(&path);
+	return cdev;
+fail:
+	cdev = ERR_PTR(error);
+	goto out;
+}
+
 /**
  * cdev_add() - add a char device to the system
  * @p: the cdev structure for the device
@@ -561,6 +632,7 @@ void __init chrdev_init(void)
 EXPORT_SYMBOL(register_chrdev_region);
 EXPORT_SYMBOL(unregister_chrdev_region);
 EXPORT_SYMBOL(alloc_chrdev_region);
+EXPORT_SYMBOL(lookup_cdev);
 EXPORT_SYMBOL(cdev_init);
 EXPORT_SYMBOL(cdev_alloc);
 EXPORT_SYMBOL(cdev_del);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 5c7d789..860b235 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2308,6 +2308,8 @@ extern void __unregister_chrdev(unsigned int major, unsigned int baseminor,
 				unsigned int count, const char *name);
 extern void unregister_chrdev_region(dev_t, unsigned);
 extern void chrdev_show(struct seq_file *,off_t);
+extern struct cdev *lookup_cdev(const char *);
+
 
 static inline int register_chrdev(unsigned int major, const char *name,
 				  const struct file_operations *fops)
-- 
1.8.4.2

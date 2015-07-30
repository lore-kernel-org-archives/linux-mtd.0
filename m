Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnZ-0006If-DI
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:35 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 08/35] fs: introduce a __lookup_dev for internal using
Date: Thu, 30 Jul 2015 13:48:04 +0800
Message-ID: <1438235311-23788-9-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

This commit introduce a file of fs/dev.c at first. This is
a internal file shared by block_dev and char_dev. There is
only one function in it __lookup_dev which will be wrapped
to be lookup_bdev and loopup_cdev.

We will put more code in this file which is shared by
block_dev and char_dev.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/Makefile    |  2 +-
 fs/block_dev.c | 26 ++------------------
 fs/dev.c       | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/internal.h  | 14 +++++++++++
 4 files changed, 94 insertions(+), 25 deletions(-)
 create mode 100644 fs/dev.c

diff --git a/fs/Makefile b/fs/Makefile
index cb92fd4..d2f12b6 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -5,7 +5,7 @@
 # Rewritten to use lists instead of if-statements.
 # 
 
-obj-y :=	open.o read_write.o file_table.o super.o \
+obj-y :=	open.o read_write.o file_table.o super.o dev.o\
 		char_dev.o stat.o exec.o pipe.o namei.o fcntl.o \
 		ioctl.o readdir.o select.o dcache.o inode.o \
 		attr.o bad_inode.o file.o filesystems.o namespace.o \
diff --git a/fs/block_dev.c b/fs/block_dev.c
index c7e4163..07e434a 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -654,7 +654,7 @@ void bdput(struct block_device *bdev)
 
 EXPORT_SYMBOL(bdput);
  
-static struct block_device *bd_acquire(struct inode *inode)
+struct block_device *bd_acquire(struct inode *inode)
 {
 	struct block_device *bdev;
 
@@ -1706,34 +1706,12 @@ EXPORT_SYMBOL(ioctl_by_bdev);
 struct block_device *lookup_bdev(const char *pathname)
 {
 	struct block_device *bdev;
-	struct inode *inode;
-	struct path path;
 	int error;
 
-	if (!pathname || !*pathname)
-		return ERR_PTR(-EINVAL);
-
-	error = kern_path(pathname, LOOKUP_FOLLOW, &path);
+	error = __lookup_dev(pathname, NULL, &bdev);
 	if (error)
 		return ERR_PTR(error);
-
-	inode = d_backing_inode(path.dentry);
-	error = -ENOTBLK;
-	if (!S_ISBLK(inode->i_mode))
-		goto fail;
-	error = -EACCES;
-	if (path.mnt->mnt_flags & MNT_NODEV)
-		goto fail;
-	error = -ENOMEM;
-	bdev = bd_acquire(inode);
-	if (!bdev)
-		goto fail;
-out:
-	path_put(&path);
 	return bdev;
-fail:
-	bdev = ERR_PTR(error);
-	goto out;
 }
 EXPORT_SYMBOL(lookup_bdev);
 
diff --git a/fs/dev.c b/fs/dev.c
new file mode 100644
index 0000000..5356a47
--- /dev/null
+++ b/fs/dev.c
@@ -0,0 +1,77 @@
+/*
+ * This file contains some functions shared by block_dev and char_dev
+ */
+#include <linux/fs.h>
+#include <linux/namei.h>
+#include <linux/mount.h>
+
+#include "internal.h"
+
+/**
+ * __lookup_dev  - lookup a block_device or cdev by name
+ * @pathname:	special file representing the device
+ * @cdevp:	cdev would be returned by cdevp
+ * @bdevp:	block_device would be returned by bdevp
+ *
+ * Get a reference to the block_deivce or cdev at @pathname in
+ * the current namespace if possible and return it.
+ */
+int __lookup_dev(const char *pathname, struct cdev **cdevp,
+	       struct block_device **bdevp)
+{
+	struct inode *inode;
+	struct path path;
+	int error = 0;
+
+	if (!pathname || !*pathname)
+		return -EINVAL;
+
+	error = kern_path(pathname, LOOKUP_FOLLOW, &path);
+	if (error)
+		return error;
+
+	inode = d_backing_inode(path.dentry);
+
+	/**
+	 * We need at least one of bdevp and cdevp to be NULL,
+	 * but cdevp and bdevp can not be both NULL.
+	 */
+	error = -EINVAL;
+	if (!(cdevp || bdevp) || (cdevp && bdevp))
+		goto out;
+
+	if (cdevp) {
+		if (!S_ISCHR(inode->i_mode)) {
+			error = -EINVAL;
+			goto out;
+		}
+	} else {
+		if (!S_ISBLK(inode->i_mode)) {
+			error = -ENOTBLK;
+			goto out;
+		}
+	}
+	error = -EACCES;
+	if (path.mnt->mnt_flags & MNT_NODEV)
+		goto out;
+	error = -ENXIO;
+	if (S_ISCHR(inode->i_mode)) {
+		struct cdev *cdev;
+
+		cdev = cd_acquire(inode);
+		if (!cdev)
+			goto out;
+		*cdevp = cdev;
+	} else {
+		struct block_device *bdev;
+
+		bdev = bd_acquire(inode);
+		if (!bdev)
+			goto out;
+		*bdevp = bdev;
+	}
+	error = 0;
+out:
+	path_put(&path);
+	return error;
+}
diff --git a/fs/internal.h b/fs/internal.h
index 01dce1d..1e48f9e 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -17,6 +17,12 @@ struct mount;
 struct shrink_control;
 
 /*
+ * dev.c
+ */
+extern int __lookup_dev(const char *pathname, struct cdev **cdevp,
+			struct block_device **bdevp);
+
+/*
  * block_dev.c
  */
 #ifdef CONFIG_BLOCK
@@ -24,6 +30,8 @@ extern void __init bdev_cache_init(void);
 
 extern int __sync_blockdev(struct block_device *bdev, int wait);
 
+extern struct block_device *bd_acquire(struct inode *inode);
+
 #else
 static inline void bdev_cache_init(void)
 {
@@ -33,6 +41,11 @@ static inline int __sync_blockdev(struct block_device *bdev, int wait)
 {
 	return 0;
 }
+
+static struct block_device *bd_acquire(struct inode *inode)
+{
+	return NULL;
+}
 #endif
 
 /*
@@ -44,6 +57,7 @@ extern void guard_bio_eod(int rw, struct bio *bio);
  * char_dev.c
  */
 extern void __init chrdev_init(void);
+extern struct cdev *cd_acquire(struct inode *inode);
 
 /*
  * namei.c
-- 
1.8.4.2

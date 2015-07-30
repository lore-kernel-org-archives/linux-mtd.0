Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnX-0006If-LM
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:32 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 06/35] fs: super: introduce a get_super_cdev_thawed to get
 sb by cdev reference
Date: Thu, 30 Jul 2015 13:48:02 +0800
Message-ID: <1438235311-23788-7-git-send-email-yangds.fnst@cn.fujitsu.com>
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

This patch refactors the original get_super_thawed to get a common
helper function of __get_super_thawed. Then take the use of
__get_super_thawed, we can implement get_super_cdev_thawed easily.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/super.c         | 29 +++++++++++++++++++++++++----
 include/linux/fs.h |  1 +
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index 4c56dff..0e11412 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -629,18 +629,20 @@ struct super_block *get_super_cdev(struct cdev *cdev)
 EXPORT_SYMBOL(get_super_cdev);
 
 /**
- * get_super_thawed - get thawed superblock of a device
- * @bdev: device to get the superblock for
+ * __get_super_thawed - get thawed superblock
+ * @func: function pointer to get superblock by key
+ * @key: key to find superblock
  *
  * Scans the superblock list and finds the superblock of the file system
  * mounted on the device. The superblock is returned once it is thawed
  * (or immediately if it was not frozen). %NULL is returned if no match
  * is found.
  */
-struct super_block *get_super_thawed(struct block_device *bdev)
+static struct super_block *__get_super_thawed(
+		struct super_block *(*func)(void *), void *key)
 {
 	while (1) {
-		struct super_block *s = get_super(bdev);
+		struct super_block *s = func(key);
 		if (!s || s->s_writers.frozen == SB_UNFROZEN)
 			return s;
 		up_read(&s->s_umount);
@@ -649,9 +651,28 @@ struct super_block *get_super_thawed(struct block_device *bdev)
 		put_super(s);
 	}
 }
+
+/**
+ * get_super_thawed - get thawed superblock of a device
+ * @bdev: device to get the superblock for
+ */
+struct super_block *get_super_thawed(struct block_device *bdev)
+{
+	return __get_super_thawed((struct super_block *(*)(void *))get_super, bdev);
+}
 EXPORT_SYMBOL(get_super_thawed);
 
 /**
+ * get_super_cdev_thawed - get thawed superblock of a char device
+ * @cdev: device to get the superblock for
+ */
+struct super_block *get_super_cdev_thawed(struct cdev *cdev)
+{
+	return __get_super_thawed((struct super_block *(*)(void *))get_super_cdev, cdev);
+}
+EXPORT_SYMBOL(get_super_cdev_thawed);
+
+/**
  * get_active_super - get an active reference to the superblock of a device
  * @bdev: device to get the superblock for
  *
diff --git a/include/linux/fs.h b/include/linux/fs.h
index e5ea425a..5c7d789 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2746,6 +2746,7 @@ extern struct file_system_type *get_fs_type(const char *name);
 extern struct super_block *get_super(struct block_device *);
 extern struct super_block *get_super_cdev(struct cdev *);
 extern struct super_block *get_super_thawed(struct block_device *);
+extern struct super_block *get_super_cdev_thawed(struct cdev *);
 extern struct super_block *get_active_super(struct block_device *bdev);
 extern void drop_super(struct super_block *sb);
 extern void iterate_supers(void (*)(struct super_block *, void *), void *);
-- 
1.8.4.2

Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnW-0006IZ-E7
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:31 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 05/35] fs: super: introduce a get_super_cdev to get super
 by a cdev reference
Date: Thu, 30 Jul 2015 13:48:01 +0800
Message-ID: <1438235311-23788-6-git-send-email-yangds.fnst@cn.fujitsu.com>
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

As we have cdev in superblock now, we can provide get_super_cdev
to get super_block by a cdev reference, similar with get_super
which is working only for block_device.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/super.c         | 15 +++++++++++++++
 include/linux/fs.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/fs/super.c b/fs/super.c
index 46fd1f1..4c56dff 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -613,6 +613,21 @@ struct super_block *get_super(struct block_device *bdev)
 }
 EXPORT_SYMBOL(get_super);
 
+static int cdev_compare(struct super_block *sb, void *key)
+{
+	return (sb->s_cdev == (struct cdev *)key);
+}
+
+/**
+ * get_super_cdev - get the superblock of a cdev
+ * @cdev: char device to get the superblock for
+ */
+struct super_block *get_super_cdev(struct cdev *cdev)
+{
+	return __get_super(cdev_compare, cdev);
+}
+EXPORT_SYMBOL(get_super_cdev);
+
 /**
  * get_super_thawed - get thawed superblock of a device
  * @bdev: device to get the superblock for
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 2f1d9499..e5ea425a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2744,6 +2744,7 @@ extern void get_filesystem(struct file_system_type *fs);
 extern void put_filesystem(struct file_system_type *fs);
 extern struct file_system_type *get_fs_type(const char *name);
 extern struct super_block *get_super(struct block_device *);
+extern struct super_block *get_super_cdev(struct cdev *);
 extern struct super_block *get_super_thawed(struct block_device *);
 extern struct super_block *get_active_super(struct block_device *bdev);
 extern void drop_super(struct super_block *sb);
-- 
1.8.4.2

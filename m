Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmEp-0002nf-DZ
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:21 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 04/39] fs: super: consolidate the get_super class functions
Date: Tue, 15 Sep 2015 17:01:59 +0800
Message-ID: <1442307754-13233-5-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

There is a lot of duplicated code in get_super and user_get_super.
This commit introduc a __get_super as a common function to reduce
the duplication of it.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Reviewed-by: Jan Kara <jack@suse.com>
---
 fs/super.c | 64 ++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 31 insertions(+), 33 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index 9589fa4..4d667fe 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -559,19 +559,20 @@ void iterate_supers_type(struct file_system_type *type,
 }
 EXPORT_SYMBOL(iterate_supers_type);
 
-/**
- * get_super - get the superblock of a device
- * @bdev: device to get the superblock for
- * 
- * Scans the superblock list and finds the superblock of the file system
- * mounted on the device given. %NULL is returned if no match is found.
+/*
+ * __get_super - helper function for the other functions in get_super class
+ * @compare: function pointer to compare sb in list and key
+ * @key: key of the sb you want
+ *
+ * Scans the superblock list and finds the superblock you want. %NULL is
+ * returned if no match is found.
  */
-
-struct super_block *get_super(struct block_device *bdev)
+static struct super_block *__get_super(
+		int (*compare)(struct super_block *, void *), void *key)
 {
 	struct super_block *sb;
 
-	if (!bdev)
+	if (!key)
 		return NULL;
 
 	spin_lock(&sb_lock);
@@ -579,7 +580,7 @@ rescan:
 	list_for_each_entry(sb, &super_blocks, s_list) {
 		if (hlist_unhashed(&sb->s_instances))
 			continue;
-		if (sb->s_bdev == bdev) {
+		if (compare(sb, key)) {
 			sb->s_count++;
 			spin_unlock(&sb_lock);
 			down_read(&sb->s_umount);
@@ -596,6 +597,20 @@ rescan:
 	spin_unlock(&sb_lock);
 	return NULL;
 }
+
+static int bdev_compare(struct super_block *sb, void *key)
+{
+	return (sb->s_bdev == (struct block_device *)key);
+}
+
+/**
+ * get_super - get the superblock of a device
+ * @bdev: device to get the superblock for
+ */
+struct super_block *get_super(struct block_device *bdev)
+{
+	return __get_super(bdev_compare, bdev);
+}
 EXPORT_SYMBOL(get_super);
 
 /**
@@ -651,32 +666,15 @@ restart:
 	spin_unlock(&sb_lock);
 	return NULL;
 }
+
+static int user_compare(struct super_block *sb, void *key)
+{
+	return (sb->s_dev == *(dev_t *)key);
+}
  
 struct super_block *user_get_super(dev_t dev)
 {
-	struct super_block *sb;
-
-	spin_lock(&sb_lock);
-rescan:
-	list_for_each_entry(sb, &super_blocks, s_list) {
-		if (hlist_unhashed(&sb->s_instances))
-			continue;
-		if (sb->s_dev ==  dev) {
-			sb->s_count++;
-			spin_unlock(&sb_lock);
-			down_read(&sb->s_umount);
-			/* still alive? */
-			if (sb->s_root && (sb->s_flags & MS_BORN))
-				return sb;
-			up_read(&sb->s_umount);
-			/* nope, got unmounted */
-			spin_lock(&sb_lock);
-			__put_super(sb);
-			goto rescan;
-		}
-	}
-	spin_unlock(&sb_lock);
-	return NULL;
+	return __get_super(user_compare, &dev);
 }
 
 /**
-- 
1.8.4.2

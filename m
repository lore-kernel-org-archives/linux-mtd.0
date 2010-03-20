From: wferi@niif.hu (Ferenc Wagner)
Date: Sat, 20 Mar 2010 15:58:21 +0100
Subject: [PATCH] squashfs: thread initialization through the backend framework
Message-ID: <mailman.262.1269344143.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This necessitated introducing the killsb callback.
The read path is still untouched.
---
 fs/squashfs/backend.c  |   22 +++++++++++++++-----
 fs/squashfs/backend.h  |   11 ++++-----
 fs/squashfs/bdev.c     |    3 +-
 fs/squashfs/squashfs.h |    6 ++--
 fs/squashfs/super.c    |   49 +++++++++++++++++++++--------------------------
 5 files changed, 48 insertions(+), 43 deletions(-)

diff --git a/fs/squashfs/backend.c b/fs/squashfs/backend.c
index 4411c60..49fa6fa 100644
--- a/fs/squashfs/backend.c
+++ b/fs/squashfs/backend.c
@@ -11,14 +11,24 @@ const struct squashfs_backend *backends[] = {
 	NULL
 };
 
-const struct squashfs_backend *
-squashfs_find_backend(struct file_system_type *fs_type, int flags,
+int squashfs_find_backend(struct file_system_type *fs_type, int flags,
 			const char *dev_name, void *data, struct vfsmount *mnt)
 {
 	const struct squashfs_backend **b;
+	int err;
 
-	for (b = backends; *b; b++)
-		if (!(*b)->probe(fs_type, flags, dev_name, data, mnt))
-			break;
-	return *b;
+	for (b = backends; *b; b++) {
+		err = (*b)->probe(fs_type, flags, dev_name, data, mnt);
+		if (!err)
+			return 0;
+	}
+	ERROR("No suitable backend found\n");
+	return -ENODEV;
+}
+
+void squashfs_kill_super(struct super_block *sb)
+{
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
+
+	msblk->backend->killsb(sb);
 }
diff --git a/fs/squashfs/backend.h b/fs/squashfs/backend.h
index ca3ffe1..02c4bcd 100644
--- a/fs/squashfs/backend.h
+++ b/fs/squashfs/backend.h
@@ -9,14 +9,13 @@ struct squashfs_backend {
 	ssize_t	(*read)(struct squashfs_sb_info *, void **, size_t);
 	int	(*probe)(struct file_system_type *, int, const char *,
 				void*, struct vfsmount *);
+	void    (*killsb)(struct super_block *);
 	void	(*kill)(struct squashfs_sb_info *);
 	loff_t  (*size)(const struct super_block *);
 	const char *(*devname)(const struct super_block *, char *);
 };
 
-/* Dummy, until the original is nuked */
-static inline int squashfs_fill_super2(struct super_block *sb, void *data,
-				int silent, int (*add_bend)(struct super_block *))
-{
-	return -1;
-}
+int squashfs_find_backend(struct file_system_type *, int,
+			const char *, void *, struct vfsmount *);
+
+void squashfs_kill_super(struct super_block *);
diff --git a/fs/squashfs/bdev.c b/fs/squashfs/bdev.c
index fcc3b83..81652e8 100644
--- a/fs/squashfs/bdev.c
+++ b/fs/squashfs/bdev.c
@@ -68,7 +68,7 @@ static int add_bdev_backend(struct super_block *sb)
 
 static int fill_bdev_super(struct super_block *sb, void *data, int silent)
 {
-	return squashfs_fill_super2(sb, data, silent, add_bdev_backend);
+	return squashfs_fill_super(sb, data, silent, add_bdev_backend);
 }
 
 static int bdev_probe(struct file_system_type *fs_type, int flags,
@@ -103,6 +103,7 @@ const struct squashfs_backend squashfs_bdev_ops = {
 	.free	= bdev_free,
 	.read	= bdev_read,
 	.probe	= bdev_probe,
+	.killsb	= kill_block_super,
 	.kill	= bdev_kill,
 	.size	= bdev_size,
 	.devname= bdev_devname
diff --git a/fs/squashfs/squashfs.h b/fs/squashfs/squashfs.h
index 0e74175..24c4b9e 100644
--- a/fs/squashfs/squashfs.h
+++ b/fs/squashfs/squashfs.h
@@ -73,10 +73,10 @@ extern struct inode *squashfs_iget(struct super_block *, long long,
 				unsigned int);
 extern int squashfs_read_inode(struct inode *, long long);
 
-/* super.c
+/* super.c */
 int squashfs_fill_super(struct super_block *, void *, int,
-                        struct squashfs_backend *);
-*/
+                        int (*)(struct super_block *));
+
 /*
  * Inodes, files, backend and decompressor operations
  */
diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 3550aec..710179f 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -42,6 +42,7 @@
 #include "squashfs_fs_i.h"
 #include "squashfs.h"
 #include "decompressor.h"
+#include "backend.h"
 
 static struct file_system_type squashfs_fs_type;
 static const struct super_operations squashfs_super_ops;
@@ -73,7 +74,8 @@ static const struct squashfs_decompressor *supported_squashfs_filesystem(short
 }
 
 
-static int squashfs_fill_super(struct super_block *sb, void *data, int silent)
+int squashfs_fill_super(struct super_block *sb, void *data, int silent,
+			int (*add_backend)(struct super_block *))
 {
 	struct squashfs_sb_info *msblk;
 	struct squashfs_super_block *sblk = NULL;
@@ -97,11 +99,15 @@ static int squashfs_fill_super(struct super_block *sb, void *data, int silent)
 	sblk = kzalloc(sizeof(*sblk), GFP_KERNEL);
 	if (sblk == NULL) {
 		ERROR("Failed to allocate squashfs_super_block\n");
-		goto failure;
+		err = -ENOMEM;
+		goto free_msblk;
 	}
 
 	msblk->devblksize = sb_min_blocksize(sb, BLOCK_SIZE);
 	msblk->devblksize_log2 = ffz(~msblk->devblksize);
+	err = add_backend(sb);
+	if (err)
+		goto free_sblk;
 
 	mutex_init(&msblk->read_data_mutex);
 	mutex_init(&msblk->meta_index_mutex);
@@ -127,7 +133,7 @@ static int squashfs_fill_super(struct super_block *sb, void *data, int silent)
 	if (sb->s_magic != SQUASHFS_MAGIC) {
 		if (!silent)
 			ERROR("Can't find a SQUASHFS superblock on %s\n",
-						bdevname(sb->s_bdev, b));
+					msblk->backend->devname(sb, b));
 		goto failed_mount;
 	}
 
@@ -146,11 +152,10 @@ static int squashfs_fill_super(struct super_block *sb, void *data, int silent)
 	if (le64_to_cpu(sblk->xattr_table_start) != SQUASHFS_INVALID_BLK)
 		ERROR("Xattrs in filesystem, these will be ignored\n");
 
-	/* Check the filesystem does not extend beyond the end of the
-	   block device */
+	/* Check the filesystem does not extend beyond the end of the device */
 	msblk->bytes_used = le64_to_cpu(sblk->bytes_used);
 	if (msblk->bytes_used < 0 || msblk->bytes_used >
-			i_size_read(sb->s_bdev->bd_inode))
+			msblk->backend->size(sb))
 		goto failed_mount;
 
 	/* Check block size for sanity */
@@ -182,7 +187,7 @@ static int squashfs_fill_super(struct super_block *sb, void *data, int silent)
 	msblk->inodes = le32_to_cpu(sblk->inodes);
 	flags = le16_to_cpu(sblk->flags);
 
-	TRACE("Found valid superblock on %s\n", bdevname(sb->s_bdev, b));
+	TRACE("Found valid superblock on %s\n", msblk->backend->devname(sb, b));
 	TRACE("Inodes are %scompressed\n", SQUASHFS_UNCOMPRESSED_INODES(flags)
 				? "un" : "");
 	TRACE("Data is %scompressed\n", SQUASHFS_UNCOMPRESSED_DATA(flags)
@@ -297,18 +302,16 @@ failed_mount:
 	squashfs_cache_delete(msblk->fragment_cache);
 	squashfs_cache_delete(msblk->read_page);
 	squashfs_decompressor_free(msblk, msblk->stream);
-	kfree(msblk->inode_lookup_table);
+	kfree(msblk->inode_lookup_table); /* FIXME: squashfs_put_super has meta_index instead */
 	kfree(msblk->fragment_index);
 	kfree(msblk->id_table);
-	kfree(sb->s_fs_info);
-	sb->s_fs_info = NULL;
+	msblk->backend->kill(msblk);
+free_sblk:
 	kfree(sblk);
-	return err;
-
-failure:
-	kfree(sb->s_fs_info);
+free_msblk:
+	kfree(msblk);
 	sb->s_fs_info = NULL;
-	return -ENOMEM;
+	return err;
 }
 
 
@@ -353,7 +356,8 @@ static void squashfs_put_super(struct super_block *sb)
 		kfree(sbi->id_table);
 		kfree(sbi->fragment_index);
 		kfree(sbi->meta_index);
-		kfree(sb->s_fs_info);
+		sbi->backend->kill(sbi);
+		kfree(sbi);
 		sb->s_fs_info = NULL;
 	}
 
@@ -361,15 +365,6 @@ static void squashfs_put_super(struct super_block *sb)
 }
 
 
-static int squashfs_get_sb(struct file_system_type *fs_type, int flags,
-				const char *dev_name, void *data,
-				struct vfsmount *mnt)
-{
-	return get_sb_bdev(fs_type, flags, dev_name, data, squashfs_fill_super,
-				mnt);
-}
-
-
 static struct kmem_cache *squashfs_inode_cachep;
 
 
@@ -442,8 +437,8 @@ static void squashfs_destroy_inode(struct inode *inode)
 static struct file_system_type squashfs_fs_type = {
 	.owner = THIS_MODULE,
 	.name = "squashfs",
-	.get_sb = squashfs_get_sb,
-	.kill_sb = kill_block_super,
+	.get_sb = squashfs_find_backend,
+	.kill_sb = squashfs_kill_super,
 	.fs_flags = FS_REQUIRES_DEV
 };
 
-- 
1.5.6.5

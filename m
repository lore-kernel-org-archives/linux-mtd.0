From: wferi@niif.hu (Ferenc Wagner)
Date: Thu, 18 Mar 2010 03:12:01 +0100
Subject: [PATCH] squashfs: add backend plugin framework
Message-ID: <mailman.266.1269377282.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

---
 fs/squashfs/Makefile         |    3 +-
 fs/squashfs/backend.c        |   24 +++++++++
 fs/squashfs/backend.h        |   22 ++++++++
 fs/squashfs/bdev.c           |  110 ++++++++++++++++++++++++++++++++++++++++++
 fs/squashfs/squashfs.h       |    9 +++-
 fs/squashfs/squashfs_fs_sb.h |    2 +
 6 files changed, 168 insertions(+), 2 deletions(-)
 create mode 100644 fs/squashfs/backend.c
 create mode 100644 fs/squashfs/backend.h
 create mode 100644 fs/squashfs/bdev.c

diff --git a/fs/squashfs/Makefile b/fs/squashfs/Makefile
index 45aaefd..0f02891 100644
--- a/fs/squashfs/Makefile
+++ b/fs/squashfs/Makefile
@@ -4,5 +4,6 @@
 
 obj-$(CONFIG_SQUASHFS) += squashfs.o
 squashfs-y += block.o cache.o dir.o export.o file.o fragment.o id.o inode.o
-squashfs-y += namei.o super.o symlink.o zlib_wrapper.o decompressor.o
+squashfs-y += namei.o super.o symlink.o zlib_wrapper.o decompressor.o backend.o
 squashfs-$(CONFIG_SQUASHFS_LZMA) += lzma_wrapper.o
+squashfs-$(CONFIG_BLOCK) += bdev.o
diff --git a/fs/squashfs/backend.c b/fs/squashfs/backend.c
new file mode 100644
index 0000000..4411c60
--- /dev/null
+++ b/fs/squashfs/backend.c
@@ -0,0 +1,24 @@
+#include <linux/fs.h>
+
+#include "squashfs_fs_i.h"
+#include "squashfs.h"
+#include "backend.h"
+
+const struct squashfs_backend *backends[] = {
+#ifdef CONFIG_BLOCK
+	&squashfs_bdev_ops,
+#endif
+	NULL
+};
+
+const struct squashfs_backend *
+squashfs_find_backend(struct file_system_type *fs_type, int flags,
+			const char *dev_name, void *data, struct vfsmount *mnt)
+{
+	const struct squashfs_backend **b;
+
+	for (b = backends; *b; b++)
+		if (!(*b)->probe(fs_type, flags, dev_name, data, mnt))
+			break;
+	return *b;
+}
diff --git a/fs/squashfs/backend.h b/fs/squashfs/backend.h
new file mode 100644
index 0000000..ca3ffe1
--- /dev/null
+++ b/fs/squashfs/backend.h
@@ -0,0 +1,22 @@
+#include <linux/fs.h>
+#include <linux/vfs.h>
+
+#include "squashfs_fs_sb.h"
+
+struct squashfs_backend {
+	void	*(*init)(struct squashfs_sb_info *, u64, size_t);
+	void	(*free)(struct squashfs_sb_info *);
+	ssize_t	(*read)(struct squashfs_sb_info *, void **, size_t);
+	int	(*probe)(struct file_system_type *, int, const char *,
+				void*, struct vfsmount *);
+	void	(*kill)(struct squashfs_sb_info *);
+	loff_t  (*size)(const struct super_block *);
+	const char *(*devname)(const struct super_block *, char *);
+};
+
+/* Dummy, until the original is nuked */
+static inline int squashfs_fill_super2(struct super_block *sb, void *data,
+				int silent, int (*add_bend)(struct super_block *))
+{
+	return -1;
+}
diff --git a/fs/squashfs/bdev.c b/fs/squashfs/bdev.c
new file mode 100644
index 0000000..c1d4389
--- /dev/null
+++ b/fs/squashfs/bdev.c
@@ -0,0 +1,110 @@
+#include <linux/fs.h>
+#include <linux/buffer_head.h>
+
+#include "squashfs_fs_i.h"
+#include "squashfs.h"
+#include "backend.h"
+
+struct squashfs_bdev {
+	int devblksize;			/* FIXME: == s->s_blocksize(_bits)? */
+	unsigned short devblksize_log2;
+	size_t bytes_left;
+	struct buffer_head **bh;
+	int bh_index;			/* number of consumed buffer_heads */
+	int offset;			/* offset of next byte in buffer_head */
+};
+
+/* A backend is initialized for each SquashFS block read operation,
+ * making further sequential reads possible from the block.
+ */
+static void *bdev_init(struct squashfs_sb_info *msblk, u64 index, size_t length)
+{
+	struct squashfs_bdev *bdev = msblk->backend_data;
+	struct buffer_head *bh;
+
+	bh = kcalloc((max_t(int, msblk->block_size, SQUASHFS_METADATA_SIZE)
+		      >> bdev->devblksize_log2) + 1,
+		     sizeof(*bh), GFP_KERNEL);
+	if (!bh)
+		goto nomem;
+
+	/* different preread for data blocks and metadata blocks */
+
+	bdev->bh_index = 0;
+	bdev->bytes_left = length;
+	return bdev;
+
+nomem:
+	ERROR("failed to allocate buffer_heads\n");
+	return NULL;
+}
+
+static void bdev_free(struct squashfs_sb_info *msblk)
+{
+	struct squashfs_bdev *bdev = msblk->backend_data;
+	kfree(bdev->bh);
+	bdev->bh = 0; /* FIXME: to make bdev_kill universal (see there) */
+}
+
+static ssize_t bdev_read(struct squashfs_sb_info *msblk, void **buf, size_t len)
+{
+	return -ENOSYS;
+}
+
+static int add_bdev_backend(struct super_block *sb)
+{
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	struct squashfs_bdev *bdev = kzalloc(sizeof(*bdev), GFP_KERNEL);
+
+	if (!bdev)
+		return -ENOMEM;
+
+	bdev->devblksize = sb_min_blocksize(sb, BLOCK_SIZE);
+	bdev->devblksize_log2 = ffz(~bdev->devblksize);
+
+	msblk->backend = &squashfs_bdev_ops;
+	msblk->backend_data = bdev;
+	return 0;
+}
+
+static int fill_bdev_super(struct super_block *sb, void *data, int silent)
+{
+	return squashfs_fill_super2(sb, data, silent, add_bdev_backend);
+}
+
+static int bdev_probe(struct file_system_type *fs_type, int flags,
+			const char *dev_name, void *data,
+			struct vfsmount *mnt)
+{
+	return get_sb_bdev(fs_type, flags, dev_name, data,
+				fill_bdev_super, mnt);
+}
+
+static void bdev_kill(struct squashfs_sb_info *msblk)
+{
+	struct squashfs_bdev *bdev = msblk->backend_data;
+	if (bdev) {
+		kfree(bdev->bh); /* FIXME: can this be nonzero? cf. bdev_free */
+		kfree(bdev);
+	}
+}
+
+static loff_t bdev_size(const struct super_block *sb)
+{
+	return i_size_read(sb->s_bdev->bd_inode);
+}
+
+static const char *bdev_devname(const struct super_block *sb, char *buffer)
+{
+	return bdevname(sb->s_bdev, buffer);
+}
+
+const struct squashfs_backend squashfs_bdev_ops = {
+	.init	= bdev_init,
+	.free	= bdev_free,
+	.read	= bdev_read,
+	.probe	= bdev_probe,
+	.kill	= bdev_kill,
+	.size	= bdev_size,
+	.devname= bdev_devname
+};
diff --git a/fs/squashfs/squashfs.h b/fs/squashfs/squashfs.h
index d094886..0e74175 100644
--- a/fs/squashfs/squashfs.h
+++ b/fs/squashfs/squashfs.h
@@ -73,8 +73,12 @@ extern struct inode *squashfs_iget(struct super_block *, long long,
 				unsigned int);
 extern int squashfs_read_inode(struct inode *, long long);
 
+/* super.c
+int squashfs_fill_super(struct super_block *, void *, int,
+                        struct squashfs_backend *);
+*/
 /*
- * Inodes, files and decompressor operations
+ * Inodes, files, backend and decompressor operations
  */
 
 /* dir.c */
@@ -97,3 +101,6 @@ extern const struct squashfs_decompressor squashfs_zlib_comp_ops;
 
 /* lzma wrapper.c */
 extern const struct squashfs_decompressor squashfs_lzma_comp_ops;
+
+/* bdev.c */
+extern const struct squashfs_backend squashfs_bdev_ops;
diff --git a/fs/squashfs/squashfs_fs_sb.h b/fs/squashfs/squashfs_fs_sb.h
index 7533350..5662d9b 100644
--- a/fs/squashfs/squashfs_fs_sb.h
+++ b/fs/squashfs/squashfs_fs_sb.h
@@ -53,6 +53,8 @@ struct squashfs_cache_entry {
 
 struct squashfs_sb_info {
 	const struct squashfs_decompressor	*decompressor;
+	const struct squashfs_backend		*backend;
+	void					*backend_data;
 	int					devblksize;
 	int					devblksize_log2;
 	struct squashfs_cache			*block_cache;
-- 
1.5.6.5

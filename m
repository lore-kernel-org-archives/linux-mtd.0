From: wferi@niif.hu (Ferenc Wagner)
Date: Tue, 23 Mar 2010 02:21:27 +0100
Subject: [PATCH] squashfs: add mtd backend
Message-ID: <mailman.270.1269377282.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

---
 fs/squashfs/Kconfig    |    2 +-
 fs/squashfs/Makefile   |    1 +
 fs/squashfs/backend.c  |    3 +
 fs/squashfs/mtd.c      |  167 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/squashfs/squashfs.h |    3 +
 5 files changed, 175 insertions(+), 1 deletions(-)
 create mode 100644 fs/squashfs/mtd.c

diff --git a/fs/squashfs/Kconfig b/fs/squashfs/Kconfig
index 7ec5d7e..6849e70 100644
--- a/fs/squashfs/Kconfig
+++ b/fs/squashfs/Kconfig
@@ -1,6 +1,6 @@
 config SQUASHFS
 	tristate "SquashFS 4.0 - Squashed file system support"
-	depends on BLOCK
+	depends on BLOCK || MTD
 	select ZLIB_INFLATE
 	help
 	  Saying Y here includes support for SquashFS 4.0 (a Compressed
diff --git a/fs/squashfs/Makefile b/fs/squashfs/Makefile
index 0f02891..b6dd60e 100644
--- a/fs/squashfs/Makefile
+++ b/fs/squashfs/Makefile
@@ -7,3 +7,4 @@ squashfs-y += block.o cache.o dir.o export.o file.o fragment.o id.o inode.o
 squashfs-y += namei.o super.o symlink.o zlib_wrapper.o decompressor.o backend.o
 squashfs-$(CONFIG_SQUASHFS_LZMA) += lzma_wrapper.o
 squashfs-$(CONFIG_BLOCK) += bdev.o
+squashfs-$(CONFIG_MTD) += mtd.o
diff --git a/fs/squashfs/backend.c b/fs/squashfs/backend.c
index 49fa6fa..56037e3 100644
--- a/fs/squashfs/backend.c
+++ b/fs/squashfs/backend.c
@@ -8,6 +8,9 @@ const struct squashfs_backend *backends[] = {
 #ifdef CONFIG_BLOCK
 	&squashfs_bdev_ops,
 #endif
+#ifdef CONFIG_MTD
+	&squashfs_mtd_ops,
+#endif
 	NULL
 };
 
diff --git a/fs/squashfs/mtd.c b/fs/squashfs/mtd.c
new file mode 100644
index 0000000..c9ba361
--- /dev/null
+++ b/fs/squashfs/mtd.c
@@ -0,0 +1,167 @@
+#include <linux/fs.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/super.h>
+
+#include "squashfs_fs_i.h"
+#include "squashfs.h"
+#include "backend.h"
+
+struct squashfs_mtd {
+	u64 index;
+	int length;
+	int bytes_read;
+};
+
+static int checked_mtd_read(struct super_block *sb, u64 index, int length,
+			    void *buf)
+{
+	struct mtd_info *mi = sb->s_mtd;
+	int ret, retlen;
+
+	TRACE("Entering checked_mtd_read: index=0x%llx, length=%d\n",
+	      index, length);
+	ret = mi->read(mi, index, length, &retlen, buf);
+	if (ret) {
+		if (ret != -EUCLEAN && ret != -EBADMSG) {
+			ERROR("checked_mtd_read(index=0x%llx, length=%d): %d\n",
+			      index, length, ret);
+			return ret;
+		} else
+			WARNING("checked_mtd_read(index=0x%llx, length=%d): "
+				"recoverable error %d\n", index, length, ret);
+	}
+	if (retlen != length) {
+		ERROR("checked_mtd_read(index=0x%llx, length=%d) short read: %d\n",
+		      index, length, retlen);
+		return -EIO;
+	}
+	return 0;
+}
+
+static int mtd_init(struct super_block *sb, u64 index, int length,
+		    int srclength, u64 *next_index, int *compressed)
+{
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	struct squashfs_mtd *mtd = msblk->backend_data;
+
+	TRACE("Entering mtd_init: index=0x%llx, length=0x%x, srclength=%d\n",
+		index, length, srclength);
+
+	if (length) { /* datablock */
+		*compressed = SQUASHFS_COMPRESSED_BLOCK(length);
+		length = SQUASHFS_COMPRESSED_SIZE_BLOCK(length);
+		if (next_index)
+			*next_index = index + length;
+		TRACE("Block @ 0x%llx, %scompressed size %d, src size %d\n",
+			index, *compressed ? "" : "un", length, srclength);
+	} else { /* metadata block */
+		u16 metalen;
+		if ((index + 2) > msblk->bytes_used)
+			goto read_failure;
+		if (checked_mtd_read(sb, index, 2, &metalen))
+			goto read_failure;
+		length = le16_to_cpu(metalen);
+		*compressed = SQUASHFS_COMPRESSED(length);
+		length = SQUASHFS_COMPRESSED_SIZE(length);
+		if (next_index)
+			*next_index = index + length + 2;
+		TRACE("Block @ 0x%llx, %scompressed size %d\n", index,
+				*compressed ? "" : "un", length);
+		index += 2;
+	}
+	if (length < 0 || length > srclength ||
+			(index + length) > msblk->bytes_used)
+		goto read_failure;
+
+	mtd->index = index;
+	mtd->length = length;
+	mtd->bytes_read = 0;
+	return length;
+
+read_failure:
+	ERROR("mtd_init failed to read block 0x%llx\n",
+					(unsigned long long) index);
+	return -EIO;
+}
+
+static void mtd_free(struct squashfs_sb_info *msblk)
+{
+	TRACE("mtd_free: no op\n");
+}
+
+static int mtd_read(struct super_block *sb, void *buf, int len)
+{
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	struct squashfs_mtd *mtd = msblk->backend_data;
+	int err;
+
+	TRACE("mtd_read: buf=%p, len=%d, length=%d, bytes_read=%d\n",
+	      buf, len, mtd->length, mtd->bytes_read);
+
+	if (mtd->bytes_read == mtd->length) /* EOF */
+		return 0;
+	if (mtd->bytes_read + len > mtd->length)
+		len = mtd->length - mtd->bytes_read;
+	TRACE("mtd_read: copying %d bytes", len);
+	err = checked_mtd_read(sb, mtd->index + mtd->bytes_read, len, buf);
+	if (err)
+		return err;
+	mtd->bytes_read += len;
+	return len;
+}
+
+static int add_mtd_backend(struct super_block *sb)
+{
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	struct squashfs_mtd *mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
+
+	TRACE("add_mtd_backend\n");
+	if (!mtd)
+		return -ENOMEM;
+
+	msblk->backend = &squashfs_mtd_ops;
+	msblk->backend_data = mtd;
+	return 0;
+}
+
+static int fill_mtd_super(struct super_block *sb, void *data, int silent)
+{
+	return squashfs_fill_super(sb, data, silent, add_mtd_backend);
+}
+
+static int mtd_probe(struct file_system_type *fs_type, int flags,
+			const char *dev_name, void *data,
+			struct vfsmount *mnt)
+{
+	return get_sb_mtd(fs_type, flags, dev_name, data,
+				fill_mtd_super, mnt);
+}
+
+static void mtd_kill(struct squashfs_sb_info *msblk)
+{
+	TRACE("mtd_kill: mtd=%p\n", msblk->backend_data);
+	mtd_free(msblk);
+	kfree(msblk->backend_data);
+}
+
+static loff_t mtd_size(const struct super_block *sb)
+{
+	return sb->s_mtd->size;
+}
+
+static const char *mtd_devname(const struct super_block *sb, char *buffer)
+{
+	snprintf(buffer, BDEVNAME_SIZE, "MTD%d", sb->s_mtd->index);
+	return buffer;
+}
+
+const struct squashfs_backend squashfs_mtd_ops = {
+	.init	= mtd_init,
+	.free	= mtd_free,
+	.read	= mtd_read,
+	.probe	= mtd_probe,
+	.killsb = kill_mtd_super,
+	.kill	= mtd_kill,
+	.size	= mtd_size,
+	.devname= mtd_devname
+};
diff --git a/fs/squashfs/squashfs.h b/fs/squashfs/squashfs.h
index 24c4b9e..fc3a57a 100644
--- a/fs/squashfs/squashfs.h
+++ b/fs/squashfs/squashfs.h
@@ -104,3 +104,6 @@ extern const struct squashfs_decompressor squashfs_lzma_comp_ops;
 
 /* bdev.c */
 extern const struct squashfs_backend squashfs_bdev_ops;
+
+/* mtd.c */
+extern const struct squashfs_backend squashfs_mtd_ops;
-- 
1.5.6.5

From: wferi@niif.hu (Ferenc Wagner)
Date: Sun, 21 Mar 2010 02:08:58 +0100
Subject: [PATCH] squashfs: read uncompressed blocks through the backend framework
Message-ID: <mailman.268.1269377282.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Avoid double free on the temporary decompression hack-path; this may
leak buffer heads if decompression exits early.
---
 fs/squashfs/backend.h        |    4 +-
 fs/squashfs/bdev.c           |  191 ++++++++++++++++++++++++++++++++++++++----
 fs/squashfs/block.c          |  167 ++++++++-----------------------------
 fs/squashfs/lzma_wrapper.c   |    2 +
 fs/squashfs/squashfs_fs_sb.h |    2 -
 fs/squashfs/super.c          |    5 +-
 6 files changed, 216 insertions(+), 155 deletions(-)

diff --git a/fs/squashfs/backend.h b/fs/squashfs/backend.h
index 02c4bcd..308fe6d 100644
--- a/fs/squashfs/backend.h
+++ b/fs/squashfs/backend.h
@@ -4,9 +4,9 @@
 #include "squashfs_fs_sb.h"
 
 struct squashfs_backend {
-	void	*(*init)(struct squashfs_sb_info *, u64, size_t);
+	int	(*init)(struct super_block *, u64, int, int, u64 *, int *);
 	void	(*free)(struct squashfs_sb_info *);
-	ssize_t	(*read)(struct squashfs_sb_info *, void **, size_t);
+	int	(*read)(struct super_block *, void *, int);
 	int	(*probe)(struct file_system_type *, int, const char *,
 				void*, struct vfsmount *);
 	void    (*killsb)(struct super_block *);
diff --git a/fs/squashfs/bdev.c b/fs/squashfs/bdev.c
index 0ee09f8..497029b 100644
--- a/fs/squashfs/bdev.c
+++ b/fs/squashfs/bdev.c
@@ -8,47 +8,200 @@
 struct squashfs_bdev {
 	int devblksize;			/* FIXME: == s->s_blocksize(_bits)? */
 	unsigned short devblksize_log2;
-	size_t bytes_left;
+	int length;
+	int bytes_read;
 	struct buffer_head **bh;
 	int bh_index;			/* number of consumed buffer_heads */
 	int offset;			/* offset of next byte in buffer_head */
+	int b;				/* total number of buffer heads */
 };
 
-/* A backend is initialized for each SquashFS block read operation,
- * making further sequential reads possible from the block.
+/*
+ * Read the metadata block length, this is stored in the first two
+ * bytes of the metadata block.
  */
-static void *bdev_init(struct squashfs_sb_info *msblk, u64 index, size_t length)
+static struct buffer_head *get_block_length(struct super_block *sb,
+			u64 *cur_index, int *offset, int *length)
 {
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	struct squashfs_bdev *bdev = msblk->backend_data;
 	struct buffer_head *bh;
 
+	TRACE("get_block_length: cur_index=0x%llx, offset=%d\n",
+		(unsigned long long)*cur_index, *offset);
+	bh = sb_bread(sb, *cur_index);
+	if (bh == NULL)
+		return NULL;
+
+	if (bdev->devblksize - *offset == 1) {
+		*length = (unsigned char) bh->b_data[*offset];
+		put_bh(bh);
+		bh = sb_bread(sb, ++(*cur_index));
+		if (bh == NULL)
+			return NULL;
+		*length |= (unsigned char) bh->b_data[0] << 8;
+		*offset = 1;
+	} else {
+		*length = (unsigned char) bh->b_data[*offset] |
+			(unsigned char) bh->b_data[*offset + 1] << 8;
+		*offset += 2;
+	}
+
+	TRACE("get_block_length: length=%d, offset=%d\n", *length, *offset);
+	return bh;
+}
+
+/*
+ * Read a metadata block or datablock into memory.  Length is non-zero
+ * if a datablock is being read (the size is stored elsewhere in the
+ * filesystem), otherwise the length is obtained from the first two bytes of
+ * the metadata block.  A bit in the length field indicates if the block
+ * is stored uncompressed in the filesystem (usually because compression
+ * generated a larger block - this does occasionally happen with zlib).
+ */
+static int bdev_init(struct super_block *sb, u64 index, int length,
+			int srclength, u64 *next_index, int *compressed)
+{
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	struct squashfs_bdev *bdev = msblk->backend_data;
+	struct buffer_head **bh;
+	u64 cur_index;			/* sector of next byte */
+	int bytes;			/* number of bytes handled */
+	int b;				/* for counting buffer heads */
+
+	TRACE("Entering bdev_init: index=0x%llx, length=0x%x, srclength=%d\n",
+		index, length, srclength);
 	bh = kcalloc((max_t(int, msblk->block_size, SQUASHFS_METADATA_SIZE)
 		      >> bdev->devblksize_log2) + 1,
 		     sizeof(*bh), GFP_KERNEL);
-	if (!bh)
-		goto nomem;
+	if (bh == NULL)
+		return -ENOMEM;
+
+	bdev->offset = index & ((1 << bdev->devblksize_log2) - 1);
+	cur_index = index >> bdev->devblksize_log2;
+	if (length) { /* FIXME: this logic and the comment above should be pulled out! */
+		/*
+		 * Datablock.
+		 */
+		bytes = -bdev->offset;
+		*compressed = SQUASHFS_COMPRESSED_BLOCK(length);
+		length = SQUASHFS_COMPRESSED_SIZE_BLOCK(length);
+		if (next_index)
+			*next_index = index + length;
+
+		TRACE("Block @ 0x%llx, %scompressed size %d, src size %d\n",
+			index, *compressed ? "" : "un", length, srclength);
 
-	/* different preread for data blocks and metadata blocks */
+		if (length < 0 || length > srclength ||
+				(index + length) > msblk->bytes_used)
+			goto read_failure;
 
+		for (b = 0; bytes < length; b++, cur_index++) {
+			bh[b] = sb_getblk(sb, cur_index);
+			if (bh[b] == NULL)
+				goto block_release;
+			bytes += bdev->devblksize;
+		}
+		ll_rw_block(READ, b, bh);
+	} else {
+		/*
+		 * Metadata block.
+		 */
+		if ((index + 2) > msblk->bytes_used)
+			goto read_failure;
+
+		bh[0] = get_block_length(sb, &cur_index, &bdev->offset, &length);
+		if (bh[0] == NULL)
+			goto read_failure;
+		b = 1;
+
+		bytes = bdev->devblksize - bdev->offset;
+		*compressed = SQUASHFS_COMPRESSED(length);
+		length = SQUASHFS_COMPRESSED_SIZE(length);
+		if (next_index)
+			*next_index = index + length + 2;
+
+		TRACE("Block @ 0x%llx, %scompressed size %d\n", index,
+				*compressed ? "" : "un", length);
+
+		if (length < 0 || length > srclength ||
+					(index + length) > msblk->bytes_used)
+			goto block_release;
+
+		for (; bytes < length; b++) {
+			bh[b] = sb_getblk(sb, ++cur_index);
+			if (bh[b] == NULL)
+				goto block_release;
+			bytes += bdev->devblksize;
+		}
+		ll_rw_block(READ, b - 1, bh + 1);
+	}
+
+	bdev->bh = bh;
+	bdev->length = length;
+	bdev->bytes_read = 0;
+	bdev->b = b;
 	bdev->bh_index = 0;
-	bdev->bytes_left = length;
-	return bdev;
+	TRACE("bdev_init: allocated %d buffer heads at %p, returning length=%d",
+	      b, bh, length);
+	return length;
 
-nomem:
-	ERROR("failed to allocate buffer_heads\n");
-	return NULL;
+block_release:
+	while (b--)
+		put_bh(bh[b]);
+read_failure:
+	ERROR("bdev_init failed to read block 0x%llx\n",
+					(unsigned long long) index);
+	kfree(bh);
+	return -EIO;
 }
 
 static void bdev_free(struct squashfs_sb_info *msblk)
 {
 	struct squashfs_bdev *bdev = msblk->backend_data;
+
+	TRACE("bdev_free: bh=%p, bh_index=%d, b=%d\n",
+		bdev->bh, bdev->bh_index, bdev->b);
+	while (bdev->bh_index < bdev->b)
+		put_bh(bdev->bh[bdev->bh_index++]);
 	kfree(bdev->bh);
-	bdev->bh = 0; /* FIXME: to make bdev_kill universal (see there) */
+	bdev->bh = NULL;
 }
 
-static ssize_t bdev_read(struct squashfs_sb_info *msblk, void **buf, size_t len)
+static int bdev_read(struct super_block *sb, void *buf, int len)
 {
-	return -ENOSYS;
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	struct squashfs_bdev *bdev = msblk->backend_data;
+	struct buffer_head *bh = bdev->bh[bdev->bh_index];
+	int in_block = bdev->devblksize - bdev->offset;
+
+	TRACE("bdev_read: buf=%p, len=%d, length=%d, bytes_read=%d, in_block=%d, bh_index=%d, offset=%d\n",
+	      buf, len, bdev->length, bdev->bytes_read, in_block, bdev->bh_index, bdev->offset);
+	if (bdev->bytes_read == bdev->length) /* EOF */
+		return 0;
+	if (bdev->bytes_read + len > bdev->length)
+		len = bdev->length - bdev->bytes_read;
+	if (bdev->bytes_read == 0 || bdev->offset == 0) {
+		TRACE("bdev_read: wait_on_buffer %d\n", bdev->bh_index);
+		wait_on_buffer(bh);
+		if (!buffer_uptodate(bh))
+			return -EIO;
+	}
+	if (len < in_block) {
+		TRACE("bdev_read: copying %d bytes", len);
+		memcpy(buf, bh->b_data + bdev->offset, len);
+		bdev->offset += len;
+		bdev->bytes_read += len;
+		return len;
+	} else {
+		TRACE("bdev_read: copying %d bytes", in_block);
+		memcpy(buf, bh->b_data + bdev->offset, in_block);
+		put_bh(bh);
+		bdev->bh_index++;
+		bdev->offset = 0;
+		bdev->bytes_read += in_block;
+		return in_block;
+	}
 }
 
 static int add_bdev_backend(struct super_block *sb)
@@ -56,6 +209,7 @@ static int add_bdev_backend(struct super_block *sb)
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	struct squashfs_bdev *bdev = kzalloc(sizeof(*bdev), GFP_KERNEL);
 
+	TRACE("add_bdev_backend\n");
 	if (!bdev)
 		return -ENOMEM;
 
@@ -83,9 +237,12 @@ static int bdev_probe(struct file_system_type *fs_type, int flags,
 static void bdev_kill(struct squashfs_sb_info *msblk)
 {
 	struct squashfs_bdev *bdev = msblk->backend_data;
+
+	TRACE("bdev_kill: bdev=%p\n", bdev);
 	if (bdev) {
-		kfree(bdev->bh); /* FIXME: can this be nonzero? cf. bdev_free */
+		bdev_free(msblk);
 		kfree(bdev);
+		bdev = NULL;
 	}
 }
 
@@ -105,7 +262,7 @@ const struct squashfs_backend squashfs_bdev_ops = {
 	.read	= bdev_read,
 	.probe	= bdev_probe,
 	.killsb	= kill_block_super,
-	.kill	= bdev_kill,
+	.kill	= bdev_kill, /* FIXME: is this needed at all? */
 	.size	= bdev_size,
 	.devname= bdev_devname
 };
diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index 6f9914d..8787aac 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -37,37 +37,19 @@
 #include "squashfs_fs_i.h"
 #include "squashfs.h"
 #include "decompressor.h"
-/*
- * Read the metadata block length, this is stored in the first two
- * bytes of the metadata block.
- */
-static struct buffer_head *get_block_length(struct super_block *sb,
-			u64 *cur_index, int *offset, int *length)
-{
-	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	struct buffer_head *bh;
-
-	bh = sb_bread(sb, *cur_index);
-	if (bh == NULL)
-		return NULL;
-
-	if (msblk->devblksize - *offset == 1) {
-		*length = (unsigned char) bh->b_data[*offset];
-		put_bh(bh);
-		bh = sb_bread(sb, ++(*cur_index));
-		if (bh == NULL)
-			return NULL;
-		*length |= (unsigned char) bh->b_data[0] << 8;
-		*offset = 1;
-	} else {
-		*length = (unsigned char) bh->b_data[*offset] |
-			(unsigned char) bh->b_data[*offset + 1] << 8;
-		*offset += 2;
-	}
-
-	return bh;
-}
-
+#include "backend.h"
+
+/* FIXME: here for a temporary cheat only */
+struct squashfs_bdev {
+	int devblksize;			/* FIXME: == s->s_blocksize(_bits)? */
+	unsigned short devblksize_log2;
+	int length;
+	int bytes_read;
+	struct buffer_head **bh;
+	int bh_index;			/* number of consumed buffer_heads */
+	int offset;			/* offset of next byte in buffer_head */
+	int b;				/* total number of buffer heads */
+};
 
 /*
  * Read and decompress a metadata block or datablock.  Length is non-zero
@@ -80,124 +62,47 @@ static struct buffer_head *get_block_length(struct super_block *sb,
 int squashfs_read_data(struct super_block *sb, void **buffer, u64 index,
 			int length, u64 *next_index, int srclength, int pages)
 {
+	int compressed;
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	struct buffer_head **bh;
-	int offset = index & ((1 << msblk->devblksize_log2) - 1);
-	u64 cur_index = index >> msblk->devblksize_log2;
-	int bytes, compressed, b = 0, k = 0, page = 0, avail;
-
-
-	bh = kcalloc((msblk->block_size >> msblk->devblksize_log2) + 1,
-				sizeof(*bh), GFP_KERNEL);
-	if (bh == NULL)
-		return -ENOMEM;
-
-	if (length) {
-		/*
-		 * Datablock.
-		 */
-		bytes = -offset;
-		compressed = SQUASHFS_COMPRESSED_BLOCK(length);
-		length = SQUASHFS_COMPRESSED_SIZE_BLOCK(length);
-		if (next_index)
-			*next_index = index + length;
-
-		TRACE("Block @ 0x%llx, %scompressed size %d, src size %d\n",
-			index, compressed ? "" : "un", length, srclength);
 
-		if (length < 0 || length > srclength ||
-				(index + length) > msblk->bytes_used)
-			goto read_failure;
-
-		for (b = 0; bytes < length; b++, cur_index++) {
-			bh[b] = sb_getblk(sb, cur_index);
-			if (bh[b] == NULL)
-				goto block_release;
-			bytes += msblk->devblksize;
-		}
-		ll_rw_block(READ, b, bh);
-	} else {
-		/*
-		 * Metadata block.
-		 */
-		if ((index + 2) > msblk->bytes_used)
-			goto read_failure;
-
-		bh[0] = get_block_length(sb, &cur_index, &offset, &length);
-		if (bh[0] == NULL)
-			goto read_failure;
-		b = 1;
-
-		bytes = msblk->devblksize - offset;
-		compressed = SQUASHFS_COMPRESSED(length);
-		length = SQUASHFS_COMPRESSED_SIZE(length);
-		if (next_index)
-			*next_index = index + length + 2;
-
-		TRACE("Block @ 0x%llx, %scompressed size %d\n", index,
-				compressed ? "" : "un", length);
-
-		if (length < 0 || length > srclength ||
-					(index + length) > msblk->bytes_used)
-			goto block_release;
-
-		for (; bytes < length; b++) {
-			bh[b] = sb_getblk(sb, ++cur_index);
-			if (bh[b] == NULL)
-				goto block_release;
-			bytes += msblk->devblksize;
-		}
-		ll_rw_block(READ, b - 1, bh + 1);
-	}
+	length = msblk->backend->init(sb, index, length, srclength,
+					next_index, &compressed);
+	if (length < 0)
+		return length;
 
 	if (compressed) {
-		length = squashfs_decompress(msblk, buffer, bh, b, offset,
-			length, srclength, pages);
+		struct squashfs_bdev *bdev = msblk->backend_data;
+		length = squashfs_decompress(msblk, buffer, bdev->bh, bdev->b,
+				bdev->offset, length, srclength, pages);
+		bdev->bh_index = bdev->b; /* temporary hack to avoid double free */
 		if (length < 0)
 			goto read_failure;
 	} else {
 		/*
 		 * Block is uncompressed.
 		 */
-		int i, in, pg_offset = 0;
-
-		for (i = 0; i < b; i++) {
-			wait_on_buffer(bh[i]);
-			if (!buffer_uptodate(bh[i]))
-				goto block_release;
-		}
-
-		for (bytes = length; k < b; k++) {
-			in = min(bytes, msblk->devblksize - offset);
-			bytes -= in;
-			while (in) {
-				if (pg_offset == PAGE_CACHE_SIZE) {
-					page++;
-					pg_offset = 0;
-				}
-				avail = min_t(int, in, PAGE_CACHE_SIZE -
-						pg_offset);
-				memcpy(buffer[page] + pg_offset,
-						bh[k]->b_data + offset, avail);
-				in -= avail;
-				pg_offset += avail;
-				offset += avail;
+		int read, page = 0, pg_offset = 0;
+
+		while ((read = msblk->backend->read(sb, buffer[page] + pg_offset,
+						PAGE_CACHE_SIZE - pg_offset))) {
+			if (read < 0)
+				goto read_failure;
+			TRACE("copied %d bytes\n", read);
+			pg_offset += read;
+			if (pg_offset == PAGE_CACHE_SIZE) {
+				page++;
+				pg_offset = 0;
 			}
-			offset = 0;
-			put_bh(bh[k]);
 		}
 	}
 
-	kfree(bh);
+	msblk->backend->free(msblk);
+	TRACE("squashfs_read_data: returning length=%d\n", length);
 	return length;
 
-block_release:
-	for (; k < b; k++)
-		put_bh(bh[k]);
-
 read_failure:
 	ERROR("squashfs_read_data failed to read block 0x%llx\n",
 					(unsigned long long) index);
-	kfree(bh);
+	msblk->backend->free(msblk);
 	return -EIO;
 }
diff --git a/fs/squashfs/lzma_wrapper.c b/fs/squashfs/lzma_wrapper.c
index 9fa617d..439798f 100644
--- a/fs/squashfs/lzma_wrapper.c
+++ b/fs/squashfs/lzma_wrapper.c
@@ -94,6 +94,8 @@ static int lzma_uncompress(struct squashfs_sb_info *msblk, void **buffer,
 	void *buff = stream->input;
 	int avail, i, bytes = length, res;
 
+	TRACE("lzma_uncompress: bh=%p, b=%d, offset=%d, length=%d, srclength=%d,"
+		" pages=%d\n", bh, b, offset, length, srclength, pages);
 	mutex_lock(&lzma_mutex);
 
 	for (i = 0; i < b; i++) {
diff --git a/fs/squashfs/squashfs_fs_sb.h b/fs/squashfs/squashfs_fs_sb.h
index 5662d9b..87958fc 100644
--- a/fs/squashfs/squashfs_fs_sb.h
+++ b/fs/squashfs/squashfs_fs_sb.h
@@ -55,8 +55,6 @@ struct squashfs_sb_info {
 	const struct squashfs_decompressor	*decompressor;
 	const struct squashfs_backend		*backend;
 	void					*backend_data;
-	int					devblksize;
-	int					devblksize_log2;
 	struct squashfs_cache			*block_cache;
 	struct squashfs_cache			*fragment_cache;
 	struct squashfs_cache			*read_page;
diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 710179f..cb561bf 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -87,7 +87,7 @@ int squashfs_fill_super(struct super_block *sb, void *data, int silent,
 	u64 lookup_table_start;
 	int err;
 
-	TRACE("Entered squashfs_fill_superblock\n");
+	TRACE("Entered squashfs_fill_superblock, silent=%d\n", silent);
 
 	sb->s_fs_info = kzalloc(sizeof(*msblk), GFP_KERNEL);
 	if (sb->s_fs_info == NULL) {
@@ -103,8 +103,6 @@ int squashfs_fill_super(struct super_block *sb, void *data, int silent,
 		goto free_msblk;
 	}
 
-	msblk->devblksize = sb_min_blocksize(sb, BLOCK_SIZE);
-	msblk->devblksize_log2 = ffz(~msblk->devblksize);
 	err = add_backend(sb);
 	if (err)
 		goto free_sblk;
@@ -305,6 +303,7 @@ failed_mount:
 	kfree(msblk->inode_lookup_table); /* FIXME: squashfs_put_super has meta_index instead */
 	kfree(msblk->fragment_index);
 	kfree(msblk->id_table);
+	TRACE("squasfs_fill_super: killing backend, err=%d\n", err);
 	msblk->backend->kill(msblk);
 free_sblk:
 	kfree(sblk);
-- 
1.5.6.5

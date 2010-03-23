From: wferi@niif.hu (Ferenc Wagner)
Date: Tue, 23 Mar 2010 10:21:40 +0100
Subject: [PATCH] squashfs: pull out common logic of backend init functions
Message-ID: <mailman.271.1269377282.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

---
 fs/squashfs/backend.h |    2 +-
 fs/squashfs/bdev.c    |  155 +++++++++----------------------------------------
 fs/squashfs/block.c   |   33 ++++++++++-
 fs/squashfs/mtd.c     |   38 +-----------
 4 files changed, 62 insertions(+), 166 deletions(-)

diff --git a/fs/squashfs/backend.h b/fs/squashfs/backend.h
index 308fe6d..5beba00 100644
--- a/fs/squashfs/backend.h
+++ b/fs/squashfs/backend.h
@@ -4,7 +4,7 @@
 #include "squashfs_fs_sb.h"
 
 struct squashfs_backend {
-	int	(*init)(struct super_block *, u64, int, int, u64 *, int *);
+	int	(*init)(struct super_block *, u64, int);
 	void	(*free)(struct squashfs_sb_info *);
 	int	(*read)(struct super_block *, void *, int);
 	int	(*probe)(struct file_system_type *, int, const char *,
diff --git a/fs/squashfs/bdev.c b/fs/squashfs/bdev.c
index 497029b..20065b7 100644
--- a/fs/squashfs/bdev.c
+++ b/fs/squashfs/bdev.c
@@ -16,156 +16,55 @@ struct squashfs_bdev {
 	int b;				/* total number of buffer heads */
 };
 
-/*
- * Read the metadata block length, this is stored in the first two
- * bytes of the metadata block.
- */
-static struct buffer_head *get_block_length(struct super_block *sb,
-			u64 *cur_index, int *offset, int *length)
+static void bdev_free(struct squashfs_sb_info *msblk)
 {
-	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	struct squashfs_bdev *bdev = msblk->backend_data;
-	struct buffer_head *bh;
-
-	TRACE("get_block_length: cur_index=0x%llx, offset=%d\n",
-		(unsigned long long)*cur_index, *offset);
-	bh = sb_bread(sb, *cur_index);
-	if (bh == NULL)
-		return NULL;
 
-	if (bdev->devblksize - *offset == 1) {
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
-	TRACE("get_block_length: length=%d, offset=%d\n", *length, *offset);
-	return bh;
+	TRACE("bdev_free: bh=%p, bh_index=%d, b=%d\n",
+		bdev->bh, bdev->bh_index, bdev->b);
+	while (bdev->bh_index < bdev->b)
+		put_bh(bdev->bh[bdev->bh_index++]);
+	kfree(bdev->bh);
+	bdev->bh = NULL;
 }
 
-/*
- * Read a metadata block or datablock into memory.  Length is non-zero
- * if a datablock is being read (the size is stored elsewhere in the
- * filesystem), otherwise the length is obtained from the first two bytes of
- * the metadata block.  A bit in the length field indicates if the block
- * is stored uncompressed in the filesystem (usually because compression
- * generated a larger block - this does occasionally happen with zlib).
- */
-static int bdev_init(struct super_block *sb, u64 index, int length,
-			int srclength, u64 *next_index, int *compressed)
+static int bdev_init(struct super_block *sb, u64 index, int length)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	struct squashfs_bdev *bdev = msblk->backend_data;
-	struct buffer_head **bh;
 	u64 cur_index;			/* sector of next byte */
 	int bytes;			/* number of bytes handled */
-	int b;				/* for counting buffer heads */
 
-	TRACE("Entering bdev_init: index=0x%llx, length=0x%x, srclength=%d\n",
-		index, length, srclength);
-	bh = kcalloc((max_t(int, msblk->block_size, SQUASHFS_METADATA_SIZE)
-		      >> bdev->devblksize_log2) + 1,
-		     sizeof(*bh), GFP_KERNEL);
-	if (bh == NULL)
+	TRACE("Entering bdev_init: index=0x%llx, length=0x%x\n",
+		index, length);
+	bdev->bh = kcalloc((max_t(int, msblk->block_size, SQUASHFS_METADATA_SIZE)
+			    >> bdev->devblksize_log2) + 1,
+			   sizeof(*bdev->bh), GFP_KERNEL);
+	if (bdev->bh == NULL)
 		return -ENOMEM;
 
 	bdev->offset = index & ((1 << bdev->devblksize_log2) - 1);
 	cur_index = index >> bdev->devblksize_log2;
-	if (length) { /* FIXME: this logic and the comment above should be pulled out! */
-		/*
-		 * Datablock.
-		 */
-		bytes = -bdev->offset;
-		*compressed = SQUASHFS_COMPRESSED_BLOCK(length);
-		length = SQUASHFS_COMPRESSED_SIZE_BLOCK(length);
-		if (next_index)
-			*next_index = index + length;
-
-		TRACE("Block @ 0x%llx, %scompressed size %d, src size %d\n",
-			index, *compressed ? "" : "un", length, srclength);
-
-		if (length < 0 || length > srclength ||
-				(index + length) > msblk->bytes_used)
-			goto read_failure;
-
-		for (b = 0; bytes < length; b++, cur_index++) {
-			bh[b] = sb_getblk(sb, cur_index);
-			if (bh[b] == NULL)
-				goto block_release;
-			bytes += bdev->devblksize;
-		}
-		ll_rw_block(READ, b, bh);
-	} else {
-		/*
-		 * Metadata block.
-		 */
-		if ((index + 2) > msblk->bytes_used)
-			goto read_failure;
-
-		bh[0] = get_block_length(sb, &cur_index, &bdev->offset, &length);
-		if (bh[0] == NULL)
-			goto read_failure;
-		b = 1;
-
-		bytes = bdev->devblksize - bdev->offset;
-		*compressed = SQUASHFS_COMPRESSED(length);
-		length = SQUASHFS_COMPRESSED_SIZE(length);
-		if (next_index)
-			*next_index = index + length + 2;
 
-		TRACE("Block @ 0x%llx, %scompressed size %d\n", index,
-				*compressed ? "" : "un", length);
-
-		if (length < 0 || length > srclength ||
-					(index + length) > msblk->bytes_used)
-			goto block_release;
+	bdev->bh_index = 0;
+	bdev->length = length;
+	bdev->bytes_read = 0;
 
-		for (; bytes < length; b++) {
-			bh[b] = sb_getblk(sb, ++cur_index);
-			if (bh[b] == NULL)
-				goto block_release;
-			bytes += bdev->devblksize;
+	bytes = -bdev->offset;
+	for (bdev->b = 0; bytes < length; bdev->b++, cur_index++) {
+		if ((bdev->bh[bdev->b] = sb_getblk(sb, cur_index)) == NULL) {
+			ERROR("bdev_init failed to read block 0x%llx\n",
+			      (unsigned long long) index);
+			bdev_free(msblk);
+			return -EIO;
 		}
-		ll_rw_block(READ, b - 1, bh + 1);
+		bytes += bdev->devblksize;
 	}
+	ll_rw_block(READ, bdev->b, bdev->bh);
 
-	bdev->bh = bh;
-	bdev->length = length;
-	bdev->bytes_read = 0;
-	bdev->b = b;
-	bdev->bh_index = 0;
 	TRACE("bdev_init: allocated %d buffer heads at %p, returning length=%d",
-	      b, bh, length);
+	      bdev->b, bdev->bh, length);
 	return length;
-
-block_release:
-	while (b--)
-		put_bh(bh[b]);
-read_failure:
-	ERROR("bdev_init failed to read block 0x%llx\n",
-					(unsigned long long) index);
-	kfree(bh);
-	return -EIO;
-}
-
-static void bdev_free(struct squashfs_sb_info *msblk)
-{
-	struct squashfs_bdev *bdev = msblk->backend_data;
-
-	TRACE("bdev_free: bh=%p, bh_index=%d, b=%d\n",
-		bdev->bh, bdev->bh_index, bdev->b);
-	while (bdev->bh_index < bdev->b)
-		put_bh(bdev->bh[bdev->bh_index++]);
-	kfree(bdev->bh);
-	bdev->bh = NULL;
 }
 
 static int bdev_read(struct super_block *sb, void *buf, int len)
diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index 1c85063..eb33770 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -53,8 +53,37 @@ int squashfs_read_data(struct super_block *sb, void **buffer, u64 index,
 	int compressed;
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
 
-	length = msblk->backend->init(sb, index, length, srclength,
-					next_index, &compressed);
+	if (length) { /* Data block */
+		compressed = SQUASHFS_COMPRESSED_BLOCK(length);
+		length = SQUASHFS_COMPRESSED_SIZE_BLOCK(length);
+		TRACE("Block @ 0x%llx, %scompressed size %d, src size %d\n",
+			index, compressed ? "" : "un", length, srclength);
+	} else { /* Metadata block */
+		int read;
+		u16 metalen;
+
+		length = msblk->backend->init(sb, index, 2);
+		if (length < 0)
+			return length;
+		read = msblk->backend->read(sb, &metalen, 2);
+		if (read != 2)
+			goto read_failure;
+		msblk->backend->free(msblk);
+		length = le16_to_cpu(metalen);
+		compressed = SQUASHFS_COMPRESSED(length);
+		length = SQUASHFS_COMPRESSED_SIZE(length);
+		index += 2;
+		TRACE("Block @ 0x%llx, %scompressed size %d\n", index,
+				compressed ? "" : "un", length);
+	}
+	if (length < 0 || length > srclength ||
+	    (index + length) > msblk->bytes_used)
+		goto read_failure;
+
+	if (next_index)
+		*next_index = index + length;
+
+	length = msblk->backend->init(sb, index, length);
 	if (length < 0)
 		return length;
 
diff --git a/fs/squashfs/mtd.c b/fs/squashfs/mtd.c
index c9ba361..99f2d35 100644
--- a/fs/squashfs/mtd.c
+++ b/fs/squashfs/mtd.c
@@ -38,50 +38,18 @@ static int checked_mtd_read(struct super_block *sb, u64 index, int length,
 	return 0;
 }
 
-static int mtd_init(struct super_block *sb, u64 index, int length,
-		    int srclength, u64 *next_index, int *compressed)
+static int mtd_init(struct super_block *sb, u64 index, int length)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	struct squashfs_mtd *mtd = msblk->backend_data;
 
-	TRACE("Entering mtd_init: index=0x%llx, length=0x%x, srclength=%d\n",
-		index, length, srclength);
-
-	if (length) { /* datablock */
-		*compressed = SQUASHFS_COMPRESSED_BLOCK(length);
-		length = SQUASHFS_COMPRESSED_SIZE_BLOCK(length);
-		if (next_index)
-			*next_index = index + length;
-		TRACE("Block @ 0x%llx, %scompressed size %d, src size %d\n",
-			index, *compressed ? "" : "un", length, srclength);
-	} else { /* metadata block */
-		u16 metalen;
-		if ((index + 2) > msblk->bytes_used)
-			goto read_failure;
-		if (checked_mtd_read(sb, index, 2, &metalen))
-			goto read_failure;
-		length = le16_to_cpu(metalen);
-		*compressed = SQUASHFS_COMPRESSED(length);
-		length = SQUASHFS_COMPRESSED_SIZE(length);
-		if (next_index)
-			*next_index = index + length + 2;
-		TRACE("Block @ 0x%llx, %scompressed size %d\n", index,
-				*compressed ? "" : "un", length);
-		index += 2;
-	}
-	if (length < 0 || length > srclength ||
-			(index + length) > msblk->bytes_used)
-		goto read_failure;
+	TRACE("Entering mtd_init: index=0x%llx, length=0x%x\n",
+		index, length);
 
 	mtd->index = index;
 	mtd->length = length;
 	mtd->bytes_read = 0;
 	return length;
-
-read_failure:
-	ERROR("mtd_init failed to read block 0x%llx\n",
-					(unsigned long long) index);
-	return -EIO;
 }
 
 static void mtd_free(struct squashfs_sb_info *msblk)
-- 
1.5.6.5


--=-=-=--

From: wferi@niif.hu (Ferenc Wagner)
Date: Sun, 21 Mar 2010 22:38:00 +0100
Subject: [PATCH] squashfs: move the decompressors to the backend framework
Message-ID: <mailman.264.1269344143.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

---
 fs/squashfs/block.c        |   17 +----------------
 fs/squashfs/decompressor.h |   12 +++++-------
 fs/squashfs/lzma_wrapper.c |   27 +++++++++------------------
 fs/squashfs/zlib_wrapper.c |   44 ++++++++++++++++++--------------------------
 4 files changed, 33 insertions(+), 67 deletions(-)

diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index 8787aac..1c85063 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -39,18 +39,6 @@
 #include "decompressor.h"
 #include "backend.h"
 
-/* FIXME: here for a temporary cheat only */
-struct squashfs_bdev {
-	int devblksize;			/* FIXME: == s->s_blocksize(_bits)? */
-	unsigned short devblksize_log2;
-	int length;
-	int bytes_read;
-	struct buffer_head **bh;
-	int bh_index;			/* number of consumed buffer_heads */
-	int offset;			/* offset of next byte in buffer_head */
-	int b;				/* total number of buffer heads */
-};
-
 /*
  * Read and decompress a metadata block or datablock.  Length is non-zero
  * if a datablock is being read (the size is stored elsewhere in the
@@ -71,10 +59,7 @@ int squashfs_read_data(struct super_block *sb, void **buffer, u64 index,
 		return length;
 
 	if (compressed) {
-		struct squashfs_bdev *bdev = msblk->backend_data;
-		length = squashfs_decompress(msblk, buffer, bdev->bh, bdev->b,
-				bdev->offset, length, srclength, pages);
-		bdev->bh_index = bdev->b; /* temporary hack to avoid double free */
+		length = squashfs_decompress(sb, buffer, length, pages);
 		if (length < 0)
 			goto read_failure;
 	} else {
diff --git a/fs/squashfs/decompressor.h b/fs/squashfs/decompressor.h
index 7425f80..06b4233 100644
--- a/fs/squashfs/decompressor.h
+++ b/fs/squashfs/decompressor.h
@@ -26,8 +26,7 @@
 struct squashfs_decompressor {
 	void	*(*init)(struct squashfs_sb_info *);
 	void	(*free)(void *);
-	int	(*decompress)(struct squashfs_sb_info *, void **,
-		struct buffer_head **, int, int, int, int, int);
+	int	(*decompress)(struct super_block *, void **, int, int);
 	int	id;
 	char	*name;
 	int	supported;
@@ -45,11 +44,10 @@ static inline void squashfs_decompressor_free(struct squashfs_sb_info *msblk,
 		msblk->decompressor->free(s);
 }
 
-static inline int squashfs_decompress(struct squashfs_sb_info *msblk,
-	void **buffer, struct buffer_head **bh, int b, int offset, int length,
-	int srclength, int pages)
+static inline int squashfs_decompress(struct super_block *sb,
+	void **buffer, int length, int pages)
 {
-	return msblk->decompressor->decompress(msblk, buffer, bh, b, offset,
-		length, srclength, pages);
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	return msblk->decompressor->decompress(sb, buffer, length, pages);
 }
 #endif
diff --git a/fs/squashfs/lzma_wrapper.c b/fs/squashfs/lzma_wrapper.c
index 439798f..da571ce 100644
--- a/fs/squashfs/lzma_wrapper.c
+++ b/fs/squashfs/lzma_wrapper.c
@@ -32,6 +32,7 @@
 #include "squashfs_fs_i.h"
 #include "squashfs.h"
 #include "decompressor.h"
+#include "backend.h"
 
 struct squashfs_lzma {
 	void	*input;
@@ -86,29 +87,23 @@ static void lzma_free(void *strm)
 }
 
 
-static int lzma_uncompress(struct squashfs_sb_info *msblk, void **buffer,
-	struct buffer_head **bh, int b, int offset, int length, int srclength,
-	int pages)
+static int lzma_uncompress(struct super_block *sb, void **buffer,
+			   int length, int pages)
 {
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	struct squashfs_lzma *stream = msblk->stream;
 	void *buff = stream->input;
 	int avail, i, bytes = length, res;
 
-	TRACE("lzma_uncompress: bh=%p, b=%d, offset=%d, length=%d, srclength=%d,"
-		" pages=%d\n", bh, b, offset, length, srclength, pages);
+	TRACE("lzma_uncompress: length=%d, pages=%d\n", length, pages);
 	mutex_lock(&lzma_mutex);
 
-	for (i = 0; i < b; i++) {
-		wait_on_buffer(bh[i]);
-		if (!buffer_uptodate(bh[i]))
-			goto block_release;
-
-		avail = min(bytes, msblk->devblksize - offset);
-		memcpy(buff, bh[i]->b_data + offset, avail);
+	while ((avail = msblk->backend->read(sb, buff, length))) {
+		if (avail < 0)
+			goto failed;
+		TRACE("read %d bytes\n", avail);
 		buff += avail;
 		bytes -= avail;
-		offset = 0;
-		put_bh(bh[i]);
 	}
 
 	lzma_error = 0;
@@ -131,10 +126,6 @@ static int lzma_uncompress(struct squashfs_sb_info *msblk, void **buffer,
 	mutex_unlock(&lzma_mutex);
 	return res;
 
-block_release:
-	for (; i < b; i++)
-		put_bh(bh[i]);
-
 failed:
 	mutex_unlock(&lzma_mutex);
 
diff --git a/fs/squashfs/zlib_wrapper.c b/fs/squashfs/zlib_wrapper.c
index 4dd70e0..70c7571 100644
--- a/fs/squashfs/zlib_wrapper.c
+++ b/fs/squashfs/zlib_wrapper.c
@@ -31,6 +31,7 @@
 #include "squashfs_fs_i.h"
 #include "squashfs.h"
 #include "decompressor.h"
+#include "backend.h"
 
 static void *zlib_init(struct squashfs_sb_info *dummy)
 {
@@ -61,13 +62,18 @@ static void zlib_free(void *strm)
 }
 
 
-static int zlib_uncompress(struct squashfs_sb_info *msblk, void **buffer,
-	struct buffer_head **bh, int b, int offset, int length, int srclength,
-	int pages)
+static int zlib_uncompress(struct super_block *sb, void **buffer,
+	int length, int pages)
 {
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	int zlib_err = 0, zlib_init = 0;
-	int avail, bytes, k = 0, page = 0;
+	int bytes, page = 0;
 	z_stream *stream = msblk->stream;
+	/* Copying is required by the backend interface for now. */
+	void *input = kmalloc (PAGE_CACHE_SIZE, GFP_KERNEL);
+
+	if (!input)
+		return -ENOMEM;
 
 	mutex_lock(&msblk->read_data_mutex);
 
@@ -76,22 +82,13 @@ static int zlib_uncompress(struct squashfs_sb_info *msblk, void **buffer,
 
 	bytes = length;
 	do {
-		if (stream->avail_in == 0 && k < b) {
-			avail = min(bytes, msblk->devblksize - offset);
-			bytes -= avail;
-			wait_on_buffer(bh[k]);
-			if (!buffer_uptodate(bh[k]))
+		if (stream->avail_in == 0) {
+			stream->avail_in = msblk->backend->read(sb, input, PAGE_CACHE_SIZE);
+			if (!stream->avail_in) {
+				ERROR("unexpected end of input\n");
 				goto release_mutex;
-
-			if (avail == 0) {
-				offset = 0;
-				put_bh(bh[k++]);
-				continue;
 			}
-
-			stream->next_in = bh[k]->b_data + offset;
-			stream->avail_in = avail;
-			offset = 0;
+			stream->next_in = input;
 		}
 
 		if (stream->avail_out == 0 && page < pages) {
@@ -103,8 +100,7 @@ static int zlib_uncompress(struct squashfs_sb_info *msblk, void **buffer,
 			zlib_err = zlib_inflateInit(stream);
 			if (zlib_err != Z_OK) {
 				ERROR("zlib_inflateInit returned unexpected "
-					"result 0x%x, srclength %d\n",
-					zlib_err, srclength);
+					"result 0x%x\n", zlib_err);
 				goto release_mutex;
 			}
 			zlib_init = 1;
@@ -112,8 +108,6 @@ static int zlib_uncompress(struct squashfs_sb_info *msblk, void **buffer,
 
 		zlib_err = zlib_inflate(stream, Z_SYNC_FLUSH);
 
-		if (stream->avail_in == 0 && k < b)
-			put_bh(bh[k++]);
 	} while (zlib_err == Z_OK);
 
 	if (zlib_err != Z_STREAM_END) {
@@ -128,14 +122,12 @@ static int zlib_uncompress(struct squashfs_sb_info *msblk, void **buffer,
 	}
 
 	mutex_unlock(&msblk->read_data_mutex);
+	kfree(input);
 	return stream->total_out;
 
 release_mutex:
 	mutex_unlock(&msblk->read_data_mutex);
-
-	for (; k < b; k++)
-		put_bh(bh[k]);
-
+	kfree(input);
 	return -EIO;
 }
 
-- 
1.5.6.5

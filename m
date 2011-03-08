Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwsJ4-0008S7-Dz
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 08:30:17 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH v3 6/7] UBIFS: use max_write_size for write-buffers
Date: Tue,  8 Mar 2011 10:32:47 +0200
Message-Id: <1299573168-27760-7-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1299573168-27760-1-git-send-email-dedekind1@gmail.com>
References: <1299573168-27760-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Switch write-buffers from 'c->min_io_size' to 'c->max_write_size' which
presumably has to be more write speed-efficient. However, when write-buffer
is synchronized, write only the the min. I/O units which contain the
data, do not write whole write-buffer. This is more space-efficient.

Additionally, this patch takes into account that the LEB might not start
from the max. write unit-aligned address.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c |  181 +++++++++++++++++++++++++++++++++++++++++++--------------
 1 files changed, 137 insertions(+), 44 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 7c2a014..dfd168b 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -31,6 +31,26 @@
  * buffer is full or when it is not used for some time (by timer). This is
  * similar to the mechanism is used by JFFS2.
  *
+ * UBIFS distinguishes between minimum write size (@c->min_io_size) and maximum
+ * write size (@c->max_write_size). The latter is the maximum amount of bytes
+ * the underlying flash is able to program at a time, and writing in
+ * @c->max_write_size units should presumably be faster. Obviously,
+ * @c->min_io_size <= @c->max_write_size. Write-buffers are of
+ * @c->max_write_size bytes in size for maximum performance. However, when a
+ * write-buffer is flushed, only the portion of it (aligned to @c->min_io_size
+ * boundary) which contains data is written, not the whole write-buffer,
+ * because this is more space-efficient.
+ *
+ * This optimization adds few complications to the code. Indeed, on the one
+ * hand, we want to write in optimal @c->max_write_size bytes chunks, which
+ * also means aligning writes at the @c->max_write_size bytes offsets. On the
+ * other hand, we do not want to waste space when synchronizing the write
+ * buffer, so during synchronization we writes in smaller chunks. And this makes
+ * the next write offset to be not aligned to @c->max_write_size bytes. So the
+ * have to make sure that the write-buffer offset (@wbuf->offs) becomes aligned
+ * to @c->max_write_size bytes again. We do this by temporarily shrinking
+ * write-buffer size (@wbuf->size).
+ *
  * Write-buffers are defined by 'struct ubifs_wbuf' objects and protected by
  * mutexes defined inside these objects. Since sometimes upper-level code
  * has to lock the write-buffer (e.g. journal space reservation code), many
@@ -46,8 +66,8 @@
  * UBIFS uses padding when it pads to the next min. I/O unit. In this case it
  * uses padding nodes or padding bytes, if the padding node does not fit.
  *
- * All UBIFS nodes are protected by CRC checksums and UBIFS checks all nodes
- * every time they are read from the flash media.
+ * All UBIFS nodes are protected by CRC checksums and UBIFS checks CRC when
+ * they are read from the flash media.
  */
 
 #include <linux/crc32.h>
@@ -347,11 +367,17 @@ static void cancel_wbuf_timer_nolock(struct ubifs_wbuf *wbuf)
  *
  * This function synchronizes write-buffer @buf and returns zero in case of
  * success or a negative error code in case of failure.
+ *
+ * Note, although write-buffers are of @c->max_write_size, this function does
+ * not necessarily writes all @c->max_write_size bytes to the flash. Instead,
+ * if the write-buffer is only partially filled with data, only the used part
+ * of the write-buffer (aligned on @c->min_io_size boundary) is synchronized.
+ * This way we waste less space.
  */
 int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 {
 	struct ubifs_info *c = wbuf->c;
-	int err, dirt;
+	int err, dirt, sync_len;
 
 	cancel_wbuf_timer_nolock(wbuf);
 	if (!wbuf->used || wbuf->lnum == -1)
@@ -366,26 +392,48 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 	ubifs_assert(wbuf->size <= c->max_write_size);
 	ubifs_assert(wbuf->size % c->min_io_size == 0);
 	ubifs_assert(!c->ro_media && !c->ro_mount);
+	if (c->leb_size - wbuf->offs >= c->max_write_size)
+		ubifs_assert(!((wbuf->offs + wbuf->size) % c->max_write_size ));
 
 	if (c->ro_error)
 		return -EROFS;
 
-	ubifs_pad(c, wbuf->buf + wbuf->used, wbuf->avail);
+	/*
+	 * Do not write whole write buffer but write only the minimum necessary
+	 * amount of min. I/O units.
+	 */
+	sync_len = ALIGN(wbuf->used, c->min_io_size);
+	dirt = sync_len - wbuf->used;
+	if (dirt)
+		ubifs_pad(c, wbuf->buf + wbuf->used, dirt);
 	err = ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf, wbuf->offs,
-			    wbuf->size, wbuf->dtype);
+			    sync_len, wbuf->dtype);
 	if (err) {
 		ubifs_err("cannot write %d bytes to LEB %d:%d",
-			  wbuf->size, wbuf->lnum, wbuf->offs);
+			  sync_len, wbuf->lnum, wbuf->offs);
 		dbg_dump_stack();
 		return err;
 	}
 
-	dirt = wbuf->avail;
-
 	spin_lock(&wbuf->lock);
-	wbuf->offs += wbuf->size;
-	wbuf->avail = c->min_io_size;
-	wbuf->size = c->min_io_size;
+	wbuf->offs += sync_len;
+	/*
+	 * Now @wbuf->offs is not necessarily aligned to @c->max_write_size.
+	 * But our goal is to optimize writes and make sure we write in
+	 * @c->max_write_size chunks and to @c->max_write_size-aligned offset.
+	 * Thus, if @wbuf->offs is not aligned to @c->max_write_size now, make
+	 * sure that @wbuf->offs + @wbuf->size is aligned to
+	 * @c->max_write_size. This way we make sure that after next
+	 * write-buffer flush we are again at the optimal offset (aligned to
+	 * @c->max_write_size).
+	 */
+	if (c->leb_size - wbuf->offs < c->max_write_size)
+		wbuf->size = c->leb_size - wbuf->offs;
+	else if (wbuf->offs & (c->max_write_size - 1))
+		wbuf->size = ALIGN(wbuf->offs, c->max_write_size) - wbuf->offs;
+	else
+		wbuf->size = c->max_write_size;
+	wbuf->avail = wbuf->size;
 	wbuf->used = 0;
 	wbuf->next_ino = 0;
 	spin_unlock(&wbuf->lock);
@@ -428,8 +476,13 @@ int ubifs_wbuf_seek_nolock(struct ubifs_wbuf *wbuf, int lnum, int offs,
 	spin_lock(&wbuf->lock);
 	wbuf->lnum = lnum;
 	wbuf->offs = offs;
-	wbuf->avail = c->min_io_size;
-	wbuf->size = c->min_io_size;
+	if (c->leb_size - wbuf->offs < c->max_write_size)
+		wbuf->size = c->leb_size - wbuf->offs;
+	else if (wbuf->offs & (c->max_write_size - 1))
+		wbuf->size = ALIGN(wbuf->offs, c->max_write_size) - wbuf->offs;
+	else
+		wbuf->size = c->max_write_size;
+	wbuf->avail = wbuf->size;
 	wbuf->used = 0;
 	spin_unlock(&wbuf->lock);
 	wbuf->dtype = dtype;
@@ -509,8 +562,9 @@ out_timers:
  *
  * This function writes data to flash via write-buffer @wbuf. This means that
  * the last piece of the node won't reach the flash media immediately if it
- * does not take whole minimal I/O unit. Instead, the node will sit in RAM
- * until the write-buffer is synchronized (e.g., by timer).
+ * does not take whole max. write unit (@c->max_write_size). Instead, the node
+ * will sit in RAM until the write-buffer is synchronized (e.g., by timer, or
+ * because more data are appended to the write-buffer).
  *
  * This function returns zero in case of success and a negative error code in
  * case of failure. If the node cannot be written because there is no more
@@ -533,6 +587,8 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	ubifs_assert(wbuf->size % c->min_io_size == 0);
 	ubifs_assert(mutex_is_locked(&wbuf->io_mutex));
 	ubifs_assert(!c->ro_media && !c->ro_mount);
+	if (c->leb_size - wbuf->offs >= c->max_write_size)
+		ubifs_assert(!((wbuf->offs + wbuf->size) % c->max_write_size ));
 
 	if (c->leb_size - wbuf->offs - wbuf->used < aligned_len) {
 		err = -ENOSPC;
@@ -561,9 +617,12 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 				goto out;
 
 			spin_lock(&wbuf->lock);
-			wbuf->offs += c->min_io_size;
-			wbuf->avail = c->min_io_size;
-			wbuf->size = c->min_io_size;
+			wbuf->offs += wbuf->size;
+			if (c->leb_size - wbuf->offs >= c->max_write_size)
+				wbuf->size = c->max_write_size;
+			else
+				wbuf->size = c->leb_size - wbuf->offs;
+			wbuf->avail = wbuf->size;
 			wbuf->used = 0;
 			wbuf->next_ino = 0;
 			spin_unlock(&wbuf->lock);
@@ -577,33 +636,57 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 		goto exit;
 	}
 
-	/*
-	 * The node is large enough and does not fit entirely within current
-	 * minimal I/O unit. We have to fill and flush write-buffer and switch
-	 * to the next min. I/O unit.
-	 */
-	dbg_io("flush jhead %s wbuf to LEB %d:%d",
-	       dbg_jhead(wbuf->jhead), wbuf->lnum, wbuf->offs);
-	memcpy(wbuf->buf + wbuf->used, buf, wbuf->avail);
-	err = ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf, wbuf->offs,
-			    wbuf->size, wbuf->dtype);
-	if (err)
-		goto out;
+	offs = wbuf->offs;
+	written = 0;
 
-	offs = wbuf->offs + wbuf->size;
-	len -= wbuf->avail;
-	aligned_len -= wbuf->avail;
-	written = wbuf->avail;
+	if (wbuf->used) {
+		/*
+		 * The node is large enough and does not fit entirely within
+		 * current available space. We have to fill and flush
+		 * write-buffer and switch to the next max. write unit.
+		 */
+		dbg_io("flush jhead %s wbuf to LEB %d:%d",
+		       dbg_jhead(wbuf->jhead), wbuf->lnum, wbuf->offs);
+		memcpy(wbuf->buf + wbuf->used, buf, wbuf->avail);
+		err = ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf, wbuf->offs,
+				    wbuf->size, wbuf->dtype);
+		if (err)
+			goto out;
+
+		offs += wbuf->size;
+		len -= wbuf->avail;
+		aligned_len -= wbuf->avail;
+		written += wbuf->avail;
+	} else if (wbuf->offs & (c->max_write_size - 1)) {
+		/*
+		 * The write-buffer offset is not aligned to
+		 * @c->max_write_size and @wbuf->size is less than
+		 * @c->max_write_size. Write @wbuf->size bytes to make sure the
+		 * following writes are done in optimal @c->max_write_size
+		 * chunks.
+		 */
+		dbg_io("write %d bytes to LEB %d:%d",
+		       wbuf->size, wbuf->lnum, wbuf->offs);
+		err = ubi_leb_write(c->ubi, wbuf->lnum, buf, wbuf->offs,
+				    wbuf->size, wbuf->dtype);
+		if (err)
+			goto out;
+
+		offs += wbuf->size;
+		len -= wbuf->size;
+		aligned_len -= wbuf->size;
+		written += wbuf->size;
+	}
 
 	/*
-	 * The remaining data may take more whole min. I/O units, so write the
-	 * remains multiple to min. I/O unit size directly to the flash media.
+	 * The remaining data may take more whole max. write units, so write the
+	 * remains multiple to max. write unit size directly to the flash media.
 	 * We align node length to 8-byte boundary because we anyway flash wbuf
 	 * if the remaining space is less than 8 bytes.
 	 */
-	n = aligned_len >> c->min_io_shift;
+	n = aligned_len >> c->max_write_shift;
 	if (n) {
-		n <<= c->min_io_shift;
+		n <<= c->max_write_shift;
 		dbg_io("write %d bytes to LEB %d:%d", n, wbuf->lnum, offs);
 		err = ubi_leb_write(c->ubi, wbuf->lnum, buf + written, offs, n,
 				    wbuf->dtype);
@@ -619,15 +702,18 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	if (aligned_len)
 		/*
 		 * And now we have what's left and what does not take whole
-		 * min. I/O unit, so write it to the write-buffer and we are
+		 * max. write unit, so write it to the write-buffer and we are
 		 * done.
 		 */
 		memcpy(wbuf->buf, buf + written, len);
 
 	wbuf->offs = offs;
+	if (c->leb_size - wbuf->offs >= c->max_write_size)
+		wbuf->size = c->max_write_size;
+	else
+		wbuf->size = c->leb_size - wbuf->offs;
+	wbuf->avail = wbuf->size - aligned_len;
 	wbuf->used = aligned_len;
-	wbuf->avail = c->min_io_size - aligned_len;
-	wbuf->size = c->min_io_size;
 	wbuf->next_ino = 0;
 	spin_unlock(&wbuf->lock);
 
@@ -851,11 +937,11 @@ int ubifs_wbuf_init(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
 {
 	size_t size;
 
-	wbuf->buf = kmalloc(c->min_io_size, GFP_KERNEL);
+	wbuf->buf = kmalloc(c->max_write_size, GFP_KERNEL);
 	if (!wbuf->buf)
 		return -ENOMEM;
 
-	size = (c->min_io_size / UBIFS_CH_SZ + 1) * sizeof(ino_t);
+	size = (c->max_write_size / UBIFS_CH_SZ + 1) * sizeof(ino_t);
 	wbuf->inodes = kmalloc(size, GFP_KERNEL);
 	if (!wbuf->inodes) {
 		kfree(wbuf->buf);
@@ -865,7 +951,14 @@ int ubifs_wbuf_init(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
 
 	wbuf->used = 0;
 	wbuf->lnum = wbuf->offs = -1;
-	wbuf->avail = wbuf->size = c->min_io_size;
+	/*
+	 * If the LEB starts at the max. write size aligned address, then
+	 * write-buffer size has to be set to @c->max_write_size. Otherwise,
+	 * set it to something smaller so that it ends at the closest max.
+	 * write size boundary.
+	 */
+	size = c->max_write_size - (c->leb_start % c->max_write_size);
+	wbuf->avail = wbuf->size = size;
 	wbuf->dtype = UBI_UNKNOWN;
 	wbuf->sync_callback = NULL;
 	mutex_init(&wbuf->io_mutex);
-- 
1.7.2.3

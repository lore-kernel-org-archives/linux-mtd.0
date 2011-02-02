Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PkXwI-0004eh-Fo
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 08:19:50 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>,
	Holger Brunck <holger.brunck@keymile.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: [PATCH 6/7] UBIFS: amend commentaries in io.c to match new situation
Date: Wed,  2 Feb 2011 10:21:56 +0200
Message-Id: <1296634917-19335-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1296634917-19335-1-git-send-email-dedekind1@gmail.com>
References: <1296634917-19335-1-git-send-email-dedekind1@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Now write-buffer size is 'c->max_write_size', and some comments
are out-of-date. This patch fixes them as well as adds few new
comments.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c |   35 ++++++++++++++++++++++++++---------
 1 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 37866b6..c122bc5 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -31,6 +31,16 @@
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
  * Write-buffers are defined by 'struct ubifs_wbuf' objects and protected by
  * mutexes defined inside these objects. Since sometimes upper-level code
  * has to lock the write-buffer (e.g. journal space reservation code), many
@@ -46,8 +56,8 @@
  * UBIFS uses padding when it pads to the next min. I/O unit. In this case it
  * uses padding nodes or padding bytes, if the padding node does not fit.
  *
- * All UBIFS nodes are protected by CRC checksums and UBIFS checks all nodes
- * every time they are read from the flash media.
+ * All UBIFS nodes are protected by CRC checksums and UBIFS checks CRC when
+ * they are read from the flash media.
  */
 
 #include <linux/crc32.h>
@@ -347,6 +357,12 @@ static void cancel_wbuf_timer_nolock(struct ubifs_wbuf *wbuf)
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
@@ -518,8 +534,9 @@ out_timers:
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
@@ -590,8 +607,8 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 
 	/*
 	 * The node is large enough and does not fit entirely within current
-	 * minimal I/O unit. We have to fill and flush write-buffer and switch
-	 * to the next min. I/O unit.
+	 * available space. We have to fill and flush write-buffer and switch
+	 * to the next max. write unit.
 	 */
 	dbg_io("flush jhead %s wbuf to LEB %d:%d",
 	       dbg_jhead(wbuf->jhead), wbuf->lnum, wbuf->offs);
@@ -607,8 +624,8 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	written = wbuf->avail;
 
 	/*
-	 * The remaining data may take more whole min. I/O units, so write the
-	 * remains multiple to min. I/O unit size directly to the flash media.
+	 * The remaining data may take more whole max. write units, so write the
+	 * remains multiple to max. write unit size directly to the flash media.
 	 * We align node length to 8-byte boundary because we anyway flash wbuf
 	 * if the remaining space is less than 8 bytes.
 	 */
@@ -630,7 +647,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	if (aligned_len)
 		/*
 		 * And now we have what's left and what does not take whole
-		 * min. I/O unit, so write it to the write-buffer and we are
+		 * max. write unit, so write it to the write-buffer and we are
 		 * done.
 		 */
 		memcpy(wbuf->buf, buf + written, len);
-- 
1.7.2.3

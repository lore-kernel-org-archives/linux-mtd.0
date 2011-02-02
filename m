Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PkXwI-0004em-Iz
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 08:19:50 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>,
	Holger Brunck <holger.brunck@keymile.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: [PATCH 4/7] UBIFS: use max_write_size for write-buffers
Date: Wed,  2 Feb 2011 10:21:55 +0200
Message-Id: <1296634917-19335-5-git-send-email-dedekind1@gmail.com>
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

Switch write-buffers from 'c->min_io_size' to 'c->max_write_size' which
presumably has to be more write speed-efficient. However, when write-buffer
is synchronized, write only the the min. I/O units which contain the
data, do not write whole write-buffer. This is more space-efficient.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c |   55 ++++++++++++++++++++++++++++++++++---------------------
 1 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 7c2a014..37866b6 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -351,7 +351,7 @@ static void cancel_wbuf_timer_nolock(struct ubifs_wbuf *wbuf)
 int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 {
 	struct ubifs_info *c = wbuf->c;
-	int err, dirt;
+	int err, dirt, sync_len;
 
 	cancel_wbuf_timer_nolock(wbuf);
 	if (!wbuf->used || wbuf->lnum == -1)
@@ -370,22 +370,29 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
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
+	wbuf->size = c->leb_size - wbuf->offs;
+	if (wbuf->size > c->max_write_size)
+		wbuf->size = c->max_write_size;
+	wbuf->avail = wbuf->size;
 	wbuf->used = 0;
 	wbuf->next_ino = 0;
 	spin_unlock(&wbuf->lock);
@@ -428,8 +435,10 @@ int ubifs_wbuf_seek_nolock(struct ubifs_wbuf *wbuf, int lnum, int offs,
 	spin_lock(&wbuf->lock);
 	wbuf->lnum = lnum;
 	wbuf->offs = offs;
-	wbuf->avail = c->min_io_size;
-	wbuf->size = c->min_io_size;
+	wbuf->size = c->leb_size - wbuf->offs;
+	if (wbuf->size > c->max_write_size)
+		wbuf->size = c->max_write_size;
+	wbuf->avail = wbuf->size;
 	wbuf->used = 0;
 	spin_unlock(&wbuf->lock);
 	wbuf->dtype = dtype;
@@ -561,9 +570,11 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 				goto out;
 
 			spin_lock(&wbuf->lock);
-			wbuf->offs += c->min_io_size;
-			wbuf->avail = c->min_io_size;
-			wbuf->size = c->min_io_size;
+			wbuf->offs += wbuf->size;
+			wbuf->size = c->leb_size - wbuf->offs;
+			if (wbuf->size > c->max_write_size)
+				wbuf->size = c->max_write_size;
+			wbuf->avail = wbuf->size;
 			wbuf->used = 0;
 			wbuf->next_ino = 0;
 			spin_unlock(&wbuf->lock);
@@ -601,9 +612,9 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
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
@@ -626,8 +637,10 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 
 	wbuf->offs = offs;
 	wbuf->used = aligned_len;
-	wbuf->avail = c->min_io_size - aligned_len;
-	wbuf->size = c->min_io_size;
+	wbuf->size = c->leb_size - wbuf->offs;
+	if (wbuf->size > c->max_write_size)
+		wbuf->size = c->max_write_size;
+	wbuf->avail = wbuf->size - aligned_len;
 	wbuf->next_ino = 0;
 	spin_unlock(&wbuf->lock);
 
@@ -851,11 +864,11 @@ int ubifs_wbuf_init(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
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
@@ -865,7 +878,7 @@ int ubifs_wbuf_init(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
 
 	wbuf->used = 0;
 	wbuf->lnum = wbuf->offs = -1;
-	wbuf->avail = wbuf->size = c->min_io_size;
+	wbuf->avail = wbuf->size = c->max_write_size;
 	wbuf->dtype = UBI_UNKNOWN;
 	wbuf->sync_callback = NULL;
 	mutex_init(&wbuf->io_mutex);
-- 
1.7.2.3

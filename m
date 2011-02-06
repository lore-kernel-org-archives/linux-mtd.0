Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm4St-0007tA-Lr
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 13:15:47 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>,
	Holger Brunck <holger.brunck@keymile.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH v2 3/5] UBIFS: introduce write-buffer size field
Date: Sun,  6 Feb 2011 15:17:48 +0200
Message-Id: <1296998270-19853-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
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

Currently we assume write-buffer size is always min_io_size. But
this is about to change and write-buffers may be of variable size.
Namely, they will be of max_write_size at the beginning, but will
get smaller when we are approaching the end of LEB.

This is a preparation patch which introduces 'size' field in
the write-buffer structure which carries the current write-buffer
size.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c    |   28 +++++++++++++++++++---------
 fs/ubifs/ubifs.h |    2 ++
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index d1fe562..7c2a014 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -361,7 +361,10 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 	dbg_io("LEB %d:%d, %d bytes, jhead %s",
 	       wbuf->lnum, wbuf->offs, wbuf->used, dbg_jhead(wbuf->jhead));
 	ubifs_assert(!(wbuf->avail & 7));
-	ubifs_assert(wbuf->offs + c->min_io_size <= c->leb_size);
+	ubifs_assert(wbuf->offs + wbuf->size <= c->leb_size);
+	ubifs_assert(wbuf->size >= c->min_io_size);
+	ubifs_assert(wbuf->size <= c->max_write_size);
+	ubifs_assert(wbuf->size % c->min_io_size == 0);
 	ubifs_assert(!c->ro_media && !c->ro_mount);
 
 	if (c->ro_error)
@@ -369,10 +372,10 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 
 	ubifs_pad(c, wbuf->buf + wbuf->used, wbuf->avail);
 	err = ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf, wbuf->offs,
-			    c->min_io_size, wbuf->dtype);
+			    wbuf->size, wbuf->dtype);
 	if (err) {
 		ubifs_err("cannot write %d bytes to LEB %d:%d",
-			  c->min_io_size, wbuf->lnum, wbuf->offs);
+			  wbuf->size, wbuf->lnum, wbuf->offs);
 		dbg_dump_stack();
 		return err;
 	}
@@ -380,8 +383,9 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 	dirt = wbuf->avail;
 
 	spin_lock(&wbuf->lock);
-	wbuf->offs += c->min_io_size;
+	wbuf->offs += wbuf->size;
 	wbuf->avail = c->min_io_size;
+	wbuf->size = c->min_io_size;
 	wbuf->used = 0;
 	wbuf->next_ino = 0;
 	spin_unlock(&wbuf->lock);
@@ -425,6 +429,7 @@ int ubifs_wbuf_seek_nolock(struct ubifs_wbuf *wbuf, int lnum, int offs,
 	wbuf->lnum = lnum;
 	wbuf->offs = offs;
 	wbuf->avail = c->min_io_size;
+	wbuf->size = c->min_io_size;
 	wbuf->used = 0;
 	spin_unlock(&wbuf->lock);
 	wbuf->dtype = dtype;
@@ -522,7 +527,10 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	ubifs_assert(len > 0 && wbuf->lnum >= 0 && wbuf->lnum < c->leb_cnt);
 	ubifs_assert(wbuf->offs >= 0 && wbuf->offs % c->min_io_size == 0);
 	ubifs_assert(!(wbuf->offs & 7) && wbuf->offs <= c->leb_size);
-	ubifs_assert(wbuf->avail > 0 && wbuf->avail <= c->min_io_size);
+	ubifs_assert(wbuf->avail > 0 && wbuf->avail <= wbuf->size);
+	ubifs_assert(wbuf->size >= c->min_io_size);
+	ubifs_assert(wbuf->size <= c->max_write_size);
+	ubifs_assert(wbuf->size % c->min_io_size == 0);
 	ubifs_assert(mutex_is_locked(&wbuf->io_mutex));
 	ubifs_assert(!c->ro_media && !c->ro_mount);
 
@@ -547,7 +555,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 			dbg_io("flush jhead %s wbuf to LEB %d:%d",
 			       dbg_jhead(wbuf->jhead), wbuf->lnum, wbuf->offs);
 			err = ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf,
-					    wbuf->offs, c->min_io_size,
+					    wbuf->offs, wbuf->size,
 					    wbuf->dtype);
 			if (err)
 				goto out;
@@ -555,6 +563,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 			spin_lock(&wbuf->lock);
 			wbuf->offs += c->min_io_size;
 			wbuf->avail = c->min_io_size;
+			wbuf->size = c->min_io_size;
 			wbuf->used = 0;
 			wbuf->next_ino = 0;
 			spin_unlock(&wbuf->lock);
@@ -577,11 +586,11 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	       dbg_jhead(wbuf->jhead), wbuf->lnum, wbuf->offs);
 	memcpy(wbuf->buf + wbuf->used, buf, wbuf->avail);
 	err = ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf, wbuf->offs,
-			    c->min_io_size, wbuf->dtype);
+			    wbuf->size, wbuf->dtype);
 	if (err)
 		goto out;
 
-	offs = wbuf->offs + c->min_io_size;
+	offs = wbuf->offs + wbuf->size;
 	len -= wbuf->avail;
 	aligned_len -= wbuf->avail;
 	written = wbuf->avail;
@@ -618,6 +627,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	wbuf->offs = offs;
 	wbuf->used = aligned_len;
 	wbuf->avail = c->min_io_size - aligned_len;
+	wbuf->size = c->min_io_size;
 	wbuf->next_ino = 0;
 	spin_unlock(&wbuf->lock);
 
@@ -855,7 +865,7 @@ int ubifs_wbuf_init(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
 
 	wbuf->used = 0;
 	wbuf->lnum = wbuf->offs = -1;
-	wbuf->avail = c->min_io_size;
+	wbuf->avail = wbuf->size = c->min_io_size;
 	wbuf->dtype = UBI_UNKNOWN;
 	wbuf->sync_callback = NULL;
 	mutex_init(&wbuf->io_mutex);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 8b51949..293ea97 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -646,6 +646,7 @@ typedef int (*ubifs_lpt_scan_callback)(struct ubifs_info *c,
  * @offs: write-buffer offset in this logical eraseblock
  * @avail: number of bytes available in the write-buffer
  * @used:  number of used bytes in the write-buffer
+ * @size: write-buffer size (in [@c->min_io_size, @c->max_write_size] range)
  * @dtype: type of data stored in this LEB (%UBI_LONGTERM, %UBI_SHORTTERM,
  * %UBI_UNKNOWN)
  * @jhead: journal head the mutex belongs to (note, needed only to shut lockdep
@@ -680,6 +681,7 @@ struct ubifs_wbuf {
 	int offs;
 	int avail;
 	int used;
+	int size;
 	int dtype;
 	int jhead;
 	int (*sync_callback)(struct ubifs_info *c, int lnum, int free, int pad);
-- 
1.7.2.3

Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQH-0003Yv-RD
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTrE011091
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/20] UBIFS: remove unnecessary stack variable
Date: Mon, 16 May 2011 10:44:28 +0300
Message-Id: <1305531879-19311-10-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
References: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This is patch removes an unnecessary 'offs' variable from 'ubifs_wbuf_write_nolock()'
- we can just keep 'wbuf->offs' up-to-date instead. This patch is very minor
the only motivation for it was that it is cleaner to keep wbuf->offs up-to-date
by the time we call 'ubifs_leb_write()'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 6cc0931..67bbde3 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -573,7 +573,7 @@ out_timers:
 int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 {
 	struct ubifs_info *c = wbuf->c;
-	int err, written, n, aligned_len = ALIGN(len, 8), offs;
+	int err, written, n, aligned_len = ALIGN(len, 8);
 
 	dbg_io("%d bytes (%s) to jhead %s wbuf at LEB %d:%d", len,
 	       dbg_ntype(((struct ubifs_ch *)buf)->node_type),
@@ -636,7 +636,6 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 		goto exit;
 	}
 
-	offs = wbuf->offs;
 	written = 0;
 
 	if (wbuf->used) {
@@ -653,7 +652,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 		if (err)
 			goto out;
 
-		offs += wbuf->size;
+		wbuf->offs += wbuf->size;
 		len -= wbuf->avail;
 		aligned_len -= wbuf->avail;
 		written += wbuf->avail;
@@ -672,7 +671,7 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 		if (err)
 			goto out;
 
-		offs += wbuf->size;
+		wbuf->offs += wbuf->size;
 		len -= wbuf->size;
 		aligned_len -= wbuf->size;
 		written += wbuf->size;
@@ -687,12 +686,13 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	n = aligned_len >> c->max_write_shift;
 	if (n) {
 		n <<= c->max_write_shift;
-		dbg_io("write %d bytes to LEB %d:%d", n, wbuf->lnum, offs);
-		err = ubi_leb_write(c->ubi, wbuf->lnum, buf + written, offs, n,
-				    wbuf->dtype);
+		dbg_io("write %d bytes to LEB %d:%d", n, wbuf->lnum,
+		       wbuf->offs);
+		err = ubi_leb_write(c->ubi, wbuf->lnum, buf + written,
+				    wbuf->offs, n, wbuf->dtype);
 		if (err)
 			goto out;
-		offs += n;
+		wbuf->offs += n;
 		aligned_len -= n;
 		len -= n;
 		written += n;
@@ -707,7 +707,6 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 		 */
 		memcpy(wbuf->buf, buf + written, len);
 
-	wbuf->offs = offs;
 	if (c->leb_size - wbuf->offs >= c->max_write_size)
 		wbuf->size = c->max_write_size;
 	else
-- 
1.7.2.3

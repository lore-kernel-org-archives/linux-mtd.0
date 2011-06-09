Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb70-0002X1-CK
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:24 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEP028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:08 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 25/30] UBIFS: switch to ubifs_leb_write
Date: Thu,  9 Jun 2011 12:05:05 +0300
Message-Id: <1307610310-28691-26-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Stop using 'ubi_leb_write()' directly and switch to the 'ubifs_leb_write()'
helper.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c |   36 ++++++++++++++----------------------
 1 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index f58f11b..a0c5fb4 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -523,14 +523,10 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 	dirt = sync_len - wbuf->used;
 	if (dirt)
 		ubifs_pad(c, wbuf->buf + wbuf->used, dirt);
-	err = ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf, wbuf->offs,
-			    sync_len, wbuf->dtype);
-	if (err) {
-		ubifs_err("cannot write %d bytes to LEB %d:%d",
-			  sync_len, wbuf->lnum, wbuf->offs);
-		dbg_dump_stack();
+	err = ubifs_leb_write(c, wbuf->lnum, wbuf->buf, wbuf->offs, sync_len,
+			      wbuf->dtype);
+	if (err)
 		return err;
-	}
 
 	spin_lock(&wbuf->lock);
 	wbuf->offs += sync_len;
@@ -722,9 +718,9 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 		if (aligned_len == wbuf->avail) {
 			dbg_io("flush jhead %s wbuf to LEB %d:%d",
 			       dbg_jhead(wbuf->jhead), wbuf->lnum, wbuf->offs);
-			err = ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf,
-					    wbuf->offs, wbuf->size,
-					    wbuf->dtype);
+			err = ubifs_leb_write(c, wbuf->lnum, wbuf->buf,
+					      wbuf->offs, wbuf->size,
+					      wbuf->dtype);
 			if (err)
 				goto out;
 
@@ -759,8 +755,8 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 		dbg_io("flush jhead %s wbuf to LEB %d:%d",
 		       dbg_jhead(wbuf->jhead), wbuf->lnum, wbuf->offs);
 		memcpy(wbuf->buf + wbuf->used, buf, wbuf->avail);
-		err = ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf, wbuf->offs,
-				    wbuf->size, wbuf->dtype);
+		err = ubifs_leb_write(c, wbuf->lnum, wbuf->buf, wbuf->offs,
+				      wbuf->size, wbuf->dtype);
 		if (err)
 			goto out;
 
@@ -778,8 +774,8 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 		 */
 		dbg_io("write %d bytes to LEB %d:%d",
 		       wbuf->size, wbuf->lnum, wbuf->offs);
-		err = ubi_leb_write(c->ubi, wbuf->lnum, buf, wbuf->offs,
-				    wbuf->size, wbuf->dtype);
+		err = ubifs_leb_write(c, wbuf->lnum, buf, wbuf->offs,
+				      wbuf->size, wbuf->dtype);
 		if (err)
 			goto out;
 
@@ -800,8 +796,8 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 		n <<= c->max_write_shift;
 		dbg_io("write %d bytes to LEB %d:%d", n, wbuf->lnum,
 		       wbuf->offs);
-		err = ubi_leb_write(c->ubi, wbuf->lnum, buf + written,
-				    wbuf->offs, n, wbuf->dtype);
+		err = ubifs_leb_write(c, wbuf->lnum, buf + written,
+				      wbuf->offs, n, wbuf->dtype);
 		if (err)
 			goto out;
 		wbuf->offs += n;
@@ -883,13 +879,9 @@ int ubifs_write_node(struct ubifs_info *c, void *buf, int len, int lnum,
 		return -EROFS;
 
 	ubifs_prepare_node(c, buf, len, 1);
-	err = ubi_leb_write(c->ubi, lnum, buf, offs, buf_len, dtype);
-	if (err) {
-		ubifs_err("cannot write %d bytes to LEB %d:%d, error %d",
-			  buf_len, lnum, offs, err);
+	err = ubifs_leb_write(c, lnum, buf, offs, buf_len, dtype);
+	if (err)
 		dbg_dump_node(c, buf);
-		dbg_dump_stack();
-	}
 
 	return err;
 }
-- 
1.7.2.3

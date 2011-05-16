Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQl-0003dI-Ez
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:35 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTFS011093
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:30 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 15/20] UBIFS: synchronize write-buffer before switching to the
	next bud
Date: Mon, 16 May 2011 10:44:34 +0300
Message-Id: <1305531879-19311-16-git-send-email-dedekind1@gmail.com>
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

Currently when UBIFS fills up the current bud (which is the last in the journal
head) and switches to the next bud, it first writes the log reference node for
the next bud and only after this synchronizes the write-buffer of the previous
bud. This is not a big deal, but an unclean power cut may lead to a situation
when we have corruption in a next-to-last bud, although it is much more logical
that we have to have corruption only in the last bud.

This patch also removes write-buffer synchronization from
'ubifs_wbuf_seek_nolock()' because this is not needed anymore (we synchronize
the write-buffer explicitly everywhere now) and also because this is just
prone to various errors.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/gc.c      |    4 ++++
 fs/ubifs/io.c      |   12 +++---------
 fs/ubifs/journal.c |   25 +++++++++++++++----------
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index d70937b..ded29f6 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -100,6 +100,10 @@ static int switch_gc_head(struct ubifs_info *c)
 	if (err)
 		return err;
 
+	err = ubifs_wbuf_sync_nolock(wbuf);
+	if (err)
+		return err;
+
 	err = ubifs_add_bud_to_log(c, GCHD, gc_lnum, 0);
 	if (err)
 		return err;
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 67bbde3..166951e 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -452,8 +452,8 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
  * @dtype: data type
  *
  * This function targets the write-buffer to logical eraseblock @lnum:@offs.
- * The write-buffer is synchronized if it is not empty. Returns zero in case of
- * success and a negative error code in case of failure.
+ * The write-buffer has to be empty. Returns zero in case of success and a
+ * negative error code in case of failure.
  */
 int ubifs_wbuf_seek_nolock(struct ubifs_wbuf *wbuf, int lnum, int offs,
 			   int dtype)
@@ -465,13 +465,7 @@ int ubifs_wbuf_seek_nolock(struct ubifs_wbuf *wbuf, int lnum, int offs,
 	ubifs_assert(offs >= 0 && offs <= c->leb_size);
 	ubifs_assert(offs % c->min_io_size == 0 && !(offs & 7));
 	ubifs_assert(lnum != wbuf->lnum);
-
-	if (wbuf->used > 0) {
-		int err = ubifs_wbuf_sync_nolock(wbuf);
-
-		if (err)
-			return err;
-	}
+	ubifs_assert(wbuf->used == 0);
 
 	spin_lock(&wbuf->lock);
 	wbuf->lnum = lnum;
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index ce55a48..34b1679 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -141,14 +141,8 @@ again:
 	 * LEB with some empty space.
 	 */
 	lnum = ubifs_find_free_space(c, len, &offs, squeeze);
-	if (lnum >= 0) {
-		/* Found an LEB, add it to the journal head */
-		err = ubifs_add_bud_to_log(c, jhead, lnum, offs);
-		if (err)
-			goto out_return;
-		/* A new bud was successfully allocated and added to the log */
+	if (lnum >= 0)
 		goto out;
-	}
 
 	err = lnum;
 	if (err != -ENOSPC)
@@ -203,12 +197,23 @@ again:
 		return 0;
 	}
 
-	err = ubifs_add_bud_to_log(c, jhead, lnum, 0);
-	if (err)
-		goto out_return;
 	offs = 0;
 
 out:
+	/*
+	 * Make sure we synchronize the write-buffer before we add the new bud
+	 * to the log. Otherwise we may have a power cut after the log
+	 * reference node for the last bud (@lnum) is written but before the
+	 * write-buffer data are written to the next-to-last bud
+	 * (@wbuf->lnum). And the effect would be that the recovery would see
+	 * that there is corruption in the next-to-last bud.
+	 */
+	err = ubifs_wbuf_sync_nolock(wbuf);
+	if (err)
+		goto out_return;
+	err = ubifs_add_bud_to_log(c, jhead, lnum, offs);
+	if (err)
+		goto out_return;
 	err = ubifs_wbuf_seek_nolock(wbuf, lnum, offs, wbuf->dtype);
 	if (err)
 		goto out_unlock;
-- 
1.7.2.3

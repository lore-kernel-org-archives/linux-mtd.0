Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QILkx-00089J-1N
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:11:50 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p46EBiFl000678
	for <linux-mtd@lists.infradead.org>; Fri, 6 May 2011 17:11:45 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/7] UBIFS: refactor ubifs_rcvry_gc_commit
Date: Fri,  6 May 2011 17:15:12 +0300
Message-Id: <1304691317-32214-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1304691317-32214-1-git-send-email-dedekind1@gmail.com>
References: <1304691317-32214-1-git-send-email-dedekind1@gmail.com>
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

This commits refactors and cleans up 'ubifs_rcvry_gc_commit()' which was quite
untidy, also removes the commentary which was not 100% correct.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |   55 ++++++++++++++++----------------------------------
 1 files changed, 18 insertions(+), 37 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 11776ae..d28db1e 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1138,44 +1138,26 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 {
 	struct ubifs_wbuf *wbuf = &c->jheads[GCHD].wbuf;
 	struct ubifs_lprops lp;
-	int lnum, err;
+	int err;
 
 	c->gc_lnum = -1;
-	if (wbuf->lnum == -1) {
-		dbg_rcvry("no GC head LEB");
-		return grab_empty_leb(c);
-	}
-	/*
-	 * See whether the used space in the dirtiest LEB fits in the GC head
-	 * LEB.
-	 */
-	if (wbuf->offs == c->leb_size) {
-		dbg_rcvry("no room in GC head LEB");
+	if (wbuf->lnum == -1 || wbuf->offs == c->leb_size) {
+		dbg_rcvry("no GC head: wbuf->lnum %d, wbuf->offs %d",
+			  wbuf->lnum, wbuf->offs);
 		return grab_empty_leb(c);
 	}
+
 	err = ubifs_find_dirty_leb(c, &lp, wbuf->offs, 2);
 	if (err) {
-		/*
-		 * There are no dirty or empty LEBs subject to here being
-		 * enough for the index. Try to use
-		 * 'ubifs_find_free_leb_for_idx()', which will return any empty
-		 * LEBs (ignoring index requirements). If the index then
-		 * doesn't have enough LEBs the recovery commit will fail -
-		 * which is the  same result anyway i.e. recovery fails. So
-		 * there is no problem ignoring index  requirements and just
-		 * grabbing a free LEB since we have already established there
-		 * is not a dirty LEB we could have used instead.
-		 */
-		if (err == -ENOSPC) {
-			dbg_rcvry("could not find a dirty LEB");
-			return grab_empty_leb(c);
-		}
-		return err;
+		if (err != -ENOSPC)
+			return err;
+
+		dbg_rcvry("could not find a dirty LEB");
+		return grab_empty_leb(c);
 	}
 
 	ubifs_assert(!(lp.flags & LPROPS_INDEX));
 	ubifs_assert(lp.free + lp.dirty >= wbuf->offs);
-	lnum = lp.lnum;
 
 	/*
 	 * We run the commit before garbage collection otherwise subsequent
@@ -1185,11 +1167,8 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 	err = ubifs_run_commit(c);
 	if (err)
 		return err;
-	/*
-	 * The data in the dirtiest LEB fits in the GC head LEB, so do the GC
-	 * - use locking to keep 'ubifs_assert()' happy.
-	 */
-	dbg_rcvry("GC'ing LEB %d", lnum);
+
+	dbg_rcvry("GC'ing LEB %d", lp.lnum);
 	mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
 	err = ubifs_garbage_collect_leb(c, &lp);
 	if (err >= 0) {
@@ -1205,14 +1184,16 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 			err = -EINVAL;
 		return err;
 	}
-	if (err != LEB_RETAINED) {
-		dbg_err("GC returned %d", err);
+
+	ubifs_assert(err == LEB_RETAINED);
+	if (err != LEB_RETAINED)
 		return -EINVAL;
-	}
+
 	err = ubifs_leb_unmap(c, c->gc_lnum);
 	if (err)
 		return err;
-	dbg_rcvry("allocated LEB %d for GC", lnum);
+
+	dbg_rcvry("allocated LEB %d for GC", lp.lnum);
 	return 0;
 }
 
-- 
1.7.2.3

Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEced-00071J-KZ
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 07:25:54 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3Q7PmNA010174
	for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2011 10:25:48 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/4] UBIFS: remove duplicated code
Date: Tue, 26 Apr 2011 10:29:20 +0300
Message-Id: <1303802963-31612-1-git-send-email-dedekind1@gmail.com>
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

We have duplicated code in 'ubifs_garbage_collect()' and
'ubifs_rcvry_gc_commit()', which is about handling the special case of free
LEB. In both cases we just want to garbage-collect the LEB using
'ubifs_garbage_collect_leb()'.

This patch teaches 'ubifs_garbage_collect_leb()' to handle free LEB's so that
the caller does not have to do this and the duplicated code is removed.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/gc.c       |   62 +++++++++++++++++++++++++-------------------------
 fs/ubifs/recovery.c |   19 +--------------
 2 files changed, 33 insertions(+), 48 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 151f108..082d21b 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -473,6 +473,37 @@ int ubifs_garbage_collect_leb(struct ubifs_info *c, struct ubifs_lprops *lp)
 	ubifs_assert(c->gc_lnum != lnum);
 	ubifs_assert(wbuf->lnum != lnum);
 
+	if (lp->free + lp->dirty == c->leb_size) {
+		/* Special case - a free LEB  */
+		dbg_gc("LEB %d is free, return it", lp->lnum);
+		ubifs_assert(!(lp->flags & LPROPS_INDEX));
+
+		if (lp->free != c->leb_size) {
+			/*
+			 * Write buffers must be sync'd before unmapping
+			 * freeable LEBs, because one of them may contain data
+			 * which obsoletes something in 'lp->pnum'.
+			 */
+			err = gc_sync_wbufs(c);
+			if (err)
+				return err;
+			err = ubifs_change_one_lp(c, lp->lnum, c->leb_size,
+						  0, 0, 0, 0);
+			if (err)
+				return err;
+		}
+		err = ubifs_leb_unmap(c, lp->lnum);
+		if (err)
+			return err;
+
+		if (c->gc_lnum == -1) {
+			c->gc_lnum = lnum;
+			return LEB_RETAINED;
+		}
+
+		return LEB_FREED;
+	}
+
 	/*
 	 * We scan the entire LEB even though we only really need to scan up to
 	 * (c->leb_size - lp->free).
@@ -682,37 +713,6 @@ int ubifs_garbage_collect(struct ubifs_info *c, int anyway)
 		       "(min. space %d)", lp.lnum, lp.free, lp.dirty,
 		       lp.free + lp.dirty, min_space);
 
-		if (lp.free + lp.dirty == c->leb_size) {
-			/* An empty LEB was returned */
-			dbg_gc("LEB %d is free, return it", lp.lnum);
-			/*
-			 * ubifs_find_dirty_leb() doesn't return freeable index
-			 * LEBs.
-			 */
-			ubifs_assert(!(lp.flags & LPROPS_INDEX));
-			if (lp.free != c->leb_size) {
-				/*
-				 * Write buffers must be sync'd before
-				 * unmapping freeable LEBs, because one of them
-				 * may contain data which obsoletes something
-				 * in 'lp.pnum'.
-				 */
-				ret = gc_sync_wbufs(c);
-				if (ret)
-					goto out;
-				ret = ubifs_change_one_lp(c, lp.lnum,
-							  c->leb_size, 0, 0, 0,
-							  0);
-				if (ret)
-					goto out;
-			}
-			ret = ubifs_leb_unmap(c, lp.lnum);
-			if (ret)
-				goto out;
-			ret = lp.lnum;
-			break;
-		}
-
 		space_before = c->leb_size - wbuf->offs - wbuf->used;
 		if (wbuf->lnum == -1)
 			space_before = 0;
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 3dbad6f..1a72046 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1125,25 +1125,10 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 		}
 		return err;
 	}
+
 	ubifs_assert(!(lp.flags & LPROPS_INDEX));
 	lnum = lp.lnum;
-	if (lp.free + lp.dirty == c->leb_size) {
-		/* An empty LEB was returned */
-		if (lp.free != c->leb_size) {
-			err = ubifs_change_one_lp(c, lnum, c->leb_size,
-						  0, 0, 0, 0);
-			if (err)
-				return err;
-		}
-		err = ubifs_leb_unmap(c, lnum);
-		if (err)
-			return err;
-		c->gc_lnum = lnum;
-		dbg_rcvry("allocated LEB %d for GC", lnum);
-		/* Run the commit */
-		dbg_rcvry("committing");
-		return ubifs_run_commit(c);
-	}
+
 	/*
 	 * There was no empty LEB so the used space in the dirtiest LEB must fit
 	 * in the GC head LEB.
-- 
1.7.2.3

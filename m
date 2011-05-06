Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QILkx-00089K-5R
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:11:50 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p46EBiFn000678
	for <linux-mtd@lists.infradead.org>; Fri, 6 May 2011 17:11:46 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/7] UBIFS: split ubifs_rcvry_gc_commit
Date: Fri,  6 May 2011 17:15:11 +0300
Message-Id: <1304691317-32214-1-git-send-email-dedekind1@gmail.com>
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

Split the 'ubifs_rcvry_gc_commit()' function and introduce a 'grab_empty_leb()'
heler. This cleans 'ubifs_rcvry_gc_commit()' a little and makes it a bit less
of spagetti.

Also, add a commentary which explains why it is crucial to first search for an
empty LEB and then run commit.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |   77 +++++++++++++++++++++++++++++++++------------------
 1 files changed, 50 insertions(+), 27 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 3d2598d..11776ae 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1070,6 +1070,53 @@ int ubifs_clean_lebs(const struct ubifs_info *c, void *sbuf)
 }
 
 /**
+ * grab_empty_leb - grab an empty LEB to use as GC LEB and run commit.
+ * @c: UBIFS file-system description object
+ *
+ * This is a helper function for 'ubifs_rcvry_gc_commit()' which grabs an empty
+ * LEB to be used as GC LEB (@c->gc_lnum), and then runs the commit. Returns
+ * zero in case of success and a negative error code in case of failure.
+ */
+static int grab_empty_leb(struct ubifs_info *c)
+{
+	int lnum, err;
+
+	/*
+	 * Note, it is very important to first search for an empty LEB and then
+	 * run the commit, not vice-versa. The reason is that there might be
+	 * only one empty LEB at the moment, the one which has been the
+	 * @c->gc_lnum just before the power cut happened. During the regular
+	 * UBIFS operation (not now) @c->gc_lnum is marked as "taken", so no
+	 * one but GC can grab it. But at this moment this single empty LEB is
+	 * not marked as taken, so if we run commit - what happens? Right, the
+	 * commit will grab it and write the index there. Remember that the
+	 * index always expands as long as there is free space, and it only
+	 * starts consolidating when we run out of space.
+	 *
+	 * IOW, if we run commit now, we might not be able to find a free LEB
+	 * after this.
+	 */
+	lnum = ubifs_find_free_leb_for_idx(c);
+	if (lnum < 0) {
+		dbg_err("could not find an empty LEB");
+		dbg_dump_lprops(c);
+		dbg_dump_budg(c, &c->bi);
+		return lnum;
+	}
+
+	/* Reset the index flag */
+	err = ubifs_change_one_lp(c, lnum, LPROPS_NC, LPROPS_NC, 0,
+				  LPROPS_INDEX, 0);
+	if (err)
+		return err;
+
+	c->gc_lnum = lnum;
+	dbg_rcvry("found empty LEB %d, run commit", lnum);
+
+	return ubifs_run_commit(c);
+}
+
+/**
  * ubifs_rcvry_gc_commit - recover the GC LEB number and run the commit.
  * @c: UBIFS file-system description object
  *
@@ -1096,7 +1143,7 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 	c->gc_lnum = -1;
 	if (wbuf->lnum == -1) {
 		dbg_rcvry("no GC head LEB");
-		goto find_free;
+		return grab_empty_leb(c);
 	}
 	/*
 	 * See whether the used space in the dirtiest LEB fits in the GC head
@@ -1104,7 +1151,7 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 	 */
 	if (wbuf->offs == c->leb_size) {
 		dbg_rcvry("no room in GC head LEB");
-		goto find_free;
+		return grab_empty_leb(c);
 	}
 	err = ubifs_find_dirty_leb(c, &lp, wbuf->offs, 2);
 	if (err) {
@@ -1121,7 +1168,7 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 		 */
 		if (err == -ENOSPC) {
 			dbg_rcvry("could not find a dirty LEB");
-			goto find_free;
+			return grab_empty_leb(c);
 		}
 		return err;
 	}
@@ -1167,30 +1214,6 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 		return err;
 	dbg_rcvry("allocated LEB %d for GC", lnum);
 	return 0;
-
-find_free:
-	/*
-	 * There is no GC head LEB or the free space in the GC head LEB is too
-	 * small, or there are not dirty LEBs. Allocate gc_lnum by calling
-	 * 'ubifs_find_free_leb_for_idx()' so GC is not run.
-	 */
-	lnum = ubifs_find_free_leb_for_idx(c);
-	if (lnum < 0) {
-		dbg_err("could not find an empty LEB");
-		dbg_dump_lprops(c);
-		dbg_dump_budg(c, &c->bi);
-		return lnum;
-	}
-	/* And reset the index flag */
-	err = ubifs_change_one_lp(c, lnum, LPROPS_NC, LPROPS_NC, 0,
-				  LPROPS_INDEX, 0);
-	if (err)
-		return err;
-	c->gc_lnum = lnum;
-	dbg_rcvry("allocated LEB %d for GC", lnum);
-	/* Run the commit */
-	dbg_rcvry("committing");
-	return ubifs_run_commit(c);
 }
 
 /**
-- 
1.7.2.3

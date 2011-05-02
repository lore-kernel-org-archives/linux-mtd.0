Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QGvpY-0007B0-FA
	for linux-mtd@lists.infradead.org; Mon, 02 May 2011 16:18:42 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p42GI72J007776
	for <linux-mtd@lists.infradead.org>; Mon, 2 May 2011 19:18:37 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] UBIFS: seek journal heads to the latest bud in replay
Date: Mon,  2 May 2011 19:22:20 +0300
Message-Id: <1304353340-2054-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1304353340-2054-1-git-send-email-dedekind1@gmail.com>
References: <1304353340-2054-1-git-send-email-dedekind1@gmail.com>
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

This is the second fix of the following symptom:

UBIFS error (pid 34456): could not find an empty LEB

which sometimes happens after power cuts when we mount the file-system - UBIFS
refuses it with the above error message which comes from the
'ubifs_rcvry_gc_commit()' function. I can reproduce this using the integck test
with the UBIFS power cut emulation enabled.

Analysis of the problem.

Currently UBIFS replay seeks the journal heads to the last _replayed_ bud.
But the buds are replayed out-of-order, so the replay basically seeks journal
heads to the "random" bud belonging to this head, and not to the _last_ one.

The result of this is that the GC head may be seeked to a full LEB with no free
space, or very little free space. And 'ubifs_rcvry_gc_commit()' tries to find a
fully or mostly dirty LEB to match the current GC head (because we need to
garbage-collect that dirty LEB at one go, because we do not have @c->gc_lnum).
So 'ubifs_find_dirty_leb()' fails and we fall back to finding an empty LEB and
also fail. As a result - recovery fails and mounting fails.

This patch teaches the replay to initialize the GC heads exactly to the latest
buds, i.e. the buds which have the largest sequence number in corresponding
log reference nodes.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: stable@kernel.org
---
 fs/ubifs/replay.c |   18 ++++++++++++------
 1 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index b716a18..c29c468 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -59,6 +59,7 @@ enum {
  * @new_size: truncation new size
  * @free: amount of free space in a bud
  * @dirty: amount of dirty space in a bud from padding and deletion nodes
+ * @jhead: journal head number of the bud
  *
  * UBIFS journal replay must compare node sequence numbers, which means it must
  * build a tree of node information to insert into the TNC.
@@ -80,6 +81,7 @@ struct replay_entry {
 		struct {
 			int free;
 			int dirty;
+			int jhead;
 		};
 	};
 };
@@ -159,6 +161,11 @@ static int set_bud_lprops(struct ubifs_info *c, struct replay_entry *r)
 		err = PTR_ERR(lp);
 		goto out;
 	}
+
+	/* Make sure the journal head points to the latest bud */
+	err = ubifs_wbuf_seek_nolock(&c->jheads[r->jhead].wbuf, r->lnum,
+				     c->leb_size - r->free, UBI_SHORTTERM);
+
 out:
 	ubifs_release_lprops(c);
 	return err;
@@ -627,10 +634,6 @@ static int replay_bud(struct ubifs_info *c, int lnum, int offs, int jhead,
 	ubifs_assert(sleb->endpt - offs >= used);
 	ubifs_assert(sleb->endpt % c->min_io_size == 0);
 
-	if (sleb->endpt + c->min_io_size <= c->leb_size && !c->ro_mount)
-		err = ubifs_wbuf_seek_nolock(&c->jheads[jhead].wbuf, lnum,
-					     sleb->endpt, UBI_SHORTTERM);
-
 	*dirty = sleb->endpt - offs - used;
 	*free = c->leb_size - sleb->endpt;
 
@@ -653,12 +656,14 @@ out_dump:
  * @sqnum: sequence number
  * @free: amount of free space in bud
  * @dirty: amount of dirty space from padding and deletion nodes
+ * @jhead: journal head number for the bud
  *
  * This function inserts a reference node to the replay tree and returns zero
  * in case of success or a negative error code in case of failure.
  */
 static int insert_ref_node(struct ubifs_info *c, int lnum, int offs,
-			   unsigned long long sqnum, int free, int dirty)
+			   unsigned long long sqnum, int free, int dirty,
+			   int jhead)
 {
 	struct rb_node **p = &c->replay_tree.rb_node, *parent = NULL;
 	struct replay_entry *r;
@@ -688,6 +693,7 @@ static int insert_ref_node(struct ubifs_info *c, int lnum, int offs,
 	r->flags = REPLAY_REF;
 	r->free = free;
 	r->dirty = dirty;
+	r->jhead = jhead;
 
 	rb_link_node(&r->rb, parent, p);
 	rb_insert_color(&r->rb, &c->replay_tree);
@@ -712,7 +718,7 @@ static int replay_buds(struct ubifs_info *c)
 		if (err)
 			return err;
 		err = insert_ref_node(c, b->bud->lnum, b->bud->start, b->sqnum,
-				      free, dirty);
+				      free, dirty, b->bud->jhead);
 		if (err)
 			return err;
 	}
-- 
1.7.2.3

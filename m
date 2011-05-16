Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQl-0003dF-1q
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:40 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTAp011099
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:30 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/20] UBIFS: simplify replay
Date: Mon, 16 May 2011 10:44:30 +0300
Message-Id: <1305531879-19311-12-git-send-email-dedekind1@gmail.com>
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

This patch simplifies the replay code and makes it smaller. First of all, we
can notice that we do not really need to create bud replay entries and insert
them to the replay tree, because the only reason we do this is to set buds
lprops correctly at the end. Instead, we can just walk the list of buds at the
very end and set lprops for each bud. This allows us to get rid of whole
'insert_ref_node()' function, the 'REPLAY_REF' flag, and several fields in
'struct replay_entry'. Then we can also notice that we do not need the 'flags'
'struct replay_entry' field, because there is only one flag -
'REPLAY_DELETION'. Instead, we can just add a 'deletion' bit fields. As a
result, this patch deletes much more lines that in adds.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/replay.c |  167 +++++++++++++++++++----------------------------------
 1 files changed, 59 insertions(+), 108 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index ee2f0b2..08f5036 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -34,32 +34,18 @@
 
 #include "ubifs.h"
 
-/*
- * Replay flags.
- *
- * REPLAY_DELETION: node was deleted
- * REPLAY_REF: node is a reference node
- */
-enum {
-	REPLAY_DELETION = 1,
-	REPLAY_REF = 2,
-};
-
 /**
  * struct replay_entry - replay tree entry.
  * @lnum: logical eraseblock number of the node
  * @offs: node offset
  * @len: node length
+ * @deletion: non-zero if this entry corresponds to a node deletion
  * @sqnum: node sequence number
- * @flags: replay flags
  * @rb: links the replay tree
  * @key: node key
  * @nm: directory entry name
  * @old_size: truncation old size
  * @new_size: truncation new size
- * @free: amount of free space in a bud
- * @dirty: amount of dirty space in a bud from padding and deletion nodes
- * @jhead: journal head number of the bud
  *
  * UBIFS journal replay must compare node sequence numbers, which means it must
  * build a tree of node information to insert into the TNC.
@@ -68,8 +54,8 @@ struct replay_entry {
 	int lnum;
 	int offs;
 	int len;
+	unsigned int deletion:1;
 	unsigned long long sqnum;
-	int flags;
 	struct rb_node rb;
 	union ubifs_key key;
 	union {
@@ -78,11 +64,6 @@ struct replay_entry {
 			loff_t old_size;
 			loff_t new_size;
 		};
-		struct {
-			int free;
-			int dirty;
-			int jhead;
-		};
 	};
 };
 
@@ -105,28 +86,32 @@ struct bud_entry {
 /**
  * set_bud_lprops - set free and dirty space used by a bud.
  * @c: UBIFS file-system description object
- * @r: replay entry of bud
+ * @b: bud entry which describes the bud
+ *
+ * This function makes sure the LEB properties of bud @b are set correctly
+ * after the replay. Returns zero in case of success and a negative error code
+ * in case of failure.
  */
-static int set_bud_lprops(struct ubifs_info *c, struct replay_entry *r)
+static int set_bud_lprops(struct ubifs_info *c, struct bud_entry *b)
 {
 	const struct ubifs_lprops *lp;
 	int err = 0, dirty;
 
 	ubifs_get_lprops(c);
 
-	lp = ubifs_lpt_lookup_dirty(c, r->lnum);
+	lp = ubifs_lpt_lookup_dirty(c, b->bud->lnum);
 	if (IS_ERR(lp)) {
 		err = PTR_ERR(lp);
 		goto out;
 	}
 
 	dirty = lp->dirty;
-	if (r->offs == 0 && (lp->free != c->leb_size || lp->dirty != 0)) {
+	if (b->bud->start == 0 && (lp->free != c->leb_size || lp->dirty != 0)) {
 		/*
 		 * The LEB was added to the journal with a starting offset of
 		 * zero which means the LEB must have been empty. The LEB
-		 * property values should be lp->free == c->leb_size and
-		 * lp->dirty == 0, but that is not the case. The reason is that
+		 * property values should be @lp->free == @c->leb_size and
+		 * @lp->dirty == 0, but that is not the case. The reason is that
 		 * the LEB had been garbage collected before it became the bud,
 		 * and there was not commit inbetween. The garbage collector
 		 * resets the free and dirty space without recording it
@@ -135,15 +120,15 @@ static int set_bud_lprops(struct ubifs_info *c, struct replay_entry *r)
 		 *
 		 * We do not need to adjust free space because the scan has told
 		 * us the exact value which is recorded in the replay entry as
-		 * r->free.
+		 * @b->free.
 		 *
 		 * However we do need to subtract from the dirty space the
 		 * amount of space that the garbage collector reclaimed, which
 		 * is the whole LEB minus the amount of space that was free.
 		 */
-		dbg_mnt("bud LEB %d was GC'd (%d free, %d dirty)", r->lnum,
+		dbg_mnt("bud LEB %d was GC'd (%d free, %d dirty)", b->bud->lnum,
 			lp->free, lp->dirty);
-		dbg_gc("bud LEB %d was GC'd (%d free, %d dirty)", r->lnum,
+		dbg_gc("bud LEB %d was GC'd (%d free, %d dirty)", b->bud->lnum,
 			lp->free, lp->dirty);
 		dirty -= c->leb_size - lp->free;
 		/*
@@ -155,10 +140,10 @@ static int set_bud_lprops(struct ubifs_info *c, struct replay_entry *r)
 		 */
 		if (dirty != 0)
 			dbg_msg("LEB %d lp: %d free %d dirty "
-				"replay: %d free %d dirty", r->lnum, lp->free,
-				lp->dirty, r->free, r->dirty);
+				"replay: %d free %d dirty", b->bud->lnum,
+				lp->free, lp->dirty, b->free, b->dirty);
 	}
-	lp = ubifs_change_lp(c, lp, r->free, dirty + r->dirty,
+	lp = ubifs_change_lp(c, lp, b->free, dirty + b->dirty,
 			     lp->flags | LPROPS_TAKEN, 0);
 	if (IS_ERR(lp)) {
 		err = PTR_ERR(lp);
@@ -166,8 +151,9 @@ static int set_bud_lprops(struct ubifs_info *c, struct replay_entry *r)
 	}
 
 	/* Make sure the journal head points to the latest bud */
-	err = ubifs_wbuf_seek_nolock(&c->jheads[r->jhead].wbuf, r->lnum,
-				     c->leb_size - r->free, UBI_SHORTTERM);
+	err = ubifs_wbuf_seek_nolock(&c->jheads[b->bud->jhead].wbuf,
+				     b->bud->lnum, c->leb_size - b->free,
+				     UBI_SHORTTERM);
 
 out:
 	ubifs_release_lprops(c);
@@ -175,6 +161,27 @@ out:
 }
 
 /**
+ * set_buds_lprops - set free and dirty space for all replayed buds.
+ * @c: UBIFS file-system description object
+ *
+ * This function sets LEB properties for all replayed buds. Returns zero in
+ * case of success and a negative error code in case of failure.
+ */
+static int set_buds_lprops(struct ubifs_info *c)
+{
+	struct bud_entry *b;
+	int err;
+
+	list_for_each_entry(b, &c->replay_buds, list) {
+		err = set_bud_lprops(c, b);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/**
  * trun_remove_range - apply a replay entry for a truncation to the TNC.
  * @c: UBIFS file-system description object
  * @r: replay entry of truncation
@@ -210,24 +217,22 @@ static int trun_remove_range(struct ubifs_info *c, struct replay_entry *r)
  */
 static int apply_replay_entry(struct ubifs_info *c, struct replay_entry *r)
 {
-	int err, deletion = ((r->flags & REPLAY_DELETION) != 0);
+	int err;
 
-	dbg_mnt("LEB %d:%d len %d flgs %d sqnum %llu %s", r->lnum,
-		r->offs, r->len, r->flags, r->sqnum, DBGKEY(&r->key));
+	dbg_mnt("LEB %d:%d len %d deletion %d sqnum %llu %s", r->lnum,
+		r->offs, r->len, r->deletion, r->sqnum, DBGKEY(&r->key));
 
 	/* Set c->replay_sqnum to help deal with dangling branches. */
 	c->replay_sqnum = r->sqnum;
 
-	if (r->flags & REPLAY_REF)
-		err = set_bud_lprops(c, r);
-	else if (is_hash_key(c, &r->key)) {
-		if (deletion)
+	if (is_hash_key(c, &r->key)) {
+		if (r->deletion)
 			err = ubifs_tnc_remove_nm(c, &r->key, &r->nm);
 		else
 			err = ubifs_tnc_add_nm(c, &r->key, r->lnum, r->offs,
 					       r->len, &r->nm);
 	} else {
-		if (deletion)
+		if (r->deletion)
 			switch (key_type(c, &r->key)) {
 			case UBIFS_INO_KEY:
 			{
@@ -250,7 +255,7 @@ static int apply_replay_entry(struct ubifs_info *c, struct replay_entry *r)
 			return err;
 
 		if (c->need_recovery)
-			err = ubifs_recover_size_accum(c, &r->key, deletion,
+			err = ubifs_recover_size_accum(c, &r->key, r->deletion,
 						       r->new_size);
 	}
 
@@ -373,11 +378,11 @@ static int insert_node(struct ubifs_info *c, int lnum, int offs, int len,
 	r->lnum = lnum;
 	r->offs = offs;
 	r->len = len;
+	r->deletion = !!deletion;
 	r->sqnum = sqnum;
-	r->flags = (deletion ? REPLAY_DELETION : 0);
+	key_copy(c, key, &r->key);
 	r->old_size = old_size;
 	r->new_size = new_size;
-	key_copy(c, key, &r->key);
 
 	rb_link_node(&r->rb, parent, p);
 	rb_insert_color(&r->rb, &c->replay_tree);
@@ -445,13 +450,13 @@ static int insert_dent(struct ubifs_info *c, int lnum, int offs, int len,
 	r->lnum = lnum;
 	r->offs = offs;
 	r->len = len;
+	r->deletion = !!deletion;
 	r->sqnum = sqnum;
+	key_copy(c, key, &r->key);
 	r->nm.len = nlen;
 	memcpy(nbuf, name, nlen);
 	nbuf[nlen] = '\0';
 	r->nm.name = nbuf;
-	r->flags = (deletion ? REPLAY_DELETION : 0);
-	key_copy(c, key, &r->key);
 
 	ubifs_assert(!*p);
 	rb_link_node(&r->rb, parent, p);
@@ -653,58 +658,6 @@ out_dump:
 }
 
 /**
- * insert_ref_node - insert a reference node to the replay tree.
- * @c: UBIFS file-system description object
- * @lnum: node logical eraseblock number
- * @offs: node offset
- * @sqnum: sequence number
- * @free: amount of free space in bud
- * @dirty: amount of dirty space from padding and deletion nodes
- * @jhead: journal head number for the bud
- *
- * This function inserts a reference node to the replay tree and returns zero
- * in case of success or a negative error code in case of failure.
- */
-static int insert_ref_node(struct ubifs_info *c, int lnum, int offs,
-			   unsigned long long sqnum, int free, int dirty,
-			   int jhead)
-{
-	struct rb_node **p = &c->replay_tree.rb_node, *parent = NULL;
-	struct replay_entry *r;
-
-	dbg_mnt("add ref LEB %d:%d", lnum, offs);
-	while (*p) {
-		parent = *p;
-		r = rb_entry(parent, struct replay_entry, rb);
-		if (sqnum < r->sqnum) {
-			p = &(*p)->rb_left;
-			continue;
-		} else if (sqnum > r->sqnum) {
-			p = &(*p)->rb_right;
-			continue;
-		}
-		ubifs_err("duplicate sqnum in replay tree");
-		return -EINVAL;
-	}
-
-	r = kzalloc(sizeof(struct replay_entry), GFP_KERNEL);
-	if (!r)
-		return -ENOMEM;
-
-	r->lnum = lnum;
-	r->offs = offs;
-	r->sqnum = sqnum;
-	r->flags = REPLAY_REF;
-	r->free = free;
-	r->dirty = dirty;
-	r->jhead = jhead;
-
-	rb_link_node(&r->rb, parent, p);
-	rb_insert_color(&r->rb, &c->replay_tree);
-	return 0;
-}
-
-/**
  * replay_buds - replay all buds.
  * @c: UBIFS file-system description object
  *
@@ -714,18 +667,12 @@ static int insert_ref_node(struct ubifs_info *c, int lnum, int offs,
 static int replay_buds(struct ubifs_info *c)
 {
 	struct bud_entry *b;
-	int err, uninitialized_var(free), uninitialized_var(dirty);
+	int err;
 	unsigned long long prev_sqnum = 0;
 
 	list_for_each_entry(b, &c->replay_buds, list) {
 		err = replay_bud(c, b->bud->lnum, b->bud->start, b->bud->jhead,
-				 &free, &dirty);
-		if (err)
-			return err;
-		b->free = free;
-		b->dirty = dirty;
-		err = insert_ref_node(c, b->bud->lnum, b->bud->start, b->sqnum,
-				      free, dirty, b->bud->jhead);
+				 &b->free, &b->dirty);
 		if (err)
 			return err;
 
@@ -1074,6 +1021,10 @@ int ubifs_replay_journal(struct ubifs_info *c)
 	if (err)
 		goto out;
 
+	err = set_buds_lprops(c);
+	if (err)
+		goto out;
+
 	/*
 	 * UBIFS budgeting calculations use @c->bi.uncommitted_idx variable
 	 * to roughly estimate index growth. Things like @c->bi.min_idx_lebs
-- 
1.7.2.3

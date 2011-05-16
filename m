Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQl-0003dC-2i
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:39 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTFR011093
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:30 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 12/20] UBIFS: substitute the replay tree with a replay list
Date: Mon, 16 May 2011 10:44:31 +0300
Message-Id: <1305531879-19311-13-git-send-email-dedekind1@gmail.com>
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

This patch simplifies replay even further - it removes the replay tree and
adds the replay list instead. Indeed, we just do not need to use a tree here -
all we need to do is to add all nodes to the list and then sort it. Using
RB-tree is an overkill - more code and slower. And since we replay buds in
order, we expect the nodes to follow in _mostly_ sorted order, so the merge
sort becomes much cheaper in average than an RB-tree.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/replay.c |  172 +++++++++++++++++++++++------------------------------
 fs/ubifs/ubifs.h  |    2 -
 2 files changed, 74 insertions(+), 100 deletions(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 08f5036..47915a7 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -33,22 +33,24 @@
  */
 
 #include "ubifs.h"
+#include <linux/list_sort.h>
 
 /**
- * struct replay_entry - replay tree entry.
+ * struct replay_entry - replay list entry.
  * @lnum: logical eraseblock number of the node
  * @offs: node offset
  * @len: node length
  * @deletion: non-zero if this entry corresponds to a node deletion
  * @sqnum: node sequence number
- * @rb: links the replay tree
+ * @list: links the replay list
  * @key: node key
  * @nm: directory entry name
  * @old_size: truncation old size
  * @new_size: truncation new size
  *
- * UBIFS journal replay must compare node sequence numbers, which means it must
- * build a tree of node information to insert into the TNC.
+ * The replay process first scans all buds and builds the replay list, then
+ * sorts the replay list in nodes sequence number order, and then inserts all
+ * the replay entries to the TNC.
  */
 struct replay_entry {
 	int lnum;
@@ -56,7 +58,7 @@ struct replay_entry {
 	int len;
 	unsigned int deletion:1;
 	unsigned long long sqnum;
-	struct rb_node rb;
+	struct list_head list;
 	union ubifs_key key;
 	union {
 		struct qstr nm;
@@ -263,68 +265,77 @@ static int apply_replay_entry(struct ubifs_info *c, struct replay_entry *r)
 }
 
 /**
- * destroy_replay_tree - destroy the replay.
- * @c: UBIFS file-system description object
+ * replay_entries_cmp - compare 2 replay entries.
+ * @priv: UBIFS file-system description object
+ * @a: first replay entry
+ * @a: second replay entry
  *
- * Destroy the replay tree.
+ * This is a comparios function for 'list_sort()' which compares 2 replay
+ * entries @a and @b by comparing their sequence numer.  Returns %1 if @a has
+ * greater sequence number and %-1 otherwise.
  */
-static void destroy_replay_tree(struct ubifs_info *c)
+static int replay_entries_cmp(void *priv, struct list_head *a,
+			      struct list_head *b)
 {
-	struct rb_node *this = c->replay_tree.rb_node;
-	struct replay_entry *r;
-
-	while (this) {
-		if (this->rb_left) {
-			this = this->rb_left;
-			continue;
-		} else if (this->rb_right) {
-			this = this->rb_right;
-			continue;
-		}
-		r = rb_entry(this, struct replay_entry, rb);
-		this = rb_parent(this);
-		if (this) {
-			if (this->rb_left == &r->rb)
-				this->rb_left = NULL;
-			else
-				this->rb_right = NULL;
-		}
-		if (is_hash_key(c, &r->key))
-			kfree(r->nm.name);
-		kfree(r);
-	}
-	c->replay_tree = RB_ROOT;
+	struct replay_entry *ra, *rb;
+
+	cond_resched();
+	if (a == b)
+		return 0;
+
+	ra = list_entry(a, struct replay_entry, list);
+	rb = list_entry(b, struct replay_entry, list);
+	ubifs_assert(ra->sqnum != rb->sqnum);
+	if (ra->sqnum > rb->sqnum)
+		return 1;
+	return -1;
 }
 
 /**
- * apply_replay_tree - apply the replay tree to the TNC.
+ * apply_replay_list - apply the replay list to the TNC.
  * @c: UBIFS file-system description object
  *
- * Apply the replay tree.
- * Returns zero in case of success and a negative error code in case of
- * failure.
+ * Apply all entries in the replay list to the TNC. Returns zero in case of
+ * success and a negative error code in case of failure.
  */
-static int apply_replay_tree(struct ubifs_info *c)
+static int apply_replay_list(struct ubifs_info *c)
 {
-	struct rb_node *this = rb_first(&c->replay_tree);
+	struct replay_entry *r;
+	int err;
 
-	while (this) {
-		struct replay_entry *r;
-		int err;
+	list_sort(c, &c->replay_list, &replay_entries_cmp);
 
+	list_for_each_entry(r, &c->replay_list, list) {
 		cond_resched();
 
-		r = rb_entry(this, struct replay_entry, rb);
 		err = apply_replay_entry(c, r);
 		if (err)
 			return err;
-		this = rb_next(this);
 	}
+
 	return 0;
 }
 
 /**
- * insert_node - insert a node to the replay tree.
+ * destroy_replay_list - destroy the replay.
+ * @c: UBIFS file-system description object
+ *
+ * Destroy the replay list.
+ */
+static void destroy_replay_list(struct ubifs_info *c)
+{
+	struct replay_entry *r, *tmp;
+
+	list_for_each_entry_safe(r, tmp, &c->replay_list, list) {
+		if (is_hash_key(c, &r->key))
+			kfree(r->nm.name);
+		list_del(&r->list);
+		kfree(r);
+	}
+}
+
+/**
+ * insert_node - insert a node to the replay list
  * @c: UBIFS file-system description object
  * @lnum: node logical eraseblock number
  * @offs: node offset
@@ -336,39 +347,25 @@ static int apply_replay_tree(struct ubifs_info *c)
  * @old_size: truncation old size
  * @new_size: truncation new size
  *
- * This function inserts a scanned non-direntry node to the replay tree. The
- * replay tree is an RB-tree containing @struct replay_entry elements which are
- * indexed by the sequence number. The replay tree is applied at the very end
- * of the replay process. Since the tree is sorted in sequence number order,
- * the older modifications are applied first. This function returns zero in
- * case of success and a negative error code in case of failure.
+ * This function inserts a scanned non-direntry node to the replay list. The
+ * replay list contains @struct replay_entry elements, and we sort this list in
+ * sequence number order before applying it. The replay list is applied at the
+ * very end of the replay process. Since the list is sorted in sequence number
+ * order, the older modifications are applied first. This function returns zero
+ * in case of success and a negative error code in case of failure.
  */
 static int insert_node(struct ubifs_info *c, int lnum, int offs, int len,
 		       union ubifs_key *key, unsigned long long sqnum,
 		       int deletion, int *used, loff_t old_size,
 		       loff_t new_size)
 {
-	struct rb_node **p = &c->replay_tree.rb_node, *parent = NULL;
 	struct replay_entry *r;
 
+	dbg_mnt("add LEB %d:%d, key %s", lnum, offs, DBGKEY(key));
+
 	if (key_inum(c, key) >= c->highest_inum)
 		c->highest_inum = key_inum(c, key);
 
-	dbg_mnt("add LEB %d:%d, key %s", lnum, offs, DBGKEY(key));
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
-		ubifs_err("duplicate sqnum in replay");
-		return -EINVAL;
-	}
-
 	r = kzalloc(sizeof(struct replay_entry), GFP_KERNEL);
 	if (!r)
 		return -ENOMEM;
@@ -384,13 +381,12 @@ static int insert_node(struct ubifs_info *c, int lnum, int offs, int len,
 	r->old_size = old_size;
 	r->new_size = new_size;
 
-	rb_link_node(&r->rb, parent, p);
-	rb_insert_color(&r->rb, &c->replay_tree);
+	list_add_tail(&r->list, &c->replay_list);
 	return 0;
 }
 
 /**
- * insert_dent - insert a directory entry node into the replay tree.
+ * insert_dent - insert a directory entry node into the replay list.
  * @c: UBIFS file-system description object
  * @lnum: node logical eraseblock number
  * @offs: node offset
@@ -402,43 +398,25 @@ static int insert_node(struct ubifs_info *c, int lnum, int offs, int len,
  * @deletion: non-zero if this is a deletion
  * @used: number of bytes in use in a LEB
  *
- * This function inserts a scanned directory entry node to the replay tree.
- * Returns zero in case of success and a negative error code in case of
- * failure.
- *
- * This function is also used for extended attribute entries because they are
- * implemented as directory entry nodes.
+ * This function inserts a scanned directory entry node or an extended
+ * attribute entry to the replay list. Returns zero in case of success and a
+ * negative error code in case of failure.
  */
 static int insert_dent(struct ubifs_info *c, int lnum, int offs, int len,
 		       union ubifs_key *key, const char *name, int nlen,
 		       unsigned long long sqnum, int deletion, int *used)
 {
-	struct rb_node **p = &c->replay_tree.rb_node, *parent = NULL;
 	struct replay_entry *r;
 	char *nbuf;
 
+	dbg_mnt("add LEB %d:%d, key %s", lnum, offs, DBGKEY(key));
 	if (key_inum(c, key) >= c->highest_inum)
 		c->highest_inum = key_inum(c, key);
 
-	dbg_mnt("add LEB %d:%d, key %s", lnum, offs, DBGKEY(key));
-	while (*p) {
-		parent = *p;
-		r = rb_entry(parent, struct replay_entry, rb);
-		if (sqnum < r->sqnum) {
-			p = &(*p)->rb_left;
-			continue;
-		}
-		if (sqnum > r->sqnum) {
-			p = &(*p)->rb_right;
-			continue;
-		}
-		ubifs_err("duplicate sqnum in replay");
-		return -EINVAL;
-	}
-
 	r = kzalloc(sizeof(struct replay_entry), GFP_KERNEL);
 	if (!r)
 		return -ENOMEM;
+
 	nbuf = kmalloc(nlen + 1, GFP_KERNEL);
 	if (!nbuf) {
 		kfree(r);
@@ -458,9 +436,7 @@ static int insert_dent(struct ubifs_info *c, int lnum, int offs, int len,
 	nbuf[nlen] = '\0';
 	r->nm.name = nbuf;
 
-	ubifs_assert(!*p);
-	rb_link_node(&r->rb, parent, p);
-	rb_insert_color(&r->rb, &c->replay_tree);
+	list_add_tail(&r->list, &c->replay_list);
 	return 0;
 }
 
@@ -1017,7 +993,7 @@ int ubifs_replay_journal(struct ubifs_info *c)
 	if (err)
 		goto out;
 
-	err = apply_replay_tree(c);
+	err = apply_replay_list(c);
 	if (err)
 		goto out;
 
@@ -1039,7 +1015,7 @@ int ubifs_replay_journal(struct ubifs_info *c)
 		"highest_inum %lu", c->lhead_lnum, c->lhead_offs, c->max_sqnum,
 		(unsigned long)c->highest_inum);
 out:
-	destroy_replay_tree(c);
+	destroy_replay_list(c);
 	destroy_bud_list(c);
 	c->replaying = 0;
 	return err;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 26a7ebe..a2f9d4e 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1205,7 +1205,6 @@ struct ubifs_debug_info;
  * @replaying: %1 during journal replay
  * @mounting: %1 while mounting
  * @remounting_rw: %1 while re-mounting from R/O mode to R/W mode
- * @replay_tree: temporary tree used during journal replay
  * @replay_list: temporary list used during journal replay
  * @replay_buds: list of buds to replay
  * @cs_sqnum: sequence number of first node in the log (commit start node)
@@ -1435,7 +1434,6 @@ struct ubifs_info {
 	unsigned int replaying:1;
 	unsigned int mounting:1;
 	unsigned int remounting_rw:1;
-	struct rb_root replay_tree;
 	struct list_head replay_list;
 	struct list_head replay_buds;
 	unsigned long long cs_sqnum;
-- 
1.7.2.3

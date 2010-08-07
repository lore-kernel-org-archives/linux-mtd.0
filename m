Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ohejq-0007dT-FI
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2010 08:26:43 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 7/7] UBIFS: introduce list sorting debugging checks
Date: Sat,  7 Aug 2010 11:26:17 +0300
Message-Id: <1281169577-18664-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
References: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

The UBIFS bug in the GC list sorting comparison functions inspired
me to write internal debugging check functions which verify that
the list of nodes is sorted properly.

So, this patch implements 2 new debugging functions:
 o 'dbg_check_data_nodes_order()' - check order of data nodes list
 o 'dbg_check_nondata_nodes_order()' - check order of non-data nodes list

The debugging functions are executed only if general UBIFS debugging checks are
enabled. And they are compiled out if UBIFS debugging is disabled.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |  154 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/debug.h |    4 ++
 fs/ubifs/gc.c    |   10 +++-
 3 files changed, 166 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index c2a68ba..98094a8 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2239,6 +2239,160 @@ out_free:
 	return err;
 }
 
+/**
+ * dbg_check_data_nodes_order - check that list of data nodes is sorted.
+ * @c: UBIFS file-system description object
+ * @head: the list of nodes ('struct ubifs_scan_node' objects)
+ *
+ * This function returns zero if the list of data nodes is sorted correctly,
+ * and %-EINVAL if not.
+ */
+int dbg_check_data_nodes_order(struct ubifs_info *c, struct list_head *head)
+{
+	struct list_head *cur;
+	struct ubifs_scan_node *sa, *sb;
+
+	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
+		return 0;
+
+	for (cur = head->next; cur->next != head; cur = cur->next) {
+		ino_t inuma, inumb;
+		uint32_t blka, blkb;
+
+		sa = container_of(cur, struct ubifs_scan_node, list);
+		sb = container_of(cur->next, struct ubifs_scan_node, list);
+
+		if (sa->type != UBIFS_DATA_NODE) {
+			ubifs_err("bad node type %d", sa->type);
+			dbg_dump_node(c, sa->node);
+			return -EINVAL;
+		}
+		if (sb->type != UBIFS_DATA_NODE) {
+			ubifs_err("bad node type %d", sb->type);
+			dbg_dump_node(c, sb->node);
+			return -EINVAL;
+		}
+
+		inuma = key_inum(c, &sa->key);
+		inumb = key_inum(c, &sb->key);
+
+		if (inuma < inumb)
+			continue;
+		if (inuma > inumb) {
+			ubifs_err("larger inum %lu goes before inum %lu",
+				  (unsigned long)inuma, (unsigned long)inumb);
+			goto error_dump;
+		}
+
+		blka = key_block(c, &sa->key);
+		blkb = key_block(c, &sb->key);
+
+		if (blka > blkb) {
+			ubifs_err("larger block %u goes before %u", blka, blkb);
+			goto error_dump;
+		}
+		if (blka == blkb) {
+			ubifs_err("two data nodes for the same block");
+			goto error_dump;
+		}
+	}
+
+	return 0;
+
+error_dump:
+	dbg_dump_node(c, sa->node);
+	dbg_dump_node(c, sb->node);
+	return -EINVAL;
+}
+
+/**
+ * dbg_check_nondata_nodes_order - check that list of data nodes is sorted.
+ * @c: UBIFS file-system description object
+ * @head: the list of nodes ('struct ubifs_scan_node' objects)
+ *
+ * This function returns zero if the list of non-data nodes is sorted correctly,
+ * and %-EINVAL if not.
+ */
+int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
+{
+	struct list_head *cur;
+	struct ubifs_scan_node *sa, *sb;
+
+	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
+		return 0;
+
+	for (cur = head->next; cur->next != head; cur = cur->next) {
+		ino_t inuma, inumb;
+		uint32_t hasha, hashb;
+
+		sa = container_of(cur, struct ubifs_scan_node, list);
+		sb = container_of(cur->next, struct ubifs_scan_node, list);
+
+		if (sa->type != UBIFS_INO_NODE && sa->type != UBIFS_DENT_NODE &&
+		    sa->type != UBIFS_XENT_NODE) {
+			ubifs_err("bad node type %d", sa->type);
+			dbg_dump_node(c, sa->node);
+			return -EINVAL;
+		}
+		if (sa->type != UBIFS_INO_NODE && sa->type != UBIFS_DENT_NODE &&
+		    sa->type != UBIFS_XENT_NODE) {
+			ubifs_err("bad node type %d", sb->type);
+			dbg_dump_node(c, sb->node);
+			return -EINVAL;
+		}
+
+		if (sa->type != UBIFS_INO_NODE && sb->type == UBIFS_INO_NODE) {
+			ubifs_err("non-inode node goes before inode node");
+			goto error_dump;
+		}
+
+		if (sa->type == UBIFS_INO_NODE && sb->type != UBIFS_INO_NODE)
+			continue;
+
+		if (sa->type == UBIFS_INO_NODE && sb->type == UBIFS_INO_NODE) {
+			/* Inode nodes are sorted in descending size order */
+			if (sa->len < sb->len) {
+				ubifs_err("smaller inode node goes first");
+				goto error_dump;
+			}
+			continue;
+		}
+
+		/*
+		 * This is either a dentry or xentry, which should be sorted in
+		 * ascending (parent ino, hash) order.
+		 */
+		inuma = key_inum(c, &sa->key);
+		inumb = key_inum(c, &sb->key);
+
+		if (inuma < inumb)
+			continue;
+		if (inuma > inumb) {
+			ubifs_err("larger inum %lu goes before inum %lu",
+				  (unsigned long)inuma, (unsigned long)inumb);
+			goto error_dump;
+		}
+
+		hasha = key_block(c, &sa->key);
+		hashb = key_block(c, &sb->key);
+
+		if (hasha > hashb) {
+			ubifs_err("larger hash %u goes before %u", hasha, hashb);
+			goto error_dump;
+		}
+	}
+
+	return 0;
+
+error_dump:
+	ubifs_msg("dumping first node");
+	dbg_dump_node(c, sa->node);
+	ubifs_msg("dumping second node");
+	dbg_dump_node(c, sb->node);
+	return -EINVAL;
+	return 0;
+}
+
 static int invocation_cnt;
 
 int dbg_force_in_the_gaps(void)
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 29d9601..69ebe47 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -324,6 +324,8 @@ int dbg_check_lpt_nodes(struct ubifs_info *c, struct ubifs_cnode *cnode,
 			int row, int col);
 int dbg_check_inode_size(struct ubifs_info *c, const struct inode *inode,
 			 loff_t size);
+int dbg_check_data_nodes_order(struct ubifs_info *c, struct list_head *head);
+int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head);
 
 /* Force the use of in-the-gaps method for testing */
 
@@ -465,6 +467,8 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 #define dbg_check_lprops(c)                        0
 #define dbg_check_lpt_nodes(c, cnode, row, col)    0
 #define dbg_check_inode_size(c, inode, size)       0
+#define dbg_check_data_nodes_order(c, head)        0
+#define dbg_check_nondata_nodes_order(c, head)     0
 #define dbg_force_in_the_gaps_enabled              0
 #define dbg_force_in_the_gaps()                    0
 #define dbg_failure_mode                           0
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 0bc6565..130f983 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -230,14 +230,13 @@ int nondata_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 static int sort_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 		      struct list_head *nondata, int *min)
 {
+	int err;
 	struct ubifs_scan_node *snod, *tmp;
 
 	*min = INT_MAX;
 
 	/* Separate data nodes and non-data nodes */
 	list_for_each_entry_safe(snod, tmp, &sleb->nodes, list) {
-		int err;
-
 		ubifs_assert(snod->type == UBIFS_INO_NODE  ||
 			     snod->type == UBIFS_DATA_NODE ||
 			     snod->type == UBIFS_DENT_NODE ||
@@ -281,6 +280,13 @@ static int sort_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 	/* Sort data and non-data nodes */
 	list_sort(c, &sleb->nodes, &data_nodes_cmp);
 	list_sort(c, nondata, &nondata_nodes_cmp);
+
+	err = dbg_check_data_nodes_order(c, &sleb->nodes);
+	if (err)
+		return err;
+	err = dbg_check_nondata_nodes_order(c, nondata);
+	if (err)
+		return err;
 	return 0;
 }
 
-- 
1.7.1.1

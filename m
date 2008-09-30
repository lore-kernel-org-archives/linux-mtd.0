Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkZs4-0005LD-OI
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 07:42:13 +0000
Received: from mgw-mx03.nokia.com (mgw-mx03.nokia.com [192.100.122.230])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m8U7g9Ur010032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2008 10:42:10 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH] UBIFS: improve garbage collection
Date: Tue, 30 Sep 2008 12:19:14 +0300
Message-Id: <1222766358-21886-19-git-send-email-dedekind@infradead.org>
In-Reply-To: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
References: <1222766358-21886-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Adrian Hunter <ext-adrian.hunter@nokia.com>

Make garbage collection try to keep data nodes from the same
inode together and in ascending order.  This improves
performance when reading those nodes especially when bulk-read
is used.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 fs/ubifs/gc.c |   82 ++++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index a6b633a..0bef650 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -96,6 +96,48 @@ static int switch_gc_head(struct ubifs_info *c)
 }
 
 /**
+ * joinup - bring data nodes for an inode together.
+ * @c: UBIFS file-system description object
+ * @sleb: describes scanned LEB
+ * @inum: inode number
+ * @blk: block number
+ * @data: list to which to add data nodes
+ *
+ * This function looks at the first few nodes in the scanned LEB @sleb and adds
+ * them to @data if they are data nodes from @inum and have a larger block
+ * number than @blk. This function returns %0 on success and a negative error
+ * code on failure.
+ */
+static int joinup(struct ubifs_info *c, struct ubifs_scan_leb *sleb, ino_t inum,
+		  unsigned int blk, struct list_head *data)
+{
+	int err, cnt = 6, lnum = sleb->lnum, offs;
+	struct ubifs_scan_node *snod, *tmp;
+	union ubifs_key *key;
+
+	list_for_each_entry_safe(snod, tmp, &sleb->nodes, list) {
+		key = &snod->key;
+		if (key_inum(c, key) == inum &&
+		    key_type(c, key) == UBIFS_DATA_KEY &&
+		    key_block(c, key) > blk) {
+			offs = snod->offs;
+			err = ubifs_tnc_has_node(c, key, 0, lnum, offs, 0);
+			if (err < 0)
+				return err;
+			list_del(&snod->list);
+			if (err) {
+				list_add_tail(&snod->list, data);
+				blk = key_block(c, key);
+			} else
+				kfree(snod);
+			cnt = 6;
+		} else if (--cnt == 0)
+			break;
+	}
+	return 0;
+}
+
+/**
  * move_nodes - move nodes.
  * @c: UBIFS file-system description object
  * @sleb: describes nodes to move
@@ -116,16 +158,21 @@ static int switch_gc_head(struct ubifs_info *c)
 static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
 {
 	struct ubifs_scan_node *snod, *tmp;
-	struct list_head large, medium, small;
+	struct list_head data, large, medium, small;
 	struct ubifs_wbuf *wbuf = &c->jheads[GCHD].wbuf;
 	int avail, err, min = INT_MAX;
+	unsigned int blk = 0;
+	ino_t inum = 0;
 
+	INIT_LIST_HEAD(&data);
 	INIT_LIST_HEAD(&large);
 	INIT_LIST_HEAD(&medium);
 	INIT_LIST_HEAD(&small);
 
-	list_for_each_entry_safe(snod, tmp, &sleb->nodes, list) {
-		struct list_head *lst;
+	while (!list_empty(&sleb->nodes)) {
+		struct list_head *lst = sleb->nodes.next;
+
+		snod = list_entry(lst, struct ubifs_scan_node, list);
 
 		ubifs_assert(snod->type != UBIFS_IDX_NODE);
 		ubifs_assert(snod->type != UBIFS_REF_NODE);
@@ -136,7 +183,6 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
 		if (err < 0)
 			goto out;
 
-		lst = &snod->list;
 		list_del(lst);
 		if (!err) {
 			/* The node is obsolete, remove it from the list */
@@ -145,15 +191,30 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
 		}
 
 		/*
-		 * Sort the list of nodes so that large nodes go first, and
-		 * small nodes go last.
+		 * Sort the list of nodes so that data nodes go first, large
+		 * nodes go second, and small nodes go last.
 		 */
-		if (snod->len > MEDIUM_NODE_WM)
-			list_add(lst, &large);
+		if (key_type(c, &snod->key) == UBIFS_DATA_KEY) {
+			if (inum != key_inum(c, &snod->key)) {
+				if (inum) {
+					/*
+					 * Try to move data nodes from the same
+					 * inode together.
+					 */
+					err = joinup(c, sleb, inum, blk, &data);
+					if (err)
+						goto out;
+				}
+				inum = key_inum(c, &snod->key);
+				blk = key_block(c, &snod->key);
+			}
+			list_add_tail(lst, &data);
+		} else if (snod->len > MEDIUM_NODE_WM)
+			list_add_tail(lst, &large);
 		else if (snod->len > SMALL_NODE_WM)
-			list_add(lst, &medium);
+			list_add_tail(lst, &medium);
 		else
-			list_add(lst, &small);
+			list_add_tail(lst, &small);
 
 		/* And find the smallest node */
 		if (snod->len < min)
@@ -164,6 +225,7 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
 	 * Join the tree lists so that we'd have one roughly sorted list
 	 * ('large' will be the head of the joined list).
 	 */
+	list_splice(&data, &large);
 	list_splice(&medium, large.prev);
 	list_splice(&small, large.prev);
 
-- 
1.5.4.1

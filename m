Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6u-0002SS-Nv
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:07 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wE9028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:03 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/30] UBIFS: harmonize znode flag helpers
Date: Thu,  9 Jun 2011 12:04:49 +0300
Message-Id: <1307610310-28691-10-git-send-email-dedekind1@gmail.com>
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

We have 3 znode flags: cow, obsolete, dirty. For the last flag we have a
'ubifs_zn_dirty()' helper function, but for the other 2 flags we use
'test_bit()' directly.

This patch makes the situation more consistent and introduces helpers for the
other 2 flags: 'ubifs_zn_cow()' and 'ubifs_zn_obsolete()'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/commit.c     |    2 +-
 fs/ubifs/misc.h       |   23 +++++++++++++++++++++++
 fs/ubifs/tnc.c        |   13 ++++++-------
 fs/ubifs/tnc_commit.c |    8 ++++----
 4 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 8ab03d1..637e076 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -78,7 +78,7 @@ static int nothing_to_commit(struct ubifs_info *c)
 	 * If the root TNC node is dirty, we definitely have something to
 	 * commit.
 	 */
-	if (c->zroot.znode && test_bit(DIRTY_ZNODE, &c->zroot.znode->flags))
+	if (c->zroot.znode && ubifs_zn_dirty(c->zroot.znode))
 		return 0;
 
 	/*
diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index 0b5296a..160cd90 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -39,6 +39,29 @@ static inline int ubifs_zn_dirty(const struct ubifs_znode *znode)
 }
 
 /**
+ * ubifs_zn_obsolete - check if znode is obsolete.
+ * @znode: znode to check
+ *
+ * This helper function returns %1 if @znode is obsolete and %0 otherwise.
+ */
+static inline int ubifs_zn_obsolete(const struct ubifs_znode *znode)
+{
+	return !!test_bit(OBSOLETE_ZNODE, &znode->flags);
+}
+
+/**
+ * ubifs_zn_cow - check if znode has to be copied on write.
+ * @znode: znode to check
+ *
+ * This helper function returns %1 if @znode is has COW flag set and %0
+ * otherwise.
+ */
+static inline int ubifs_zn_cow(const struct ubifs_znode *znode)
+{
+	return !!test_bit(COW_ZNODE, &znode->flags);
+}
+
+/**
  * ubifs_wake_up_bgt - wake up background thread.
  * @c: UBIFS file-system description object
  */
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 48b6ee6..b32a537 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -223,7 +223,7 @@ static struct ubifs_znode *copy_znode(struct ubifs_info *c,
 	__set_bit(DIRTY_ZNODE, &zn->flags);
 	__clear_bit(COW_ZNODE, &zn->flags);
 
-	ubifs_assert(!test_bit(OBSOLETE_ZNODE, &znode->flags));
+	ubifs_assert(!ubifs_zn_obsolete(znode));
 	__set_bit(OBSOLETE_ZNODE, &znode->flags);
 
 	if (znode->level != 0) {
@@ -271,7 +271,7 @@ static struct ubifs_znode *dirty_cow_znode(struct ubifs_info *c,
 	struct ubifs_znode *zn;
 	int err;
 
-	if (!test_bit(COW_ZNODE, &znode->flags)) {
+	if (!ubifs_zn_cow(znode)) {
 		/* znode is not being committed */
 		if (!test_and_set_bit(DIRTY_ZNODE, &znode->flags)) {
 			atomic_long_inc(&c->dirty_zn_cnt);
@@ -2423,7 +2423,7 @@ static int tnc_delete(struct ubifs_info *c, struct ubifs_znode *znode, int n)
 	 */
 
 	do {
-		ubifs_assert(!test_bit(OBSOLETE_ZNODE, &znode->flags));
+		ubifs_assert(!ubifs_zn_obsolete(znode));
 		ubifs_assert(ubifs_zn_dirty(znode));
 
 		zp = znode->parent;
@@ -2479,9 +2479,8 @@ static int tnc_delete(struct ubifs_info *c, struct ubifs_znode *znode, int n)
 			c->zroot.offs = zbr->offs;
 			c->zroot.len = zbr->len;
 			c->zroot.znode = znode;
-			ubifs_assert(!test_bit(OBSOLETE_ZNODE,
-				     &zp->flags));
-			ubifs_assert(test_bit(DIRTY_ZNODE, &zp->flags));
+			ubifs_assert(!ubifs_zn_obsolete(zp));
+			ubifs_assert(ubifs_zn_dirty(zp));
 			atomic_long_dec(&c->dirty_zn_cnt);
 
 			if (zp->cnext) {
@@ -2865,7 +2864,7 @@ static void tnc_destroy_cnext(struct ubifs_info *c)
 		struct ubifs_znode *znode = cnext;
 
 		cnext = cnext->cnext;
-		if (test_bit(OBSOLETE_ZNODE, &znode->flags))
+		if (ubifs_zn_obsolete(znode))
 			kfree(znode);
 	} while (cnext && cnext != c->cnext);
 }
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index 8315387..f50c3e5 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -87,7 +87,7 @@ static int make_idx_node(struct ubifs_info *c, struct ubifs_idx_node *idx,
 	atomic_long_dec(&c->dirty_zn_cnt);
 
 	ubifs_assert(ubifs_zn_dirty(znode));
-	ubifs_assert(test_bit(COW_ZNODE, &znode->flags));
+	ubifs_assert(ubifs_zn_cow(znode));
 
 	__clear_bit(DIRTY_ZNODE, &znode->flags);
 	__clear_bit(COW_ZNODE, &znode->flags);
@@ -639,7 +639,7 @@ static int get_znodes_to_commit(struct ubifs_info *c)
 	}
 	cnt += 1;
 	while (1) {
-		ubifs_assert(!test_bit(COW_ZNODE, &znode->flags));
+		ubifs_assert(!ubifs_zn_cow(znode));
 		__set_bit(COW_ZNODE, &znode->flags);
 		znode->alt = 0;
 		cnext = find_next_dirty(znode);
@@ -888,7 +888,7 @@ static int write_index(struct ubifs_info *c)
 		cnext = znode->cnext;
 
 		ubifs_assert(ubifs_zn_dirty(znode));
-		ubifs_assert(test_bit(COW_ZNODE, &znode->flags));
+		ubifs_assert(ubifs_zn_cow(znode));
 
 		/*
 		 * It is important that other threads should see %DIRTY_ZNODE
@@ -983,7 +983,7 @@ static void free_obsolete_znodes(struct ubifs_info *c)
 	do {
 		znode = cnext;
 		cnext = znode->cnext;
-		if (test_bit(OBSOLETE_ZNODE, &znode->flags))
+		if (ubifs_zn_obsolete(znode))
 			kfree(znode);
 		else {
 			znode->cnext = NULL;
-- 
1.7.2.3

Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6u-0002ST-MZ
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:12 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEA028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:03 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/30] UBIFS: use correct flags in lprops
Date: Thu,  9 Jun 2011 12:04:50 +0300
Message-Id: <1307610310-28691-11-git-send-email-dedekind1@gmail.com>
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

The UBIFS lpt tree is in many aspects similar to the TNC tree, and we have
similar flags for these trees. And by mistake we use the COW_ZNODE flag for
LPT in some places, instead of the right flag COW_CNODE. And this works
only because these two constants have the same value.

This patch makes all the LPT code to use COW_CNODE and also changes COW_CNODE
constant value to make sure we do not misuse the flags any more.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/lprops.c     |    2 +-
 fs/ubifs/lpt_commit.c |    6 +++---
 fs/ubifs/ubifs.h      |    8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 667884f..98b8e73 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -504,7 +504,7 @@ static int is_lprops_dirty(struct ubifs_info *c, struct ubifs_lprops *lprops)
 	pnode = (struct ubifs_pnode *)container_of(lprops - pos,
 						   struct ubifs_pnode,
 						   lprops[0]);
-	return !test_bit(COW_ZNODE, &pnode->flags) &&
+	return !test_bit(COW_CNODE, &pnode->flags) &&
 	       test_bit(DIRTY_CNODE, &pnode->flags);
 }
 
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index dfcb574..254e8d3 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -116,8 +116,8 @@ static int get_cnodes_to_commit(struct ubifs_info *c)
 		return 0;
 	cnt += 1;
 	while (1) {
-		ubifs_assert(!test_bit(COW_ZNODE, &cnode->flags));
-		__set_bit(COW_ZNODE, &cnode->flags);
+		ubifs_assert(!test_bit(COW_CNODE, &cnode->flags));
+		__set_bit(COW_CNODE, &cnode->flags);
 		cnext = next_dirty_cnode(cnode);
 		if (!cnext) {
 			cnode->cnext = c->lpt_cnext;
@@ -465,7 +465,7 @@ static int write_cnodes(struct ubifs_info *c)
 		 */
 		clear_bit(DIRTY_CNODE, &cnode->flags);
 		smp_mb__before_clear_bit();
-		clear_bit(COW_ZNODE, &cnode->flags);
+		clear_bit(COW_CNODE, &cnode->flags);
 		smp_mb__after_clear_bit();
 		offs += len;
 		dbg_chk_lpt_sz(c, 1, len);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index f79983d..3304aad 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -230,14 +230,14 @@ enum {
  * LPT cnode flag bits.
  *
  * DIRTY_CNODE: cnode is dirty
- * COW_CNODE: cnode is being committed and must be copied before writing
  * OBSOLETE_CNODE: cnode is being committed and has been copied (or deleted),
- * so it can (and must) be freed when the commit is finished
+ *                 so it can (and must) be freed when the commit is finished
+ * COW_CNODE: cnode is being committed and must be copied before writing
  */
 enum {
 	DIRTY_CNODE    = 0,
-	COW_CNODE      = 1,
-	OBSOLETE_CNODE = 2,
+	OBSOLETE_CNODE = 1,
+	COW_CNODE      = 2,
 };
 
 /*
-- 
1.7.2.3

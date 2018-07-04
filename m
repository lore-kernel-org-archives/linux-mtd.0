Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fah72-0004Hv-Ef
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 12:42:29 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 04/25] ubifs: export pnode_lookup as ubifs_pnode_lookup
Date: Wed,  4 Jul 2018 14:41:16 +0200
Message-Id: <20180704124137.13396-5-s.hauer@pengutronix.de>
In-Reply-To: <20180704124137.13396-1-s.hauer@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubifs_lpt_lookup could be implemented using pnode_lookup. To make that
possible move pnode_lookup from lpt.c to lpt_commit.c. Rename it to
ubifs_pnode_lookup since it's now exported.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/lpt.c        | 32 ++++++++++++++++++++++++++++++++
 fs/ubifs/lpt_commit.c | 40 ++++------------------------------------
 fs/ubifs/ubifs.h      |  1 +
 3 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 8e99dad18880..6cd6f23d4512 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1436,6 +1436,38 @@ struct ubifs_pnode *ubifs_get_pnode(struct ubifs_info *c,
 	return branch->pnode;
 }
 
+/**
+ * ubifs_pnode_lookup - lookup a pnode in the LPT.
+ * @c: UBIFS file-system description object
+ * @i: pnode number (0 to (main_lebs - 1) / UBIFS_LPT_FANOUT)
+ *
+ * This function returns a pointer to the pnode on success or a negative
+ * error code on failure.
+ */
+struct ubifs_pnode *ubifs_pnode_lookup(struct ubifs_info *c, int i)
+{
+	int err, h, iip, shft;
+	struct ubifs_nnode *nnode;
+
+	if (!c->nroot) {
+		err = ubifs_read_nnode(c, NULL, 0);
+		if (err)
+			return ERR_PTR(err);
+	}
+	i <<= UBIFS_LPT_FANOUT_SHIFT;
+	nnode = c->nroot;
+	shft = c->lpt_hght * UBIFS_LPT_FANOUT_SHIFT;
+	for (h = 1; h < c->lpt_hght; h++) {
+		iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
+		shft -= UBIFS_LPT_FANOUT_SHIFT;
+		nnode = ubifs_get_nnode(c, nnode, iip);
+		if (IS_ERR(nnode))
+			return ERR_CAST(nnode);
+	}
+	iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
+	return ubifs_get_pnode(c, nnode, iip);
+}
+
 /**
  * ubifs_lpt_lookup - lookup LEB properties in the LPT.
  * @c: UBIFS file-system description object
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 78da65b2fb85..14e72d09b6b3 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -616,38 +616,6 @@ static struct ubifs_pnode *next_pnode_to_dirty(struct ubifs_info *c,
 	return ubifs_get_pnode(c, nnode, iip);
 }
 
-/**
- * pnode_lookup - lookup a pnode in the LPT.
- * @c: UBIFS file-system description object
- * @i: pnode number (0 to (main_lebs - 1) / UBIFS_LPT_FANOUT))
- *
- * This function returns a pointer to the pnode on success or a negative
- * error code on failure.
- */
-static struct ubifs_pnode *pnode_lookup(struct ubifs_info *c, int i)
-{
-	int err, h, iip, shft;
-	struct ubifs_nnode *nnode;
-
-	if (!c->nroot) {
-		err = ubifs_read_nnode(c, NULL, 0);
-		if (err)
-			return ERR_PTR(err);
-	}
-	i <<= UBIFS_LPT_FANOUT_SHIFT;
-	nnode = c->nroot;
-	shft = c->lpt_hght * UBIFS_LPT_FANOUT_SHIFT;
-	for (h = 1; h < c->lpt_hght; h++) {
-		iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
-		shft -= UBIFS_LPT_FANOUT_SHIFT;
-		nnode = ubifs_get_nnode(c, nnode, iip);
-		if (IS_ERR(nnode))
-			return ERR_CAST(nnode);
-	}
-	iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
-	return ubifs_get_pnode(c, nnode, iip);
-}
-
 /**
  * add_pnode_dirt - add dirty space to LPT LEB properties.
  * @c: UBIFS file-system description object
@@ -700,7 +668,7 @@ static int make_tree_dirty(struct ubifs_info *c)
 {
 	struct ubifs_pnode *pnode;
 
-	pnode = pnode_lookup(c, 0);
+	pnode = ubifs_pnode_lookup(c, 0);
 	if (IS_ERR(pnode))
 		return PTR_ERR(pnode);
 
@@ -954,7 +922,7 @@ static int make_pnode_dirty(struct ubifs_info *c, int node_num, int lnum,
 	struct ubifs_pnode *pnode;
 	struct ubifs_nbranch *branch;
 
-	pnode = pnode_lookup(c, node_num);
+	pnode = ubifs_pnode_lookup(c, node_num);
 	if (IS_ERR(pnode))
 		return PTR_ERR(pnode);
 	branch = &pnode->parent->nbranch[pnode->iip];
@@ -1556,7 +1524,7 @@ static int dbg_is_pnode_dirty(struct ubifs_info *c, int lnum, int offs)
 		struct ubifs_nbranch *branch;
 
 		cond_resched();
-		pnode = pnode_lookup(c, i);
+		pnode = ubifs_pnode_lookup(c, i);
 		if (IS_ERR(pnode))
 			return PTR_ERR(pnode);
 		branch = &pnode->parent->nbranch[pnode->iip];
@@ -1708,7 +1676,7 @@ int dbg_check_ltab(struct ubifs_info *c)
 	for (i = 0; i < cnt; i++) {
 		struct ubifs_pnode *pnode;
 
-		pnode = pnode_lookup(c, i);
+		pnode = ubifs_pnode_lookup(c, i);
 		if (IS_ERR(pnode))
 			return PTR_ERR(pnode);
 		cond_resched();
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 04bf84d71e7b..83c5e75ed3b6 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1695,6 +1695,7 @@ struct ubifs_pnode *ubifs_get_pnode(struct ubifs_info *c,
 				    struct ubifs_nnode *parent, int iip);
 struct ubifs_nnode *ubifs_get_nnode(struct ubifs_info *c,
 				    struct ubifs_nnode *parent, int iip);
+struct ubifs_pnode *ubifs_pnode_lookup(struct ubifs_info *c, int i);
 int ubifs_read_nnode(struct ubifs_info *c, struct ubifs_nnode *parent, int iip);
 void ubifs_add_lpt_dirt(struct ubifs_info *c, int lnum, int dirty);
 void ubifs_add_nnode_dirt(struct ubifs_info *c, struct ubifs_nnode *nnode);
-- 
2.18.0

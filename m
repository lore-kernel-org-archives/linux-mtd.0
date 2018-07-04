Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fah71-0000Wy-V5
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 12:42:27 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 17/25] ubifs: authentication: authenticate LPT
Date: Wed,  4 Jul 2018 14:41:29 +0200
Message-Id: <20180704124137.13396-18-s.hauer@pengutronix.de>
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

The LPT needs to be authenticated aswell. Since the LPT is only written
during commit it is enough to authenticate the whole LPT with a single
hash which is stored in the master node. Only the leaf nodes (pnodes)
are hashed which makes the implementation much simpler than it would be
to hash the complete LPT.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/lpt.c        | 127 ++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/lpt_commit.c |   4 ++
 fs/ubifs/ubifs.h      |   1 +
 3 files changed, 132 insertions(+)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index cde7b9484157..2c440bb31d69 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1633,6 +1633,129 @@ struct ubifs_lprops *ubifs_lpt_lookup_dirty(struct ubifs_info *c, int lnum)
 	return &pnode->lprops[iip];
 }
 
+/**
+ * ubifs_lpt_calc_hash - Calculate hash of the LPT pnodes
+ * @c: UBIFS file-system description object
+ * @hash: the returned hash of the LPT pnodes
+ *
+ * This function iterates over the LPT pnodes and creates a hash over them.
+ * Returns 0 for success or a negative error code otherwise.
+ */
+int ubifs_lpt_calc_hash(struct ubifs_info *c, u8 *hash)
+{
+	struct ubifs_nnode *nnode, *nn;
+	struct ubifs_cnode *cnode;
+	struct shash_desc *desc;
+	int iip = 0, i;
+	int bufsiz = max_t(int, c->nnode_sz, c->pnode_sz);
+	void *buf;
+	int err;
+
+	if (!ubifs_authenticated(c))
+		return 0;
+
+	desc = ubifs_hash_get_desc(c);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	buf = kmalloc(bufsiz, GFP_NOFS);
+	if (!buf) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	if (!c->nroot) {
+		err = ubifs_read_nnode(c, NULL, 0);
+		if (err)
+			return err;
+	}
+
+	cnode = (struct ubifs_cnode *)c->nroot;
+
+	while (cnode) {
+		nnode = cnode->parent;
+		nn = (struct ubifs_nnode *)cnode;
+		if (cnode->level > 1) {
+			while (iip < UBIFS_LPT_FANOUT) {
+				if (nn->nbranch[iip].lnum == 0) {
+					/* Go right */
+					iip++;
+					continue;
+				}
+
+				nnode = ubifs_get_nnode(c, nn, iip);
+				if (IS_ERR(nnode)) {
+					err = PTR_ERR(nnode);
+					goto out;
+				}
+
+				/* Go down */
+				iip = 0;
+				cnode = (struct ubifs_cnode *)nnode;
+				break;
+			}
+			if (iip < UBIFS_LPT_FANOUT)
+				continue;
+		} else {
+			struct ubifs_pnode *pnode;
+
+			for (i = 0; i < UBIFS_LPT_FANOUT; i++) {
+				if (nn->nbranch[i].lnum == 0)
+					continue;
+				pnode = ubifs_get_pnode(c, nn, i);
+				if (IS_ERR(pnode)) {
+					err = PTR_ERR(pnode);
+					goto out;
+				}
+
+				ubifs_pack_pnode(c, buf, pnode);
+				ubifs_shash_update(c, desc, buf, c->pnode_sz);
+			}
+		}
+		/* Go up and to the right */
+		iip = cnode->iip + 1;
+		cnode = (struct ubifs_cnode *)nnode;
+	}
+
+	err = 0;
+	ubifs_shash_final(c, desc, hash);
+out:
+	kfree(desc);
+	kfree(buf);
+
+	return err;
+}
+
+/**
+ * lpt_check_hash - check the hash of the LPT.
+ * @c: UBIFS file-system description object
+ *
+ * This function calculates a hash over all pnodes in the LPT and compares it with
+ * the hash stored in the master node. Returns %0 on success and a negative error
+ * code on failure.
+ */
+static int lpt_check_hash(struct ubifs_info *c)
+{
+	int err;
+	u8 hash[UBIFS_MAX_HASH_LEN];
+
+	if (!ubifs_authenticated(c))
+		return 0;
+
+	err = ubifs_lpt_calc_hash(c, hash);
+	if (err)
+		return err;
+
+	if (ubifs_check_hash(c, c->mst_node->hash_lpt, hash)) {
+		err = -EPERM;
+		ubifs_err(c, "Failed to authenticate LPT");
+	} else {
+		err = 0;
+	}
+
+	return err;
+}
+
 /**
  * lpt_init_rd - initialize the LPT for reading.
  * @c: UBIFS file-system description object
@@ -1674,6 +1797,10 @@ static int lpt_init_rd(struct ubifs_info *c)
 	if (err)
 		return err;
 
+	err = lpt_check_hash(c);
+	if (err)
+		return err;
+
 	dbg_lp("space_bits %d", c->space_bits);
 	dbg_lp("lpt_lnum_bits %d", c->lpt_lnum_bits);
 	dbg_lp("lpt_offs_bits %d", c->lpt_offs_bits);
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 14e72d09b6b3..817586f4962c 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1245,6 +1245,10 @@ int ubifs_lpt_start_commit(struct ubifs_info *c)
 	if (err)
 		goto out;
 
+	err = ubifs_lpt_calc_hash(c, c->mst_node->hash_lpt);
+	if (err)
+		goto out;
+
 	/* Copy the LPT's own lprops for end commit to write */
 	memcpy(c->ltab_cmt, c->ltab,
 	       sizeof(struct ubifs_lpt_lprops) * c->lpt_lebs);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 5390d087da3a..5234a7c9380c 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1913,6 +1913,7 @@ struct ubifs_nnode *ubifs_first_nnode(struct ubifs_info *c, int *hght);
 /* Needed only in debugging code in lpt_commit.c */
 int ubifs_unpack_nnode(const struct ubifs_info *c, void *buf,
 		       struct ubifs_nnode *nnode);
+int ubifs_lpt_calc_hash(struct ubifs_info *c, u8 *hash);
 
 /* lpt_commit.c */
 int ubifs_lpt_start_commit(struct ubifs_info *c);
-- 
2.18.0

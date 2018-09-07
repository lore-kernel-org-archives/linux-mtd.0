Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyG2Z-0001v3-T3
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 12:39:13 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 20/25] ubifs: Create hash for default LPT
Date: Fri,  7 Sep 2018 14:36:41 +0200
Message-Id: <20180907123646.12688-21-s.hauer@pengutronix.de>
In-Reply-To: <20180907123646.12688-1-s.hauer@pengutronix.de>
References: <20180907123646.12688-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

During creation of the default filesystem on an empty flash the default
LPT is created. With this patch a hash over the default LPT is
calculated which can be added to the default filesystems master node.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/lpt.c   | 21 ++++++++++++++++++++-
 fs/ubifs/sb.c    |  3 ++-
 fs/ubifs/ubifs.h |  2 +-
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index ee18305a6152..d1d5e96350dd 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -604,11 +604,12 @@ static int calc_pnode_num_from_parent(const struct ubifs_info *c,
  * @lpt_first: LEB number of first LPT LEB
  * @lpt_lebs: number of LEBs for LPT is passed and returned here
  * @big_lpt: use big LPT model is passed and returned here
+ * @hash: hash of the LPT is returned here
  *
  * This function returns %0 on success and a negative error code on failure.
  */
 int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
-			  int *lpt_lebs, int *big_lpt)
+			  int *lpt_lebs, int *big_lpt, u8 *hash)
 {
 	int lnum, err = 0, node_sz, iopos, i, j, cnt, len, alen, row;
 	int blnum, boffs, bsz, bcnt;
@@ -617,6 +618,7 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 	void *buf = NULL, *p;
 	struct ubifs_lpt_lprops *ltab = NULL;
 	int *lsave = NULL;
+	struct shash_desc *desc;
 
 	err = calc_dflt_lpt_geom(c, main_lebs, big_lpt);
 	if (err)
@@ -630,6 +632,10 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 	/* Needed by 'ubifs_pack_lsave()' */
 	c->main_first = c->leb_cnt - *main_lebs;
 
+	desc = ubifs_hash_get_desc(c);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
 	lsave = kmalloc_array(c->lsave_cnt, sizeof(int), GFP_KERNEL);
 	pnode = kzalloc(sizeof(struct ubifs_pnode), GFP_KERNEL);
 	nnode = kzalloc(sizeof(struct ubifs_nnode), GFP_KERNEL);
@@ -677,6 +683,10 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 
 	/* Add first pnode */
 	ubifs_pack_pnode(c, p, pnode);
+	err = ubifs_shash_update(c, desc, p, c->pnode_sz);
+	if (err)
+		goto out;
+
 	p += c->pnode_sz;
 	len = c->pnode_sz;
 	pnode->num += 1;
@@ -711,6 +721,10 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 			len = 0;
 		}
 		ubifs_pack_pnode(c, p, pnode);
+		err = ubifs_shash_update(c, desc, p, c->pnode_sz);
+		if (err)
+			goto out;
+
 		p += c->pnode_sz;
 		len += c->pnode_sz;
 		/*
@@ -830,6 +844,10 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 	if (err)
 		goto out;
 
+	err = ubifs_shash_final(c, desc, hash);
+	if (err)
+		goto out;
+
 	c->nhead_lnum = lnum;
 	c->nhead_offs = ALIGN(len, c->min_io_size);
 
@@ -853,6 +871,7 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 		dbg_lp("LPT lsave is at %d:%d", c->lsave_lnum, c->lsave_offs);
 out:
 	c->ltab = NULL;
+	kfree(desc);
 	kfree(lsave);
 	vfree(ltab);
 	vfree(buf);
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 7e08c8143316..572756579532 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -87,6 +87,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	__le64 tmp_le64;
 	__le32 tmp_le32;
 	struct timespec64 ts;
+	u8 hash_lpt[UBIFS_HASH_ARR_SZ];
 
 	/* Some functions called from here depend on the @c->key_len filed */
 	c->key_len = UBIFS_SK_LEN;
@@ -148,7 +149,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	c->lsave_cnt = DEFAULT_LSAVE_CNT;
 	c->max_leb_cnt = c->leb_cnt;
 	err = ubifs_create_dflt_lpt(c, &main_lebs, lpt_first, &lpt_lebs,
-				    &big_lpt);
+				    &big_lpt, hash_lpt);
 	if (err)
 		return err;
 
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index c26d3c600e4d..504b651b78f1 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1934,7 +1934,7 @@ int ubifs_clear_orphans(struct ubifs_info *c);
 /* lpt.c */
 int ubifs_calc_lpt_geom(struct ubifs_info *c);
 int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
-			  int *lpt_lebs, int *big_lpt);
+			  int *lpt_lebs, int *big_lpt, u8 *hash);
 int ubifs_lpt_init(struct ubifs_info *c, int rd, int wr);
 struct ubifs_lprops *ubifs_lpt_lookup(struct ubifs_info *c, int lnum);
 struct ubifs_lprops *ubifs_lpt_lookup_dirty(struct ubifs_info *c, int lnum);
-- 
2.18.0

Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyG2R-0001um-Ec
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 12:39:05 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 22/25] ubifs: Add hashes and HMACs to default filesystem
Date: Fri,  7 Sep 2018 14:36:43 +0200
Message-Id: <20180907123646.12688-23-s.hauer@pengutronix.de>
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

This patch calculates the necessary hashes and HMACs for the default
filesystem so that the dynamically created default fs can be
authenticated.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/sb.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 7f0967771c9f..ac1ed5ad126d 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -87,6 +87,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	__le64 tmp_le64;
 	__le32 tmp_le32;
 	struct timespec64 ts;
+	u8 hash[UBIFS_HASH_ARR_SZ];
 	u8 hash_lpt[UBIFS_HASH_ARR_SZ];
 
 	/* Some functions called from here depend on the @c->key_len filed */
@@ -177,6 +178,16 @@ static int create_default_filesystem(struct ubifs_info *c)
 		sup_flags |= UBIFS_FLG_BIGLPT;
 	sup_flags |= UBIFS_FLG_DOUBLE_HASH;
 
+	if (ubifs_authenticated(c)) {
+		sup_flags |= UBIFS_FLG_AUTHENTICATION;
+		sup->hash_algo = cpu_to_le16(c->auth_hash_algo);
+		err = ubifs_hmac_wkm(c, sup->hmac_wkm);
+		if (err)
+			goto out;
+	} else {
+		sup->hash_algo = 0xffff;
+	}
+
 	sup->ch.node_type  = UBIFS_SB_NODE;
 	sup->key_hash      = UBIFS_KEY_HASH_R5;
 	sup->flags         = cpu_to_le32(sup_flags);
@@ -235,6 +246,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	mst->empty_lebs   = cpu_to_le32(main_lebs - 2);
 	mst->idx_lebs     = cpu_to_le32(1);
 	mst->leb_cnt      = cpu_to_le32(c->leb_cnt);
+	ubifs_copy_hash(c, hash_lpt, mst->hash_lpt);
 
 	/* Calculate lprops statistics */
 	tmp64 = main_bytes;
@@ -307,25 +319,33 @@ static int create_default_filesystem(struct ubifs_info *c)
 
 	cs->ch.node_type = UBIFS_CS_NODE;
 
-	err = ubifs_write_node(c, sup, UBIFS_SB_NODE_SZ, 0, 0);
+	err = ubifs_write_node_hmac(c, sup, UBIFS_SB_NODE_SZ, 0, 0,
+				    offsetof(struct ubifs_sb_node, hmac));
 	if (err)
 		goto out;
 
-	err = ubifs_write_node(c, mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM, 0);
+	err = ubifs_write_node(c, ino, UBIFS_INO_NODE_SZ,
+			       main_first + DEFAULT_DATA_LEB, 0);
 	if (err)
 		goto out;
 
-	err = ubifs_write_node(c, mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM + 1,
-			       0);
+	ubifs_node_calc_hash(c, ino, hash);
+	ubifs_copy_hash(c, hash, ubifs_branch_hash(c, br));
+
+	err = ubifs_write_node(c, idx, idx_node_size, main_first + DEFAULT_IDX_LEB, 0);
 	if (err)
 		goto out;
 
-	err = ubifs_write_node(c, idx, idx_node_size, main_first + DEFAULT_IDX_LEB, 0);
+	ubifs_node_calc_hash(c, idx, hash);
+	ubifs_copy_hash(c, hash, mst->hash_root_idx);
+
+	err = ubifs_write_node_hmac(c, mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM, 0,
+		offsetof(struct ubifs_mst_node, hmac));
 	if (err)
 		goto out;
 
-	err = ubifs_write_node(c, ino, UBIFS_INO_NODE_SZ,
-			       main_first + DEFAULT_DATA_LEB, 0);
+	err = ubifs_write_node_hmac(c, mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM + 1,
+			       0, offsetof(struct ubifs_mst_node, hmac));
 	if (err)
 		goto out;
 
-- 
2.18.0

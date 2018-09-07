Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyG2R-0001uW-D7
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 12:39:04 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 21/25] ubifs: authentication: Authenticate super block node
Date: Fri,  7 Sep 2018 14:36:42 +0200
Message-Id: <20180907123646.12688-22-s.hauer@pengutronix.de>
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

This adds a HMAC covering the super block node and adds the logic that
decides if a filesystem shall be mounted unauthenticated or
authenticated.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/sb.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 572756579532..7f0967771c9f 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -517,6 +517,65 @@ static struct ubifs_sb_node *ubifs_read_sb_node(struct ubifs_info *c)
 	return sup;
 }
 
+static int authenticate_sb_node(struct ubifs_info *c,
+				const struct ubifs_sb_node *sup)
+{
+	unsigned int sup_flags = le32_to_cpu(sup->flags);
+	u8 hmac_wkm[UBIFS_HMAC_ARR_SZ];
+	int authenticated = !!(sup_flags & UBIFS_FLG_AUTHENTICATION);
+	int hash_algo;
+	int err;
+
+	if (c->authenticated && !authenticated) {
+		ubifs_err(c, "authenticated FS forced, but found FS without authentication");
+		return -EINVAL;
+	}
+
+	if (!c->authenticated && authenticated) {
+		ubifs_err(c, "authenticated FS found, but no key given");
+		return -EINVAL;
+	}
+
+	ubifs_msg(c, "Mounting in %sauthenticated mode",
+		  c->authenticated ? "" : "un");
+
+	if (!c->authenticated)
+		return 0;
+
+	if (!IS_ENABLED(CONFIG_UBIFS_FS_AUTHENTICATION))
+		return -EOPNOTSUPP;
+
+	hash_algo = le16_to_cpu(sup->hash_algo);
+	if (hash_algo >= HASH_ALGO__LAST) {
+		ubifs_err(c, "superblock uses unknown hash algo %d",
+			  hash_algo);
+		return -EINVAL;
+	}
+
+	if (strcmp(hash_algo_name[hash_algo], c->auth_hash_name)) {
+		ubifs_err(c, "This filesystem uses %s for hashing,"
+			     " but %s is specified", hash_algo_name[hash_algo],
+			     c->auth_hash_name);
+		return -EINVAL;
+	}
+
+	err = ubifs_hmac_wkm(c, hmac_wkm);
+	if (err)
+		return err;
+
+	if (ubifs_check_hmac(c, hmac_wkm, sup->hmac_wkm)) {
+		ubifs_err(c, "provided key does not fit");
+		return -ENOKEY;
+	}
+
+	err = ubifs_node_verify_hmac(c, sup, sizeof(*sup),
+				     offsetof(struct ubifs_sb_node, hmac));
+	if (err)
+		ubifs_err(c, "Failed to authenticate superblock: %d", err);
+
+	return err;
+}
+
 /**
  * ubifs_write_sb_node - write superblock node.
  * @c: UBIFS file-system description object
@@ -527,8 +586,13 @@ static struct ubifs_sb_node *ubifs_read_sb_node(struct ubifs_info *c)
 int ubifs_write_sb_node(struct ubifs_info *c, struct ubifs_sb_node *sup)
 {
 	int len = ALIGN(UBIFS_SB_NODE_SZ, c->min_io_size);
+	int err;
+
+	err = ubifs_prepare_node_hmac(c, sup, UBIFS_SB_NODE_SZ,
+				      offsetof(struct ubifs_sb_node, hmac), 1);
+	if (err)
+		return err;
 
-	ubifs_prepare_node(c, sup, UBIFS_SB_NODE_SZ, 1);
 	return ubifs_leb_change(c, UBIFS_SB_LNUM, sup, len);
 }
 
@@ -642,6 +706,10 @@ int ubifs_read_superblock(struct ubifs_info *c)
 	c->double_hash = !!(sup_flags & UBIFS_FLG_DOUBLE_HASH);
 	c->encrypted = !!(sup_flags & UBIFS_FLG_ENCRYPTION);
 
+	err = authenticate_sb_node(c, sup);
+	if (err)
+		goto out;
+
 	if ((sup_flags & ~UBIFS_FLG_MASK) != 0) {
 		ubifs_err(c, "Unknown feature flags found: %#x",
 			  sup_flags & ~UBIFS_FLG_MASK);
-- 
2.18.0

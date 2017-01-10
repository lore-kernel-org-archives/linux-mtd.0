Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQu0J-0006QY-P6
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 10:50:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, richard@nod.at, dedekind1@gmail.com,
 adrian.hunter@intel.com, david@sigma-star.at, rockdotlee@gmail.com
Subject: [PATCH 2/2] ubifs: Move tnc_read_hashed_node() to get rid of
 prototypes.
Date: Tue, 10 Jan 2017 11:49:41 +0100
Message-Id: <20170110104941.27067-2-richard@nod.at>
In-Reply-To: <20170110104941.27067-1-richard@nod.at>
References: <20170110104941.27067-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reviewed-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/tnc.c | 97 ++++++++++++++++++++++++++++------------------------------
 1 file changed, 46 insertions(+), 51 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 709aa098dd46..ce69f170b7c5 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -34,11 +34,6 @@
 #include <linux/slab.h>
 #include "ubifs.h"
 
-static int try_read_node(const struct ubifs_info *c, void *buf, int type,
-			 int len, int lnum, int offs);
-static int fallible_read_node(struct ubifs_info *c, const union ubifs_key *key,
-			      struct ubifs_zbranch *zbr, void *node);
-
 /*
  * Returned codes of 'matches_name()' and 'fallible_matches_name()' functions.
  * @NAME_LESS: name corresponding to the first argument is less than second
@@ -383,52 +378,6 @@ static void lnc_free(struct ubifs_zbranch *zbr)
 }
 
 /**
- * tnc_read_hashed_node - read a "hashed" leaf node.
- * @c: UBIFS file-system description object
- * @zbr: key and position of the node
- * @node: node is returned here
- *
- * This function reads a "hashed" node defined by @zbr from the leaf node cache
- * (in it is there) or from the hash media, in which case the node is also
- * added to LNC. Returns zero in case of success or a negative negative error
- * code in case of failure.
- */
-static int tnc_read_hashed_node(struct ubifs_info *c, struct ubifs_zbranch *zbr,
-				void *node)
-{
-	int err;
-
-	ubifs_assert(is_hash_key(c, &zbr->key));
-
-	if (zbr->leaf) {
-		/* Read from the leaf node cache */
-		ubifs_assert(zbr->len != 0);
-		memcpy(node, zbr->leaf, zbr->len);
-		return 0;
-	}
-
-	if (c->replaying) {
-		err = fallible_read_node(c, &zbr->key, zbr, node);
-		/*
-		 * When the node was not found, return -ENOENT, 0 otherwise.
-		 * Negative return codes stay as-is.
-		 */
-		if (err == 0)
-			err = -ENOENT;
-		else if (err == 1)
-			err = 0;
-	} else {
-		err = ubifs_tnc_read_node(c, zbr, node);
-	}
-	if (err)
-		return err;
-
-	/* Add the node to the leaf node cache */
-	err = lnc_add(c, zbr, node);
-	return err;
-}
-
-/**
  * try_read_node - read a node if it is a node.
  * @c: UBIFS file-system description object
  * @buf: buffer to read to
@@ -525,6 +474,52 @@ static int fallible_read_node(struct ubifs_info *c, const union ubifs_key *key,
 }
 
 /**
+ * tnc_read_hashed_node - read a "hashed" leaf node.
+ * @c: UBIFS file-system description object
+ * @zbr: key and position of the node
+ * @node: node is returned here
+ *
+ * This function reads a "hashed" node defined by @zbr from the leaf node cache
+ * (in it is there) or from the hash media, in which case the node is also
+ * added to LNC. Returns zero in case of success or a negative negative error
+ * code in case of failure.
+ */
+static int tnc_read_hashed_node(struct ubifs_info *c, struct ubifs_zbranch *zbr,
+				void *node)
+{
+	int err;
+
+	ubifs_assert(is_hash_key(c, &zbr->key));
+
+	if (zbr->leaf) {
+		/* Read from the leaf node cache */
+		ubifs_assert(zbr->len != 0);
+		memcpy(node, zbr->leaf, zbr->len);
+		return 0;
+	}
+
+	if (c->replaying) {
+		err = fallible_read_node(c, &zbr->key, zbr, node);
+		/*
+		 * When the node was not found, return -ENOENT, 0 otherwise.
+		 * Negative return codes stay as-is.
+		 */
+		if (err == 0)
+			err = -ENOENT;
+		else if (err == 1)
+			err = 0;
+	} else {
+		err = ubifs_tnc_read_node(c, zbr, node);
+	}
+	if (err)
+		return err;
+
+	/* Add the node to the leaf node cache */
+	err = lnc_add(c, zbr, node);
+	return err;
+}
+
+/**
  * matches_name - determine if a direntry or xattr entry matches a given name.
  * @c: UBIFS file-system description object
  * @zbr: zbranch of dent
-- 
2.10.2

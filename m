Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fah7K-0003M6-Ra
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 12:42:45 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 03/25] ubifs: pass ubifs_zbranch to read_znode()
Date: Wed,  4 Jul 2018 14:41:15 +0200
Message-Id: <20180704124137.13396-4-s.hauer@pengutronix.de>
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

read_znode() takes len, lnum and offs arguments which the caller all
extracts from the same struct ubifs_zbranch *. When adding authentication
support we would have to add a pointer to a hash to the arguments which
is also part of struct ubifs_zbranch. Pass the ubifs_zbranch * instead
so that we do not have to add another argument.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/tnc_misc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
index 93f5b7859e6f..7e18d459906c 100644
--- a/fs/ubifs/tnc_misc.c
+++ b/fs/ubifs/tnc_misc.c
@@ -259,9 +259,7 @@ long ubifs_destroy_tnc_subtree(struct ubifs_znode *znode)
 /**
  * read_znode - read an indexing node from flash and fill znode.
  * @c: UBIFS file-system description object
- * @lnum: LEB of the indexing node to read
- * @offs: node offset
- * @len: node length
+ * @zbr: the zbranch describing the node to read
  * @znode: znode to read to
  *
  * This function reads an indexing node from the flash media and fills znode
@@ -270,9 +268,12 @@ long ubifs_destroy_tnc_subtree(struct ubifs_znode *znode)
  * is wrong with it, this function prints complaint messages and returns
  * %-EINVAL.
  */
-static int read_znode(struct ubifs_info *c, int lnum, int offs, int len,
+static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
 		      struct ubifs_znode *znode)
 {
+	int lnum = zzbr->lnum;
+	int offs = zzbr->offs;
+	int len = zzbr->len;
 	int i, err, type, cmp;
 	struct ubifs_idx_node *idx;
 
@@ -419,7 +420,7 @@ struct ubifs_znode *ubifs_load_znode(struct ubifs_info *c,
 	if (!znode)
 		return ERR_PTR(-ENOMEM);
 
-	err = read_znode(c, zbr->lnum, zbr->offs, zbr->len, znode);
+	err = read_znode(c, zbr, znode);
 	if (err)
 		goto out;
 
-- 
2.18.0

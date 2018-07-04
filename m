Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fah72-0004Hw-Ff
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 12:42:32 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 05/25] ubifs: implement ubifs_lpt_lookup using
 ubifs_pnode_lookup
Date: Wed,  4 Jul 2018 14:41:17 +0200
Message-Id: <20180704124137.13396-6-s.hauer@pengutronix.de>
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

ubifs_lpt_lookup() starts by looking up the nth pnode in the LPT. We
already have this functionality in ubifs_pnode_lookup(). Use this
function rather than open coding its functionality.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/lpt.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 6cd6f23d4512..cde7b9484157 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1478,27 +1478,11 @@ struct ubifs_pnode *ubifs_pnode_lookup(struct ubifs_info *c, int i)
  */
 struct ubifs_lprops *ubifs_lpt_lookup(struct ubifs_info *c, int lnum)
 {
-	int err, i, h, iip, shft;
-	struct ubifs_nnode *nnode;
+	int i, iip;
 	struct ubifs_pnode *pnode;
 
-	if (!c->nroot) {
-		err = ubifs_read_nnode(c, NULL, 0);
-		if (err)
-			return ERR_PTR(err);
-	}
-	nnode = c->nroot;
 	i = lnum - c->main_first;
-	shft = c->lpt_hght * UBIFS_LPT_FANOUT_SHIFT;
-	for (h = 1; h < c->lpt_hght; h++) {
-		iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
-		shft -= UBIFS_LPT_FANOUT_SHIFT;
-		nnode = ubifs_get_nnode(c, nnode, iip);
-		if (IS_ERR(nnode))
-			return ERR_CAST(nnode);
-	}
-	iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
-	pnode = ubifs_get_pnode(c, nnode, iip);
+	pnode = ubifs_pnode_lookup(c, i);
 	if (IS_ERR(pnode))
 		return ERR_CAST(pnode);
 	iip = (i & (UBIFS_LPT_FANOUT - 1));
-- 
2.18.0

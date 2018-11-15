Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNQ5Y-0002HO-Vf
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 22:26:18 +0000
Received: by mail-wm1-x344.google.com with SMTP id u13-v6so19450936wmc.4
 for <linux-mtd@lists.infradead.org>; Thu, 15 Nov 2018 14:26:06 -0800 (PST)
From: Garry McNulty <garrmcnu@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 Garry McNulty <garrmcnu@gmail.com>
Subject: [PATCH v2] ubifs: fix memory leak on error condition
Date: Thu, 15 Nov 2018 22:25:58 +0000
Message-Id: <20181115222558.19189-1-garrmcnu@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the call to ubifs_read_nnode() fails in ubifs_lpt_calc_hash() an
error is returned without freeing the memory allocated to 'buf'.
Read and check the root node before allocating the buffer.

Detected by CoverityScan, CID 1441025 ("Resource leak")

Signed-off-by: Garry McNulty <garrmcnu@gmail.com>
---
 fs/ubifs/lpt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index d1d5e96350dd..b0c5f06128b5 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1675,6 +1675,12 @@ int ubifs_lpt_calc_hash(struct ubifs_info *c, u8 *hash)
 	if (!ubifs_authenticated(c))
 		return 0;
 
+	if (!c->nroot) {
+		err = ubifs_read_nnode(c, NULL, 0);
+		if (err)
+			return err;
+	}
+
 	desc = ubifs_hash_get_desc(c);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
@@ -1685,12 +1691,6 @@ int ubifs_lpt_calc_hash(struct ubifs_info *c, u8 *hash)
 		goto out;
 	}
 
-	if (!c->nroot) {
-		err = ubifs_read_nnode(c, NULL, 0);
-		if (err)
-			return err;
-	}
-
 	cnode = (struct ubifs_cnode *)c->nroot;
 
 	while (cnode) {
-- 
2.14.5

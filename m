Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNOPv-0003Xi-Du
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 20:39:12 +0000
Received: by mail-wr1-x443.google.com with SMTP id v18-v6so22611390wrt.8
 for <linux-mtd@lists.infradead.org>; Thu, 15 Nov 2018 12:38:59 -0800 (PST)
From: Garry McNulty <garrmcnu@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 Garry McNulty <garrmcnu@gmail.com>
Subject: [PATCH] ubifs: fix memory leak on error condition
Date: Thu, 15 Nov 2018 20:38:50 +0000
Message-Id: <20181115203850.5774-1-garrmcnu@gmail.com>
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
Jump to 'out' label to free allocated memory and return the error code.

Detected by CoverityScan, CID 1441025 ("Resource leak")

Signed-off-by: Garry McNulty <garrmcnu@gmail.com>
---
 fs/ubifs/lpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index d1d5e96350dd..c162459a1e02 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1688,7 +1688,7 @@ int ubifs_lpt_calc_hash(struct ubifs_info *c, u8 *hash)
 	if (!c->nroot) {
 		err = ubifs_read_nnode(c, NULL, 0);
 		if (err)
-			return err;
+			goto out;
 	}
 
 	cnode = (struct ubifs_cnode *)c->nroot;
-- 
2.14.5

Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcHB6-0007Lz-L1
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 21:25:10 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: gc: Fix typo
Date: Sun,  8 Jul 2018 23:24:46 +0200
Message-Id: <20180708212446.23996-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBIFS operates on LEBs, not PEBs.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 11c09ce3c795..a57be0b698b5 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -483,7 +483,7 @@ int ubifs_garbage_collect_leb(struct ubifs_info *c, struct ubifs_lprops *lp)
 			/*
 			 * Write buffers must be sync'd before unmapping
 			 * freeable LEBs, because one of them may contain data
-			 * which obsoletes something in 'lp->pnum'.
+			 * which obsoletes something in 'lp->lnum'.
 			 */
 			err = gc_sync_wbufs(c);
 			if (err)
-- 
2.18.0

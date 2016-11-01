Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1SpY-0004Qd-Up
 for linux-mtd@lists.infradead.org; Tue, 01 Nov 2016 06:45:58 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: richard@nod.at,
	dedekind1@gmail.com,
	adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] UBIFS: Remove some dead code
Date: Tue,  1 Nov 2016 07:45:25 +0100
Message-Id: <20161101064525.11813-1-christophe.jaillet@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

'ubifs_fast_find_freeable()' can not return an error pointer, so this test
can be removed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/ubifs/gc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index e845c64b6ce1..7b35e3d6cde7 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -846,10 +846,6 @@ int ubifs_gc_start_commit(struct ubifs_info *c)
 	 */
 	while (1) {
 		lp = ubifs_fast_find_freeable(c);
-		if (IS_ERR(lp)) {
-			err = PTR_ERR(lp);
-			goto out;
-		}
 		if (!lp)
 			break;
 		ubifs_assert(!(lp->flags & LPROPS_TAKEN));
-- 
2.9.3

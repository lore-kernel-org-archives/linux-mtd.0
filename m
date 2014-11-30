Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv3FP-0004WP-Ff
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 12:05:05 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 1/6] UBI: Fastmap: Fix leb_count unbalance
Date: Sun, 30 Nov 2014 13:04:25 +0100
Message-Id: <1417349070-8894-2-git-send-email-richard@nod.at>
In-Reply-To: <1417349070-8894-1-git-send-email-richard@nod.at>
References: <1417349070-8894-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If a LEB is unmapped we have to decrement leb_count as well.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 3d913f5..5db41a5 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -362,6 +362,7 @@ static void unmap_peb(struct ubi_attach_info *ai, int pnum)
 			aeb = rb_entry(node2, struct ubi_ainf_peb, u.rb);
 			if (aeb->pnum == pnum) {
 				rb_erase(&aeb->u.rb, &av->root);
+				av->leb_count--;
 				kmem_cache_free(ai->aeb_slab_cache, aeb);
 				return;
 			}
-- 
1.8.4.5

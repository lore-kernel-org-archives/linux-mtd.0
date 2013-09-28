Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPuzv-0003Wt-H8
 for linux-mtd@lists.infradead.org; Sat, 28 Sep 2013 13:55:53 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 1/7] UBI: fix refill_wl_user_pool()
Date: Sat, 28 Sep 2013 15:55:10 +0200
Message-Id: <1380376516-30144-2-git-send-email-richard@nod.at>
In-Reply-To: <1380376516-30144-1-git-send-email-richard@nod.at>
References: <1380376516-30144-1-git-send-email-richard@nod.at>
Cc: richard.genoud@gmail.com, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If no free PEBs are available refill_wl_user_pool() must not
return with -ENOSPC immediately.
It has to block till produce_free_peb() produced a free PEB.

Reported-and-Tested-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/wl.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index c95bfb1..02317c1 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -599,10 +599,6 @@ static void refill_wl_user_pool(struct ubi_device *ubi)
 	return_unused_pool_pebs(ubi, pool);
 
 	for (pool->size = 0; pool->size < pool->max_size; pool->size++) {
-		if (!ubi->free.rb_node ||
-		   (ubi->free_count - ubi->beb_rsvd_pebs < 1))
-			break;
-
 		pool->pebs[pool->size] = __wl_get_peb(ubi);
 		if (pool->pebs[pool->size] < 0)
 			break;
-- 
1.8.3.1

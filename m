Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcXQQ-0006Tp-6F
 for linux-mtd@lists.infradead.org; Wed, 24 Aug 2016 12:36:59 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] ubi: Fix Fastmap's update_vol()
Date: Wed, 24 Aug 2016 14:36:15 +0200
Message-Id: <1472042175-8655-3-git-send-email-richard@nod.at>
In-Reply-To: <1472042175-8655-1-git-send-email-richard@nod.at>
References: <1472042175-8655-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Usually Fastmap is free to consider every PEB in one of the pools
as newer than the existing PEB. Since PEBs in a pool are by definition
newer than everything else.
But update_vol() missed the case that a pool can contain more than
one candidate.

Cc: <stable@vger.kernel.org>
Fixes: dbb7d2a88d ("UBI: Add fastmap core")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index da33100..ccb3ceb 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -328,6 +328,7 @@ static int update_vol(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			aeb->pnum = new_aeb->pnum;
 			aeb->copy_flag = new_vh->copy_flag;
 			aeb->scrub = new_aeb->scrub;
+			aeb->sqnum = new_aeb->sqnum;
 			kmem_cache_free(ai->aeb_slab_cache, new_aeb);
 
 		/* new_aeb is older */
-- 
2.7.3

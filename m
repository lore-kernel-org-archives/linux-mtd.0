Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebvzJ-0003Uw-Cq
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 22:15:18 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org
Subject: [PATCH] ubi: fastmap: Don't flush fastmap work on detach
Date: Wed, 17 Jan 2018 23:15:57 +0100
Message-Id: <20180117221557.16768-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At this point UBI volumes have already been free()'ed and fastmap can no
longer access these data structures.

Reported-by: Martin Townsend <mtownsend1973@gmail.com>
Fixes: 74cdaf24004a ("UBI: Fastmap: Fix memory leaks while closing the WL sub-system")
Cc: stable@vger.kernel.org
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap-wl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 4f0bd6b4422a..69dd21679a30 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -362,7 +362,6 @@ static void ubi_fastmap_close(struct ubi_device *ubi)
 {
 	int i;
 
-	flush_work(&ubi->fm_work);
 	return_unused_pool_pebs(ubi, &ubi->fm_pool);
 	return_unused_pool_pebs(ubi, &ubi->fm_wl_pool);
 
-- 
2.13.6

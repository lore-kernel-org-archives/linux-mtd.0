Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAwSm-0007Nv-RT
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2015 08:36:50 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH 3/3] UBI: Fix debug message
Date: Fri,  3 Jul 2015 10:36:16 +0200
Message-Id: <1435912576-27878-3-git-send-email-richard@nod.at>
In-Reply-To: <1435912576-27878-1-git-send-email-richard@nod.at>
References: <1435912576-27878-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have to use j instead of i. i is the volume id
and not the block.

Reported-by: Alexander.Block@continental-corporation.com
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index b55dc8e..98595c5 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1409,7 +1409,7 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 					continue;
 
 				ubi_err(ubi, "LEB:%i:%i is PEB:%i instead of %i!",
-					vol->vol_id, i, fm_eba[i][j],
+					vol->vol_id, j, fm_eba[i][j],
 					scan_eba[i][j]);
 				ubi_assert(0);
 			}
-- 
1.8.4.5

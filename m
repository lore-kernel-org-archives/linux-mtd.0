Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAwSm-0007Nt-RX
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2015 08:36:49 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/3] UBI: Fastmap: Simplify expression
Date: Fri,  3 Jul 2015 10:36:14 +0200
Message-Id: <1435912576-27878-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no need to compute pnum again.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 24f2cf6..22db594 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -775,7 +775,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		for (j = 0; j < be32_to_cpu(fm_eba->reserved_pebs); j++) {
 			int pnum = be32_to_cpu(fm_eba->pnum[j]);
 
-			if ((int)be32_to_cpu(fm_eba->pnum[j]) < 0)
+			if (pnum < 0)
 				continue;
 
 			aeb = NULL;
-- 
1.8.4.5

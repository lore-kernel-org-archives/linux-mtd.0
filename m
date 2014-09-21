Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVphZ-0007aZ-CT
 for linux-mtd@lists.infradead.org; Sun, 21 Sep 2014 22:33:54 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: bcm47xxpart: only register partitions if the trx header
 was filled
Date: Mon, 22 Sep 2014 00:33:13 +0200
Message-Id: <1411338793-21245-1-git-send-email-hauke@hauke-m.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com,
 linux-mtd@lists.infradead.org, David.Woodhouse@intel.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sometimes the trx offsets are 0, in that case there is no partition and
we should not try to add one.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/bcm47xxpart.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 8057f52..c3f4454 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -168,18 +168,22 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 				i++;
 			}
 
-			bcm47xxpart_add_part(&parts[curr_part++], "linux",
-					     offset + trx->offset[i], 0);
-			i++;
+			if (trx->offset[i]) {
+				bcm47xxpart_add_part(&parts[curr_part++], "linux",
+						     offset + trx->offset[i], 0);
+				i++;
+			}
 
 			/*
 			 * Pure rootfs size is known and can be calculated as:
 			 * trx->length - trx->offset[i]. We don't fill it as
 			 * we want to have jffs2 (overlay) in the same mtd.
 			 */
-			bcm47xxpart_add_part(&parts[curr_part++], "rootfs",
-					     offset + trx->offset[i], 0);
-			i++;
+			if (trx->offset[i]) {
+				bcm47xxpart_add_part(&parts[curr_part++], "rootfs",
+						     offset + trx->offset[i], 0);
+				i++;
+			}
 
 			last_trx_part = curr_part - 1;
 
-- 
1.9.1

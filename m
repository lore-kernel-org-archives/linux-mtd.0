Received: from mailrelay110.isp.belgacom.be ([195.238.20.137])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2iv1-00020m-5F
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 16:32:00 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1 linux-next] mtd: cfi_cmdset_0002: use swap() in
 cfi_cmdset_0002()
Date: Wed, 10 Jun 2015 18:31:32 +0200
Message-Id: <1433953893-23547-1-git-send-email-fabf@skynet.be>
Cc: Fabian Frederick <fabf@skynet.be>, Julia Lawall <Julia.Lawall@lip6.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use kernel.h macro definition.

Thanks to Julia Lawall for Coccinelle scripting support.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index c3624eb..9dca881 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -615,11 +615,9 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 
 				for (i=0; i<cfi->cfiq->NumEraseRegions / 2; i++) {
 					int j = (cfi->cfiq->NumEraseRegions-1)-i;
-					__u32 swap;
 
-					swap = cfi->cfiq->EraseRegionInfo[i];
-					cfi->cfiq->EraseRegionInfo[i] = cfi->cfiq->EraseRegionInfo[j];
-					cfi->cfiq->EraseRegionInfo[j] = swap;
+					swap(cfi->cfiq->EraseRegionInfo[i],
+					     cfi->cfiq->EraseRegionInfo[j]);
 				}
 			}
 			/* Set the default CFI lock/unlock addresses */
-- 
2.4.2

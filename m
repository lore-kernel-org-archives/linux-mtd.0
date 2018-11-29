Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSDoE-0003L3-Vr
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2018 04:20:20 +0000
From: Huijin Park <huijin.park@samsung.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Huijin Park <huijin.park@samsung.com>,
 bbanghj.park@gmail.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3] mtd: change len type from signed to unsigned type
Date: Wed, 28 Nov 2018 23:19:51 -0500
Message-id: <1543465191-2100-1-git-send-email-huijin.park@samsung.com>
References: <CGME20181129042000eucas1p19a67f367e084ed5d5f37f72e57eb98d5@eucas1p1.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "huijin.park" <huijin.park@samsung.com>

Callers of erase_write() always pass an unsigned int.
So this patch avoids a cast to an int.

Signed-off-by: huijin.park <huijin.park@samsung.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

---

Changes since v1:
 * Made commit message more clear.
Changes since v2:
 * Made commit message more clear.
---
 drivers/mtd/mtdblock.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index a5b1933..b2d5ed1 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -56,7 +56,7 @@ struct mtdblk_dev {
  */
 
 static int erase_write (struct mtd_info *mtd, unsigned long pos,
-			int len, const char *buf)
+			unsigned int len, const char *buf)
 {
 	struct erase_info erase;
 	size_t retlen;
-- 
1.7.9.5

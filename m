Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN9sU-0006eG-Rb
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 05:07:44 +0000
From: Huijin Park <huijin.park@samsung.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Huijin Park <huijin.park@samsung.com>,
 bbanghj.park@gmail.com
Subject: [PATCH v2] mtd: change len type from signed to unsigned type
Date: Thu, 15 Nov 2018 00:07:10 -0500
Message-id: <1542258430-19885-1-git-send-email-huijin.park@samsung.com>
References: <CGME20181115050724eucas1p169b2046c03e108035199a4481a82a560@eucas1p1.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "huijin.park" <huijin.park@samsung.com>

This patch casts the "len" parameter to an unsigned int.
The callers of erase_write() pass the "len" parameter as unsigned int.

Signed-off-by: huijin.park <huijin.park@samsung.com>
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

Received: from mail-bn1on0623.outbound.protection.outlook.com
 ([2a01:111:f400:fc10::623] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9bcs-00029K-P7
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 15:37:27 +0000
From: <dinguyen@opensource.altera.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: denali: fix incorrect bitmask error in denali_setup_dma
Date: Fri, 9 Jan 2015 09:32:35 -0600
Message-ID: <1420817555-22828-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dinh.linux@gmail.com, josh@joshtriplett.org, linux-kernel@vger.kernel.org,
 yamada.m@jp.panasonic.com, linux-mtd@lists.infradead.org,
 Dinh Nguyen <dinguyen@opensource.altera.com>, computersforpeace@gmail.com,
 shijie8@gmail.com, Graham Moore <grmoore@opensource.altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Graham Moore <grmoore@opensource.altera.com>

commit "3157d1ed2309 mtd: denali: remove unnecessary casts" introduced
an error by using a wrong bitmask.

A uint16_t cast was replaced with & 0xff, should be & 0xffff.

Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 drivers/mtd/nand/denali.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index b3b7ca1..5e397fb 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1041,7 +1041,7 @@ static void denali_setup_dma(struct denali_nand_info *denali, int op)
 	index_addr(denali, mode | ((addr >> 16) << 8), 0x2200);
 
 	/* 3. set memory low address bits 23:8 */
-	index_addr(denali, mode | ((addr & 0xff) << 8), 0x2300);
+	index_addr(denali, mode | ((addr & 0xffff) << 8), 0x2300);
 
 	/* 4. interrupt when complete, burst len = 64 bytes */
 	index_addr(denali, mode | 0x14000, 0x2400);
-- 
1.7.9.5

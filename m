Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9fTQ-00016D-2f
 for linux-mtd@lists.infradead.org; Sun, 05 Jun 2016 21:20:45 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 2/6] MTD: xway: fix invalid operator
Date: Sun,  5 Jun 2016 23:20:05 +0200
Message-Id: <1465161609-19303-3-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
References: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: John Crispin <john@phrozen.org>

xway_read_byte should use a logic or and not an add operator when
working out the NAND address. The NAND address bits are used to
activate the pins to the NAND flash.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index ccac19c..0ab6e83 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -134,7 +134,7 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
 	int ret;
 
 	spin_lock_irqsave(&ebu_lock, flags);
-	ret = ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));
+	ret = ltq_r8((void __iomem *)(nandaddr | NAND_READ_DATA));
 	spin_unlock_irqrestore(&ebu_lock, flags);
 
 	return ret;
-- 
2.8.1

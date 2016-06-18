Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bELhz-0004ag-4h
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 19:15:08 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v2 8/8] MTD: xway: use global NAND_CMD_RESET define
Date: Sat, 18 Jun 2016 21:14:12 +0200
Message-Id: <1466277252-13867-9-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
References: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index b3badf9..7244bb8 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -34,7 +34,6 @@
 #define NAND_CMD_SE		(1 << 5)
 #define NAND_CMD_WP		(1 << 6)
 #define NAND_CMD_PRE		(1 << 7)
-#define NAND_WRITE_CMD_RESET	0xff
 #define NAND_WRITE_CMD		(NAND_CMD_CS | NAND_CMD_CLE)
 #define NAND_WRITE_ADDR		(NAND_CMD_CS | NAND_CMD_ALE)
 #define NAND_WRITE_DATA		(NAND_CMD_CS)
@@ -99,7 +98,7 @@ static void xway_reset_chip(struct nand_chip *chip)
 	timeout = jiffies + msecs_to_jiffies(20);
 
 	spin_lock_irqsave(&ebu_lock, flags);
-	writeb(NAND_WRITE_CMD_RESET, (void __iomem *) nandaddr);
+	writeb(NAND_CMD_RESET, (void __iomem *) nandaddr);
 	do {
 		if ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
 			break;
-- 
2.8.1

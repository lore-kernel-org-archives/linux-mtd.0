Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEfHB-0001g7-Dd
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 16:08:47 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v3 3/8] MTD: xway: the latched command should be persistent
Date: Sun, 19 Jun 2016 18:08:12 +0200
Message-Id: <1466352497-6806-4-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1466352497-6806-1-git-send-email-hauke@hauke-m.de>
References: <1466352497-6806-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: John Crispin <john@phrozen.org>

With each write the pins on the NAND flash chip have to be activated.
Instead of setting them only when NAND_CTRL_CHANGE is given, always set
them.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index ec189e5..6028edb 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -107,22 +107,18 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
 	unsigned long flags;
 
-	if (ctrl & NAND_CTRL_CHANGE) {
-		nandaddr &= ~(NAND_WRITE_CMD | NAND_WRITE_ADDR);
-		if (ctrl & NAND_CLE)
-			nandaddr |= NAND_WRITE_CMD;
-		else
-			nandaddr |= NAND_WRITE_ADDR;
-		this->IO_ADDR_W = (void __iomem *) nandaddr;
-	}
+	if (cmd == NAND_CMD_NONE)
+		return;
 
-	if (cmd != NAND_CMD_NONE) {
-		spin_lock_irqsave(&ebu_lock, flags);
-		writeb(cmd, this->IO_ADDR_W);
-		while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
-			;
-		spin_unlock_irqrestore(&ebu_lock, flags);
-	}
+	spin_lock_irqsave(&ebu_lock, flags);
+	if (ctrl & NAND_CLE)
+		writeb(cmd, (void __iomem *) (nandaddr | NAND_WRITE_CMD));
+	else if (ctrl & NAND_ALE)
+		writeb(cmd, (void __iomem *) (nandaddr | NAND_WRITE_ADDR));
+
+	while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
+		;
+	spin_unlock_irqrestore(&ebu_lock, flags);
 }
 
 static int xway_dev_ready(struct mtd_info *mtd)
-- 
2.8.1

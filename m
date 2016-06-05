Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9fTQ-00016F-2g
 for linux-mtd@lists.infradead.org; Sun, 05 Jun 2016 21:20:45 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 4/6] MTD: xway: remove endless loop
Date: Sun,  5 Jun 2016 23:20:07 +0200
Message-Id: <1465161609-19303-5-git-send-email-hauke@hauke-m.de>
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

The reset loop logic could run into a endless loop. Lets fix it as
requested.
http://lists.infradead.org/pipermail/linux-mtd/2012-September/044240.html

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 79fecc8..d44e00d 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -69,16 +69,22 @@ static u32 xway_latchcmd;
 static void xway_reset_chip(struct nand_chip *chip)
 {
 	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
+	unsigned long timeout;
 	unsigned long flags;
 
 	nandaddr &= ~NAND_WRITE_ADDR;
 	nandaddr |= NAND_WRITE_CMD;
 
 	/* finish with a reset */
+	timeout = jiffies + msecs_to_jiffies(20);
+
 	spin_lock_irqsave(&ebu_lock, flags);
 	writeb(NAND_WRITE_CMD_RESET, (void __iomem *) nandaddr);
-	while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
-		;
+	do {
+		if ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
+			break;
+		cond_resched();
+	} while (!time_after_eq(jiffies, timeout));
 	spin_unlock_irqrestore(&ebu_lock, flags);
 }
 
-- 
2.8.1

Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGCJr-0004us-Ab
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 21:05:36 +0000
From: John Crispin <blogic@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 3/6] MTD: lantiq: xway: remove endless loop
Date: Mon,  4 Jan 2016 22:04:58 +0100
Message-Id: <1451941501-42952-4-git-send-email-blogic@openwrt.org>
In-Reply-To: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
References: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The reset loop logic could run into a endless loop. Lets fix it as
requested.

http://lists.infradead.org/pipermail/linux-mtd/2012-September/044240.html

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/mtd/nand/xway_nand.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 548a2b8..c75a2bc 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -59,16 +59,22 @@ static u32 xway_latchcmd;
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
1.7.10.4

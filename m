Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGCJr-0004uV-Gd
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 21:05:37 +0000
From: John Crispin <blogic@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 2/6] MTD: lantiq: xway: the latched command should be
 persistent
Date: Mon,  4 Jan 2016 22:04:57 +0100
Message-Id: <1451941501-42952-3-git-send-email-blogic@openwrt.org>
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

Without this the addresses used will be bad.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/mtd/nand/xway_nand.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 81ec685..548a2b8 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -54,6 +54,8 @@
 #define NAND_CON_CSMUX		(1 << 1)
 #define NAND_CON_NANDM		1
 
+static u32 xway_latchcmd;
+
 static void xway_reset_chip(struct nand_chip *chip)
 {
 	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
@@ -94,17 +96,15 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	unsigned long flags;
 
 	if (ctrl & NAND_CTRL_CHANGE) {
-		nandaddr &= ~(NAND_WRITE_CMD | NAND_WRITE_ADDR);
 		if (ctrl & NAND_CLE)
-			nandaddr |= NAND_WRITE_CMD;
-		else
-			nandaddr |= NAND_WRITE_ADDR;
-		this->IO_ADDR_W = (void __iomem *) nandaddr;
+			xway_latchcmd = NAND_WRITE_CMD;
+		else if (ctrl & NAND_ALE)
+			xway_latchcmd = NAND_WRITE_ADDR;
 	}
 
 	if (cmd != NAND_CMD_NONE) {
 		spin_lock_irqsave(&ebu_lock, flags);
-		writeb(cmd, this->IO_ADDR_W);
+		writeb(cmd, (void __iomem *) (nandaddr | xway_latchcmd));
 		while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
 			;
 		spin_unlock_irqrestore(&ebu_lock, flags);
-- 
1.7.10.4

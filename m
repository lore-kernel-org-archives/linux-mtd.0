Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bELhc-0004Yq-Uk
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 19:14:46 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v2 3/8] MTD: xway: the latched command should be persistent
Date: Sat, 18 Jun 2016 21:14:07 +0200
Message-Id: <1466277252-13867-4-git-send-email-hauke@hauke-m.de>
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

From: John Crispin <john@phrozen.org>

If they are not persistent a different address will be used and the
controller will deactivate some pins.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 2889e48..346781a 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -67,6 +67,7 @@
 
 struct xway_nand_data {
 	struct nand_chip	chip;
+	u32			xway_latchcmd;
 };
 
 static void xway_reset_chip(struct nand_chip *chip)
@@ -104,22 +105,21 @@ static void xway_select_chip(struct mtd_info *mtd, int chip)
 
 static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
-	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct xway_nand_data *data = nand_get_controller_data(chip);
+	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
 	unsigned long flags;
 
 	if (ctrl & NAND_CTRL_CHANGE) {
-		nandaddr &= ~(NAND_WRITE_CMD | NAND_WRITE_ADDR);
 		if (ctrl & NAND_CLE)
-			nandaddr |= NAND_WRITE_CMD;
-		else
-			nandaddr |= NAND_WRITE_ADDR;
-		this->IO_ADDR_W = (void __iomem *) nandaddr;
+			data->xway_latchcmd = NAND_WRITE_CMD;
+		else if (ctrl & NAND_ALE)
+			data->xway_latchcmd = NAND_WRITE_ADDR;
 	}
 
 	if (cmd != NAND_CMD_NONE) {
 		spin_lock_irqsave(&ebu_lock, flags);
-		writeb(cmd, this->IO_ADDR_W);
+		writeb(cmd, (void __iomem *) (nandaddr | data->xway_latchcmd));
 		while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
 			;
 		spin_unlock_irqrestore(&ebu_lock, flags);
-- 
2.8.1

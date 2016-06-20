Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF6oY-0000UA-9w
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 21:33:03 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v5 5/8] mtd: nand: xway: fix nand locking
Date: Mon, 20 Jun 2016 23:32:11 +0200
Message-Id: <1466458334-10830-6-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1466458334-10830-1-git-send-email-hauke@hauke-m.de>
References: <1466458334-10830-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: John Crispin <john@phrozen.org>

The external Bus Unit (EBU) can control different flash devices, but
these NAND flash commands have to be atomic and should not be
interrupted in between. Lock the EBU from the beginning of the command
till the end by moving the lock to the chip select.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index ab93b353..08f796e 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -65,17 +65,22 @@
 
 struct xway_nand_data {
 	struct nand_chip	chip;
+	unsigned long		csflags;
 };
 
-static void xway_select_chip(struct mtd_info *mtd, int chip)
+static void xway_select_chip(struct mtd_info *mtd, int select)
 {
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct xway_nand_data *data = nand_get_controller_data(chip);
 
-	switch (chip) {
+	switch (select) {
 	case -1:
 		ltq_ebu_w32_mask(NAND_CON_CE, 0, EBU_NAND_CON);
 		ltq_ebu_w32_mask(NAND_CON_NANDM, 0, EBU_NAND_CON);
+		spin_unlock_irqrestore(&ebu_lock, data->csflags);
 		break;
 	case 0:
+		spin_lock_irqsave(&ebu_lock, data->csflags);
 		ltq_ebu_w32_mask(0, NAND_CON_NANDM, EBU_NAND_CON);
 		ltq_ebu_w32_mask(0, NAND_CON_CE, EBU_NAND_CON);
 		break;
@@ -88,12 +93,10 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
 	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
-	unsigned long flags;
 
 	if (cmd == NAND_CMD_NONE)
 		return;
 
-	spin_lock_irqsave(&ebu_lock, flags);
 	if (ctrl & NAND_CLE)
 		writeb(cmd, (void __iomem *) (nandaddr | NAND_WRITE_CMD));
 	else if (ctrl & NAND_ALE)
@@ -101,7 +104,6 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 
 	while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
 		;
-	spin_unlock_irqrestore(&ebu_lock, flags);
 }
 
 static int xway_dev_ready(struct mtd_info *mtd)
@@ -113,14 +115,8 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
 	unsigned long nandaddr = (unsigned long) this->IO_ADDR_R;
-	unsigned long flags;
-	int ret;
 
-	spin_lock_irqsave(&ebu_lock, flags);
-	ret = ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));
-	spin_unlock_irqrestore(&ebu_lock, flags);
-
-	return ret;
+	return ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));
 }
 
 /*
-- 
2.8.1

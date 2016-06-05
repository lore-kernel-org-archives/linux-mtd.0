Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9fTm-00017d-FG
 for linux-mtd@lists.infradead.org; Sun, 05 Jun 2016 21:21:07 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 6/6] MTD: xway: fix nand locking
Date: Sun,  5 Jun 2016 23:20:09 +0200
Message-Id: <1465161609-19303-7-git-send-email-hauke@hauke-m.de>
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

The external Bus Unit (EBU) can control different flash devices, but
these NAND flash commands have to be atomic and should not be
interrupted in between. Lock the EBU from the beginning of the command
till the end by moving the lock to the chip select.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index bc4018e..a6ea80c 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -90,13 +90,16 @@ static void xway_reset_chip(struct nand_chip *chip)
 
 static void xway_select_chip(struct mtd_info *mtd, int chip)
 {
+	static unsigned long csflags;
 
 	switch (chip) {
 	case -1:
 		ltq_ebu_w32_mask(NAND_CON_CE, 0, EBU_NAND_CON);
 		ltq_ebu_w32_mask(NAND_CON_NANDM, 0, EBU_NAND_CON);
+		spin_unlock_irqrestore(&ebu_lock, csflags);
 		break;
 	case 0:
+		spin_lock_irqsave(&ebu_lock, csflags);
 		ltq_ebu_w32_mask(0, NAND_CON_NANDM, EBU_NAND_CON);
 		ltq_ebu_w32_mask(0, NAND_CON_CE, EBU_NAND_CON);
 		break;
@@ -109,7 +112,6 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
 	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
-	unsigned long flags;
 
 	if (ctrl & NAND_CTRL_CHANGE) {
 		if (ctrl & NAND_CLE)
@@ -119,11 +121,9 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	}
 
 	if (cmd != NAND_CMD_NONE) {
-		spin_lock_irqsave(&ebu_lock, flags);
 		writeb(cmd, (void __iomem *) (nandaddr | xway_latchcmd));
 		while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
 			;
-		spin_unlock_irqrestore(&ebu_lock, flags);
 	}
 }
 
@@ -136,12 +136,9 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd_to_nand(mtd);
 	unsigned long nandaddr = (unsigned long) this->IO_ADDR_R;
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&ebu_lock, flags);
 	ret = ltq_r8((void __iomem *)(nandaddr | NAND_READ_DATA));
-	spin_unlock_irqrestore(&ebu_lock, flags);
 
 	return ret;
 }
@@ -150,26 +147,20 @@ static void xway_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
 	unsigned long nandaddr = (unsigned long) this->IO_ADDR_R;
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&ebu_lock, flags);
 	for (i = 0; i < len; i++)
 		buf[i] = ltq_r8((void __iomem *)(nandaddr | NAND_READ_DATA));
-	spin_unlock_irqrestore(&ebu_lock, flags);
 }
 
 static void xway_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
 	struct nand_chip *this = mtd->priv;
 	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
-	unsigned long flags;
 	int i;
 
-	spin_lock_irqsave(&ebu_lock, flags);
 	for (i = 0; i < len; i++)
 		ltq_w8(buf[i], (void __iomem *)(nandaddr | NAND_WRITE_DATA));
-	spin_unlock_irqrestore(&ebu_lock, flags);
 }
 
 static int xway_nand_probe(struct platform_device *pdev)
-- 
2.8.1

Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGCKA-0004zC-1o
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 21:05:57 +0000
From: John Crispin <blogic@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] MTD: lantiq: xway: fix nand locking
Date: Mon,  4 Jan 2016 22:05:00 +0100
Message-Id: <1451941501-42952-6-git-send-email-blogic@openwrt.org>
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

use a global lock in the cs function.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/mtd/nand/xway_nand.c |   15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index ef7c7ce..4127049 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -80,13 +80,16 @@ static void xway_reset_chip(struct nand_chip *chip)
 
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
@@ -99,7 +102,6 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
 	struct nand_chip *this = mtd->priv;
 	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
-	unsigned long flags;
 
 	if (ctrl & NAND_CTRL_CHANGE) {
 		if (ctrl & NAND_CLE)
@@ -109,11 +111,9 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	}
 
 	if (cmd != NAND_CMD_NONE) {
-		spin_lock_irqsave(&ebu_lock, flags);
 		writeb(cmd, (void __iomem *) (nandaddr | xway_latchcmd));
 		while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
 			;
-		spin_unlock_irqrestore(&ebu_lock, flags);
 	}
 }
 
@@ -126,12 +126,9 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
 	unsigned long nandaddr = (unsigned long) this->IO_ADDR_R;
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&ebu_lock, flags);
 	ret = ltq_r8((void __iomem *)(nandaddr | NAND_READ_DATA));
-	spin_unlock_irqrestore(&ebu_lock, flags);
 
 	return ret;
 }
@@ -140,26 +137,20 @@ static void xway_read_buf(struct mtd_info *mtd, u_char *buf, int len)
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
1.7.10.4

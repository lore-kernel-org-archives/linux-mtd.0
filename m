Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF6oY-0000UB-9u
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 21:33:03 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v5 6/8] mtd: nand: xway: extract read and write function
Date: Mon, 20 Jun 2016 23:32:12 +0200
Message-Id: <1466458334-10830-7-git-send-email-hauke@hauke-m.de>
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

Extract the functions to read and write to the register of the NAND
flash controller.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 08f796e..4cdef24 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -68,6 +68,22 @@ struct xway_nand_data {
 	unsigned long		csflags;
 };
 
+static u8 xway_readb(struct mtd_info *mtd, int op)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	void __iomem *nandaddr = chip->IO_ADDR_R;
+
+	return readb(nandaddr + op);
+}
+
+static void xway_writeb(struct mtd_info *mtd, int op, u8 value)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	void __iomem *nandaddr = chip->IO_ADDR_W;
+
+	writeb(value, nandaddr + op);
+}
+
 static void xway_select_chip(struct mtd_info *mtd, int select)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
@@ -91,16 +107,13 @@ static void xway_select_chip(struct mtd_info *mtd, int select)
 
 static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
-	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
-
 	if (cmd == NAND_CMD_NONE)
 		return;
 
 	if (ctrl & NAND_CLE)
-		writeb(cmd, (void __iomem *) (nandaddr | NAND_WRITE_CMD));
+		xway_writeb(mtd, NAND_WRITE_CMD, cmd);
 	else if (ctrl & NAND_ALE)
-		writeb(cmd, (void __iomem *) (nandaddr | NAND_WRITE_ADDR));
+		xway_writeb(mtd, NAND_WRITE_ADDR, cmd);
 
 	while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
 		;
@@ -113,10 +126,7 @@ static int xway_dev_ready(struct mtd_info *mtd)
 
 static unsigned char xway_read_byte(struct mtd_info *mtd)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
-	unsigned long nandaddr = (unsigned long) this->IO_ADDR_R;
-
-	return ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));
+	return xway_readb(mtd, NAND_READ_DATA);
 }
 
 /*
-- 
2.8.1

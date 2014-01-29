Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8dTM-0003BW-C3
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 22:19:05 +0000
Received: by mail-ie0-f182.google.com with SMTP id lx4so2726945iec.27
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2014 14:18:43 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: nand: force NAND_CMD_READID onto 8-bit bus
Date: Wed, 29 Jan 2014 14:18:28 -0800
Message-Id: <1391033909-6563-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 u.kleine-koenig@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND command helpers tend to automatically shift the column address
for x16 bus devices, since most commands expect a word address, not a
byte address. The Read ID command, however, expects an 8-bit address
(i.e., 0x00, 0x20, or 0x40 should not be translated to 0x00, 0x10, or
0x20).

This fixes the column address for a few drivers which imitate the
nand_base defaults. Note that I don't touch sh_flctl.c, since it already
handles this problem slightly differently (note its comment "READID is
always performed using an 8-bit bus").

I have not tested this patch, as I only have x8 parts up for testing at
this point. Hopefully that can change soon...

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/atmel_nand.c  | 11 ++++++-----
 drivers/mtd/nand/au1550nd.c    |  3 ++-
 drivers/mtd/nand/diskonchip.c  |  3 ++-
 drivers/mtd/nand/nand_base.c   |  6 ++++--
 drivers/mtd/nand/nuc900_nand.c |  3 ++-
 include/linux/mtd/nand.h       | 10 ++++++++++
 6 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index c36e9b84487c..1955389c8fa6 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1659,8 +1659,8 @@ static void nfc_select_chip(struct mtd_info *mtd, int chip)
 		nfc_writel(host->nfc->hsmc_regs, CTRL, NFC_CTRL_ENABLE);
 }
 
-static int nfc_make_addr(struct mtd_info *mtd, int column, int page_addr,
-		unsigned int *addr1234, unsigned int *cycle0)
+static int nfc_make_addr(struct mtd_info *mtd, int command, int column,
+		int page_addr, unsigned int *addr1234, unsigned int *cycle0)
 {
 	struct nand_chip *chip = mtd->priv;
 
@@ -1674,7 +1674,8 @@ static int nfc_make_addr(struct mtd_info *mtd, int column, int page_addr,
 	*addr1234 = 0;
 
 	if (column != -1) {
-		if (chip->options & NAND_BUSWIDTH_16)
+		if (chip->options & NAND_BUSWIDTH_16 &&
+				!nand_opcode_8bits(command))
 			column >>= 1;
 		addr_bytes[acycle++] = column & 0xff;
 		if (mtd->writesize > 512)
@@ -1787,8 +1788,8 @@ static void nfc_nand_command(struct mtd_info *mtd, unsigned int command,
 	}
 
 	if (do_addr)
-		acycle = nfc_make_addr(mtd, column, page_addr, &addr1234,
-				&cycle0);
+		acycle = nfc_make_addr(mtd, command, column, page_addr,
+				&addr1234, &cycle0);
 
 	nfc_addr_cmd = cmd1 | cmd2 | vcmd2 | acycle | csid | dataen | nfcwr;
 	nfc_send_command(host, nfc_addr_cmd, addr1234, cycle0);
diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index 7d84c4e4bf43..bc5c518828d2 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -307,7 +307,8 @@ static void au1550_command(struct mtd_info *mtd, unsigned command, int column, i
 		/* Serially input address */
 		if (column != -1) {
 			/* Adjust columns for 16 bit buswidth */
-			if (this->options & NAND_BUSWIDTH_16)
+			if (this->options & NAND_BUSWIDTH_16 &&
+					!nand_opcode_8bits(command))
 				column >>= 1;
 			ctx->write_byte(mtd, column);
 		}
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index fec31d71b84e..b9b4db607850 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -698,7 +698,8 @@ static void doc2001plus_command(struct mtd_info *mtd, unsigned command, int colu
 		/* Serially input address */
 		if (column != -1) {
 			/* Adjust columns for 16 bit buswidth */
-			if (this->options & NAND_BUSWIDTH_16)
+			if (this->options & NAND_BUSWIDTH_16 &&
+					!nand_opcode_8bits(command))
 				column >>= 1;
 			WriteDOC(column, docptr, Mplus_FlashAddress);
 		}
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9111a4c7c7a2..c69a1f7ce0a2 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -589,7 +589,8 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 	/* Serially input address */
 	if (column != -1) {
 		/* Adjust columns for 16 bit buswidth */
-		if (chip->options & NAND_BUSWIDTH_16)
+		if (chip->options & NAND_BUSWIDTH_16 &&
+				!nand_opcode_8bits(command))
 			column >>= 1;
 		chip->cmd_ctrl(mtd, column, ctrl);
 		ctrl &= ~NAND_CTRL_CHANGE;
@@ -680,7 +681,8 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 		/* Serially input address */
 		if (column != -1) {
 			/* Adjust columns for 16 bit buswidth */
-			if (chip->options & NAND_BUSWIDTH_16)
+			if (chip->options & NAND_BUSWIDTH_16 &&
+					!nand_opcode_8bits(command))
 				column >>= 1;
 			chip->cmd_ctrl(mtd, column, ctrl);
 			ctrl &= ~NAND_CTRL_CHANGE;
diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index 90c99ea5184a..331fccbdde61 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -151,7 +151,8 @@ static void nuc900_nand_command_lp(struct mtd_info *mtd, unsigned int command,
 	if (column != -1 || page_addr != -1) {
 
 		if (column != -1) {
-			if (chip->options & NAND_BUSWIDTH_16)
+			if (chip->options & NAND_BUSWIDTH_16 &&
+					!nand_opcode_8bits(command))
 				column >>= 1;
 			write_addr_reg(nand, column);
 			write_addr_reg(nand, column >> 8 | ENDADDR);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index a719686c9cce..c034dc4224cb 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -832,4 +832,14 @@ static inline bool nand_is_slc(struct nand_chip *chip)
 {
 	return chip->bits_per_cell == 1;
 }
+
+/**
+ * Check if the opcode's address should be sent only on the lower 8 bits
+ * @command: opcode to check
+ */
+static inline int nand_opcode_8bits(unsigned int command)
+{
+	return command == NAND_CMD_READID;
+}
+
 #endif /* __LINUX_MTD_NAND_H */
-- 
1.8.3.2

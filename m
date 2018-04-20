Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RMx-0007dk-1X
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:14 +0000
Received: by mail-wr0-x243.google.com with SMTP id v24-v6so20633159wra.8
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:26:09 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Subject: [PATCH 09/18] mtd: rawnand: make nand_command() and nand_command_lp()
 more similar
Date: Fri, 20 Apr 2018 10:19:37 +0200
Message-Id: <20180420081946.16088-10-sam.lefebvre@essensium.com>
In-Reply-To: <20180420081946.16088-1-sam.lefebvre@essensium.com>
References: <20180420081946.16088-1-sam.lefebvre@essensium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The nand_command() and nand_command_lp() functions are very similar,
but there are slight typographic differences. As a preparation for
unifying the two later, make them more similar now.

This includes the following changes.

In nand_command():
- use explicit NAND_NCE | NAND_{A,C}LE instead of NAND_CTRL_{A,C}LE
  (the explicit form seems to be used more often tree-wide).
- proper line-wrapping.

In nand_command_lp():
- use the ctrl local variable wherever appropriate.
- remove the additional 'if (column != -1 || page_addr != -1)' around
  the two individual conditions.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Note that I don't have access to a small-page device, so only tested on
large-page devices. Also only tested on i.MX6Q (gpmi-nand).

Note that this patch can be removed from the series without affecting
the rest.
---
 drivers/mtd/nand/raw/nand_base.c | 59 +++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 72f3a89da513..bcc0344b1f27 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -761,7 +761,7 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 			 int column, int page_addr)
 {
 	register struct nand_chip *chip = mtd_to_nand(mtd);
-	int ctrl = NAND_CTRL_CLE | NAND_CTRL_CHANGE;
+	int ctrl = NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE;
 
 	/* Write out the command to the device */
 	if (command == NAND_CMD_SEQIN) {
@@ -785,7 +785,7 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 		chip->cmd_ctrl(mtd, command, ctrl);
 
 	/* Address cycle, when necessary */
-	ctrl = NAND_CTRL_ALE | NAND_CTRL_CHANGE;
+	ctrl = NAND_NCE | NAND_ALE | NAND_CTRL_CHANGE;
 	/* Serially input address */
 	if (column != -1) {
 		/* Adjust columns for 16 bit buswidth */
@@ -825,9 +825,9 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 			break;
 		udelay(chip->chip_delay);
 		chip->cmd_ctrl(mtd, NAND_CMD_STATUS,
-			       NAND_CTRL_CLE | NAND_CTRL_CHANGE);
-		chip->cmd_ctrl(mtd,
-			       NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
+			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
+			       NAND_NCE | NAND_CTRL_CHANGE);
 		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
 		nand_wait_status_ready(mtd, 250);
 		return;
@@ -896,6 +896,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 			    int column, int page_addr)
 {
 	register struct nand_chip *chip = mtd_to_nand(mtd);
+	int ctrl = NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE;
 
 	/* Emulate NAND_CMD_READOOB */
 	if (command == NAND_CMD_READOOB) {
@@ -905,33 +906,29 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 
 	/* Command latch cycle */
 	if (command != NAND_CMD_NONE)
-		chip->cmd_ctrl(mtd, command,
-			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+		chip->cmd_ctrl(mtd, command, ctrl);
 
-	if (column != -1 || page_addr != -1) {
-		int ctrl = NAND_CTRL_CHANGE | NAND_NCE | NAND_ALE;
-
-		/* Serially input address */
-		if (column != -1) {
-			/* Adjust columns for 16 bit buswidth */
-			if (chip->options & NAND_BUSWIDTH_16 &&
-					!nand_opcode_8bits(command))
-				column >>= 1;
-			chip->cmd_ctrl(mtd, column, ctrl);
-			ctrl &= ~NAND_CTRL_CHANGE;
-
-			/* Only output a single addr cycle for 8bits opcodes. */
-			if (!nand_opcode_8bits(command))
-				chip->cmd_ctrl(mtd, column >> 8, ctrl);
-		}
-		if (page_addr != -1) {
-			chip->cmd_ctrl(mtd, page_addr, ctrl);
-			chip->cmd_ctrl(mtd, page_addr >> 8,
-				       NAND_NCE | NAND_ALE);
-			if (chip->options & NAND_ROW_ADDR_3)
-				chip->cmd_ctrl(mtd, page_addr >> 16,
-					       NAND_NCE | NAND_ALE);
-		}
+	/* Address cycle, when necessary */
+	ctrl = NAND_NCE | NAND_ALE | NAND_CTRL_CHANGE;
+	/* Serially input address */
+	if (column != -1) {
+		/* Adjust columns for 16 bit buswidth */
+		if (chip->options & NAND_BUSWIDTH_16 &&
+				!nand_opcode_8bits(command))
+			column >>= 1;
+		chip->cmd_ctrl(mtd, column, ctrl);
+		ctrl &= ~NAND_CTRL_CHANGE;
+
+		/* Only output a single addr cycle for 8bits opcodes. */
+		if (!nand_opcode_8bits(command))
+			chip->cmd_ctrl(mtd, column >> 8, ctrl);
+	}
+	if (page_addr != -1) {
+		chip->cmd_ctrl(mtd, page_addr, ctrl);
+		ctrl &= ~NAND_CTRL_CHANGE;
+		chip->cmd_ctrl(mtd, page_addr >> 8, ctrl);
+		if (chip->options & NAND_ROW_ADDR_3)
+			chip->cmd_ctrl(mtd, page_addr >> 16, ctrl);
 	}
 	chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
 
-- 
2.14.1

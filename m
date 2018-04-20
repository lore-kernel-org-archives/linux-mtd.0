Received: from mail-wr0-f193.google.com ([209.85.128.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RNG-0007ow-Ne
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:41 +0000
Received: by mail-wr0-f193.google.com with SMTP id d1-v6so20640816wrj.13
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:26:20 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Subject: [PATCH 15/18] mtd: rawnand: gpmi: cmd_ctrl is no longer needed
Date: Fri, 20 Apr 2018 10:19:43 +0200
Message-Id: <20180420081946.16088-16-sam.lefebvre@essensium.com>
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

Since gpmi-nand now implements cmdfunc, it is no longer needed to
implement cmd_ctrl. Call gpmi_cmd_ctrl directly.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 33 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 5ae5713090a4..5700ca1d2ae6 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1132,13 +1132,13 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 			column -= 256;
 			readcmd = NAND_CMD_READ1;
 		}
-		chip->cmd_ctrl(mtd, readcmd, ctrl);
+		gpmi_cmd_ctrl(mtd, readcmd, ctrl);
 		ctrl &= ~NAND_CTRL_CHANGE;
 	}
 
 	/* Command latch cycle */
 	if (command != NAND_CMD_NONE)
-		chip->cmd_ctrl(mtd, command, ctrl);
+		gpmi_cmd_ctrl(mtd, command, ctrl);
 
 	/* Address cycle, when necessary */
 	ctrl = NAND_NCE | NAND_ALE | NAND_CTRL_CHANGE;
@@ -1148,23 +1148,23 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 		if (chip->options & NAND_BUSWIDTH_16 &&
 				!nand_opcode_8bits(command))
 			column >>= 1;
-		chip->cmd_ctrl(mtd, column, ctrl);
+		gpmi_cmd_ctrl(mtd, column, ctrl);
 		ctrl &= ~NAND_CTRL_CHANGE;
 
 		/* Only output a single addr cycle for 8bits opcodes. */
 		if (is_lp && !nand_opcode_8bits(command))
-			chip->cmd_ctrl(mtd, column >> 8, ctrl);
+			gpmi_cmd_ctrl(mtd, column >> 8, ctrl);
 	}
 	if (page_addr != -1) {
-		chip->cmd_ctrl(mtd, page_addr, ctrl);
+		gpmi_cmd_ctrl(mtd, page_addr, ctrl);
 		ctrl &= ~NAND_CTRL_CHANGE;
-		chip->cmd_ctrl(mtd, page_addr >> 8, ctrl);
+		gpmi_cmd_ctrl(mtd, page_addr >> 8, ctrl);
 		if (chip->options & NAND_ROW_ADDR_3)
-			chip->cmd_ctrl(mtd, page_addr >> 16, ctrl);
+			gpmi_cmd_ctrl(mtd, page_addr >> 16, ctrl);
 	}
 
 	/* This starts the DMA for the command and waits for it to finish. */
-	chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
+	gpmi_cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
 
 	if (!is_lp)
 		return;
@@ -1172,10 +1172,10 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 	switch (command) {
 	case NAND_CMD_RNDOUT:
 		/* No ready / busy check necessary */
-		chip->cmd_ctrl(mtd, NAND_CMD_RNDOUTSTART,
-			NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-			NAND_NCE | NAND_CTRL_CHANGE);
+		gpmi_cmd_ctrl(mtd, NAND_CMD_RNDOUTSTART,
+			      NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+		gpmi_cmd_ctrl(mtd, NAND_CMD_NONE,
+			      NAND_NCE | NAND_CTRL_CHANGE);
 		break;
 
 	case NAND_CMD_READ0:
@@ -1188,10 +1188,10 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 		if (column == -1 && page_addr == -1)
 			return;
 
-		chip->cmd_ctrl(mtd, NAND_CMD_READSTART,
-				NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-				NAND_NCE | NAND_CTRL_CHANGE);
+		gpmi_cmd_ctrl(mtd, NAND_CMD_READSTART,
+			      NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+		gpmi_cmd_ctrl(mtd, NAND_CMD_NONE,
+			      NAND_NCE | NAND_CTRL_CHANGE);
 		break;
 	}
 }
@@ -2000,7 +2000,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	nand_set_flash_node(chip, this->pdev->dev.of_node);
 	chip->select_chip	= gpmi_select_chip;
 	chip->setup_data_interface = gpmi_setup_data_interface;
-	chip->cmd_ctrl		= gpmi_cmd_ctrl;
 	chip->cmdfunc		= gpmi_nand_command;
 	chip->dev_ready		= gpmi_dev_ready;
 	chip->read_byte		= gpmi_read_byte;
-- 
2.14.1

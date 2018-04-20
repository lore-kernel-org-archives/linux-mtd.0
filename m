Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RNI-0007pg-4K
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:46 +0000
Received: by mail-wr0-x241.google.com with SMTP id h3-v6so20667133wrh.5
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:26:21 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Subject: [PATCH 16/18] mtd: rawnand: gpmi: inline gpmi_cmd_ctrl()
Date: Fri, 20 Apr 2018 10:19:44 +0200
Message-Id: <20180420081946.16088-17-sam.lefebvre@essensium.com>
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

gpmi_cmd_ctrl() has two "states":

* ALE or CLE is set, in this case the command/control data is buffered.
  These calls are replaced with
	this->cmd_buffer[this->command_length++] = data;

* ALE and CLE are not set, in this case the command is sent (DMA is
  started). These calls are replaced with
	ret = gpmi_send_command(this);
	if (ret)
		dev_err(this->dev, "Chip: %u, Error %d\n",
			this->current_chip, ret);
	this->command_length = 0;

The 'ctrl' variable/parameter is not used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 85 ++++++++++--------------------
 1 file changed, 29 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 5700ca1d2ae6..97d44fe212c9 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -786,40 +786,6 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
 	return -ENOMEM;
 }
 
-static void gpmi_cmd_ctrl(struct mtd_info *mtd, int data, unsigned int ctrl)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct gpmi_nand_data *this = nand_get_controller_data(chip);
-	int ret;
-
-	/*
-	 * Every operation begins with a command byte and a series of zero or
-	 * more address bytes. These are distinguished by either the Address
-	 * Latch Enable (ALE) or Command Latch Enable (CLE) signals being
-	 * asserted. When MTD is ready to execute the command, it will deassert
-	 * both latch enables.
-	 *
-	 * Rather than run a separate DMA operation for every single byte, we
-	 * queue them up and run a single DMA operation for the entire series
-	 * of command and data bytes. NAND_CMD_NONE means the END of the queue.
-	 */
-	if ((ctrl & (NAND_ALE | NAND_CLE))) {
-		if (data != NAND_CMD_NONE)
-			this->cmd_buffer[this->command_length++] = data;
-		return;
-	}
-
-	if (!this->command_length)
-		return;
-
-	ret = gpmi_send_command(this);
-	if (ret)
-		dev_err(this->dev, "Chip: %u, Error %d\n",
-			this->current_chip, ret);
-
-	this->command_length = 0;
-}
-
 static int gpmi_dev_ready(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
@@ -1104,7 +1070,8 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 			      int column, int page_addr)
 {
 	register struct nand_chip *chip = mtd_to_nand(mtd);
-	int ctrl = NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE;
+	struct gpmi_nand_data *this = nand_get_controller_data(chip);
+	int ret;
 	/* Large page devices (> 512 bytes) behave slightly differently. */
 	bool is_lp = mtd->writesize > 512;
 
@@ -1132,39 +1099,41 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 			column -= 256;
 			readcmd = NAND_CMD_READ1;
 		}
-		gpmi_cmd_ctrl(mtd, readcmd, ctrl);
-		ctrl &= ~NAND_CTRL_CHANGE;
+		this->cmd_buffer[this->command_length++] = readcmd;
 	}
 
 	/* Command latch cycle */
 	if (command != NAND_CMD_NONE)
-		gpmi_cmd_ctrl(mtd, command, ctrl);
+		this->cmd_buffer[this->command_length++] = command;
 
-	/* Address cycle, when necessary */
-	ctrl = NAND_NCE | NAND_ALE | NAND_CTRL_CHANGE;
 	/* Serially input address */
 	if (column != -1) {
 		/* Adjust columns for 16 bit buswidth */
 		if (chip->options & NAND_BUSWIDTH_16 &&
 				!nand_opcode_8bits(command))
 			column >>= 1;
-		gpmi_cmd_ctrl(mtd, column, ctrl);
-		ctrl &= ~NAND_CTRL_CHANGE;
+		this->cmd_buffer[this->command_length++] = column;
 
 		/* Only output a single addr cycle for 8bits opcodes. */
 		if (is_lp && !nand_opcode_8bits(command))
-			gpmi_cmd_ctrl(mtd, column >> 8, ctrl);
+			this->cmd_buffer[this->command_length++] = column >> 8;
 	}
 	if (page_addr != -1) {
-		gpmi_cmd_ctrl(mtd, page_addr, ctrl);
-		ctrl &= ~NAND_CTRL_CHANGE;
-		gpmi_cmd_ctrl(mtd, page_addr >> 8, ctrl);
+		this->cmd_buffer[this->command_length++] = page_addr;
+		this->cmd_buffer[this->command_length++] = page_addr >> 8;
 		if (chip->options & NAND_ROW_ADDR_3)
-			gpmi_cmd_ctrl(mtd, page_addr >> 16, ctrl);
+			this->cmd_buffer[this->command_length++] = page_addr >> 16;
 	}
 
 	/* This starts the DMA for the command and waits for it to finish. */
-	gpmi_cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
+	if (this->command_length > 0) {
+		ret = gpmi_send_command(this);
+		if (ret)
+			dev_err(this->dev, "Chip: %u, Error %d\n",
+				this->current_chip, ret);
+
+		this->command_length = 0;
+	}
 
 	if (!is_lp)
 		return;
@@ -1172,10 +1141,12 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 	switch (command) {
 	case NAND_CMD_RNDOUT:
 		/* No ready / busy check necessary */
-		gpmi_cmd_ctrl(mtd, NAND_CMD_RNDOUTSTART,
-			      NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-		gpmi_cmd_ctrl(mtd, NAND_CMD_NONE,
-			      NAND_NCE | NAND_CTRL_CHANGE);
+		this->cmd_buffer[this->command_length++] = NAND_CMD_RNDOUTSTART;
+		ret = gpmi_send_command(this);
+		if (ret)
+			dev_err(this->dev, "Chip: %u, Error %d\n",
+				this->current_chip, ret);
+		this->command_length = 0;
 		break;
 
 	case NAND_CMD_READ0:
@@ -1188,10 +1159,12 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 		if (column == -1 && page_addr == -1)
 			return;
 
-		gpmi_cmd_ctrl(mtd, NAND_CMD_READSTART,
-			      NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-		gpmi_cmd_ctrl(mtd, NAND_CMD_NONE,
-			      NAND_NCE | NAND_CTRL_CHANGE);
+		this->cmd_buffer[this->command_length++] = NAND_CMD_READSTART;
+		ret = gpmi_send_command(this);
+		if (ret)
+			dev_err(this->dev, "Chip: %u, Error %d\n",
+				this->current_chip, ret);
+		this->command_length = 0;
 		break;
 	}
 }
-- 
2.14.1

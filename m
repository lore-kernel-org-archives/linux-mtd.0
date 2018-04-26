Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBj2N-0005kP-8H
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 15:42:25 +0000
Received: by mail-wr0-x244.google.com with SMTP id p5-v6so29489776wre.12
 for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2018 08:42:13 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Dries Staelens <dries.staelens@barco.com>,
 Sam Lefebvre <sam.lefebvre@essensium.com>,
 Arnout Vandecapelle <arnout@mind.be>
Subject: [PATCH 11/13] mtd: rawnand: gpmi: gpmi_nand_command(): simplification
 and formatting
Date: Thu, 26 Apr 2018 17:41:32 +0200
Message-Id: <20180426154134.8270-12-sam.lefebvre@essensium.com>
In-Reply-To: <20180426154134.8270-1-sam.lefebvre@essensium.com>
References: <20180426154134.8270-1-sam.lefebvre@essensium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The controller already takes care of waiting for tCCS when the RNDIN
or RNDOUT command is sent. That is, the NAND_WAIT_TCCS option is not
set for gpmi-nand. Therefore, the gpmi_ccs_delay() calls are not
needed. Gpmi-nand implements the dev_ready function, so explicit delays are not
needed for the RESET and READ0 commands. Therefore, the
gpmi_wait_status_ready() function and the includes it brings in are not
needed. The RESET command just falls through to the nand_wait_ready() call.

Commands are send using DMA, and the DMA already waits for the
ready/busy signal from the NAND. So no explicit delay and call to
nand_wait_ready() is needed.

This makes it possible to simplify the switch in gpmi_nand_command() a
lot.

Since gpmi-nand now implements cmdfunc, it is no longer needed to
implement cmd_ctrl. Call gpmi_cmd_ctrl directly.

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

To enable chaining the two DMAs corresponding to the two commands that
can be issued by gpmi_nand_command(), duplicate the cmd_sgl and
command_length. For cmd_buffer, instead of duplicating it, we can use
a fixed offset within the buffer.

The appropriate sgl and command_length is passed to gpmi_send_command(),
and the sg_init_one(), dma_map_sg() and dma_unmap_sg() calls are hoisted
out of it. This is needed because the unmapping should only be done
after both commands have finished.

Signed-off-by: Sam Lefebvre <sam.lefebvre@essensium.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  |  12 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 224 +++++++----------------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |   9 +-
 3 files changed, 64 insertions(+), 181 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 1858afdb400d..46b2208df30e 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -548,11 +548,11 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
 	return reg & mask;
 }
 
-int gpmi_send_command(struct gpmi_nand_data *this)
+int gpmi_send_command(struct gpmi_nand_data *this, struct scatterlist *sgl,
+		      unsigned int command_length)
 {
 	struct dma_chan *channel = get_dma_chan(this);
 	struct dma_async_tx_descriptor *desc;
-	struct scatterlist *sgl;
 	int chip = this->current_chip;
 	int ret;
 	u32 pio[3];
@@ -564,7 +564,7 @@ int gpmi_send_command(struct gpmi_nand_data *this)
 		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
 		| BF_GPMI_CTRL0_ADDRESS(BV_GPMI_CTRL0_ADDRESS__NAND_CLE)
 		| BM_GPMI_CTRL0_ADDRESS_INCREMENT
-		| BF_GPMI_CTRL0_XFER_COUNT(this->command_length);
+		| BF_GPMI_CTRL0_XFER_COUNT(command_length);
 	pio[1] = pio[2] = 0;
 	desc = dmaengine_prep_slave_sg(channel,
 					(struct scatterlist *)pio,
@@ -573,10 +573,6 @@ int gpmi_send_command(struct gpmi_nand_data *this)
 		return -EINVAL;
 
 	/* [2] send out the COMMAND + ADDRESS string stored in @buffer */
-	sgl = &this->cmd_sgl;
-
-	sg_init_one(sgl, this->cmd_buffer, this->command_length);
-	dma_map_sg(this->dev, sgl, 1, DMA_TO_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel,
 				sgl, 1, DMA_MEM_TO_DEV,
 				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
@@ -586,8 +582,6 @@ int gpmi_send_command(struct gpmi_nand_data *this)
 	/* [3] submit the DMA */
 	ret = start_dma_without_bch_irq(this, desc);
 
-	dma_unmap_sg(this->dev, sgl, 1, DMA_TO_DEVICE);
-
 	return ret;
 }
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 91205573f2bc..81accbf175bf 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -19,13 +19,11 @@
  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 #include <linux/clk.h>
-#include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/sched/task_stack.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/mtd/partitions.h>
-#include <linux/nmi.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include "gpmi-nand.h"
@@ -801,40 +799,6 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
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
@@ -1106,44 +1070,6 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	return max_bitflips;
 }
 
-static void gpmi_wait_status_ready(struct mtd_info *mtd, unsigned long timeo)
-{
-	register struct nand_chip *chip = mtd_to_nand(mtd);
-	int ret;
-
-	timeo = jiffies + msecs_to_jiffies(timeo);
-	do {
-		u8 status;
-
-		ret = nand_read_data_op(chip, &status, sizeof(status), true);
-		if (ret)
-			return;
-
-		if (status & NAND_STATUS_READY)
-			break;
-		touch_softlockup_watchdog();
-	} while (time_before(jiffies, timeo));
-};
-
-static void gpmi_ccs_delay(struct nand_chip *chip)
-{
-	/*
-	 * The controller already takes care of waiting for tCCS when the RNDIN
-	 * or RNDOUT command is sent, return directly.
-	 */
-	if (!(chip->options & NAND_WAIT_TCCS))
-		return;
-
-	/*
-	 * Wait tCCS_min if it is correctly defined, otherwise wait 500ns
-	 * (which should be safe for all NANDs).
-	 */
-	if (chip->setup_data_interface)
-		ndelay(chip->data_interface.timings.sdr.tCCS_min / 1000);
-	else
-		ndelay(500);
-}
-
 /**
  * gpmi_nand_command - Send command to NAND device
  * @mtd: MTD device structure
@@ -1157,10 +1083,14 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 			      int column, int page_addr)
 {
 	register struct nand_chip *chip = mtd_to_nand(mtd);
-	int ctrl = NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE;
+	struct gpmi_nand_data *this = nand_get_controller_data(chip);
+	int ret;
 	/* Large page devices (> 512 bytes) behave slightly differently. */
 	bool is_lp = mtd->writesize > 512;
 
+	BUG_ON(this->command_length != 0);
+	BUG_ON(this->command_length2 != 0);
+
 	if (is_lp) {
 		/* Large page devices don't have the separate regions as we
 		 * have in the small page devices. We must emulate
@@ -1185,126 +1115,81 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 			column -= 256;
 			readcmd = NAND_CMD_READ1;
 		}
-		chip->cmd_ctrl(mtd, readcmd, ctrl);
-		ctrl &= ~NAND_CTRL_CHANGE;
+		this->cmd_buffer[this->command_length++] = readcmd;
 	}
 
 	/* Command latch cycle */
 	if (command != NAND_CMD_NONE)
-		chip->cmd_ctrl(mtd, command, ctrl);
+		this->cmd_buffer[this->command_length++] = command;
 
-	/* Address cycle, when necessary */
-	ctrl = NAND_NCE | NAND_ALE | NAND_CTRL_CHANGE;
 	/* Serially input address */
 	if (column != -1) {
 		/* Adjust columns for 16 bit buswidth */
 		if (chip->options & NAND_BUSWIDTH_16 &&
 				!nand_opcode_8bits(command))
 			column >>= 1;
-		chip->cmd_ctrl(mtd, column, ctrl);
-		ctrl &= ~NAND_CTRL_CHANGE;
+		this->cmd_buffer[this->command_length++] = column;
 
 		/* Only output a single addr cycle for 8bits opcodes. */
 		if (is_lp && !nand_opcode_8bits(command))
-			chip->cmd_ctrl(mtd, column >> 8, ctrl);
+			this->cmd_buffer[this->command_length++] = column >> 8;
 	}
 	if (page_addr != -1) {
-		chip->cmd_ctrl(mtd, page_addr, ctrl);
-		ctrl &= ~NAND_CTRL_CHANGE;
-		chip->cmd_ctrl(mtd, page_addr >> 8, ctrl);
+		this->cmd_buffer[this->command_length++] = page_addr;
+		this->cmd_buffer[this->command_length++] = page_addr >> 8;
 		if (chip->options & NAND_ROW_ADDR_3)
-			chip->cmd_ctrl(mtd, page_addr >> 16, ctrl);
+			this->cmd_buffer[this->command_length++] = page_addr >> 16;
 	}
-	chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
-
-	/*
-	 * Program and erase have their own busy handlers status, sequential
-	 * in and status need no delay.
-	 */
-	switch (command) {
-
-	case NAND_CMD_NONE:
-	case NAND_CMD_PAGEPROG:
-	case NAND_CMD_ERASE1:
-	case NAND_CMD_ERASE2:
-	case NAND_CMD_SEQIN:
-	case NAND_CMD_STATUS:
-	case NAND_CMD_READID:
-	case NAND_CMD_SET_FEATURES:
-		return;
-
-	case NAND_CMD_CACHEDPROG:
-		if (is_lp)
-			return;
-		break;
 
-	case NAND_CMD_RNDIN:
-		if (is_lp) {
-			gpmi_ccs_delay(chip);
-			return;
-		}
-		break;
-
-	case NAND_CMD_RESET:
-		if (chip->dev_ready)
-			break;
-		udelay(chip->chip_delay);
-		chip->cmd_ctrl(mtd, NAND_CMD_STATUS,
-			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-			       NAND_NCE | NAND_CTRL_CHANGE);
-		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
-		gpmi_wait_status_ready(mtd, 250);
-		return;
-
-	case NAND_CMD_RNDOUT:
-		if (is_lp) {
+	/* Reuse the same cmd_buffer for the possible second command. The address
+	 * must be word-aligned. For convenience, use a fixed offset of 64, much
+	 * larger than the maximum command_length. */
+	if (is_lp)
+		switch (command) {
+		case NAND_CMD_RNDOUT:
 			/* No ready / busy check necessary */
-			chip->cmd_ctrl(mtd, NAND_CMD_RNDOUTSTART,
-				NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-			chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-				NAND_NCE | NAND_CTRL_CHANGE);
+			this->cmd_buffer[64 + this->command_length2++] = NAND_CMD_RNDOUTSTART;
+			break;
 
-			gpmi_ccs_delay(chip);
-			return;
+		case NAND_CMD_READ0:
+			/*
+			 * READ0 is sometimes used to exit GET STATUS mode. When this
+			 * is the case no address cycles are requested, and we can use
+			 * this information to detect that that we should not wait for
+			 * the device to be ready and READSTART should not be issued.
+			 */
+			if (column != -1 || page_addr != -1)
+				this->cmd_buffer[64 + this->command_length2++] = NAND_CMD_READSTART;
+			break;
 		}
-		break;
 
-	case NAND_CMD_READ0:
-		/*
-		 * READ0 is sometimes used to exit GET STATUS mode. When this
-		 * is the case no address cycles are requested, and we can use
-		 * this information to detect that that we should not wait for
-		 * the device to be ready and READSTART should not be issued.
-		 */
-		if (column == -1 && page_addr == -1)
-			return;
-
-		if (is_lp) {
-			chip->cmd_ctrl(mtd, NAND_CMD_READSTART,
-				       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
-			chip->cmd_ctrl(mtd, NAND_CMD_NONE,
-				       NAND_NCE | NAND_CTRL_CHANGE);
-		}
-		/* Read commands must wait */
-		break;
-	}
-	/*
-	 * If we don't have access to the busy pin, we apply the given command
-	 * delay.
-	 */
-	if (!chip->dev_ready) {
-		udelay(chip->chip_delay);
-		return;
+	/* This starts the DMA for the command and waits for it to finish. */
+	if (this->command_length > 0) {
+		sg_init_one(&this->cmd_sgl, this->cmd_buffer, this->command_length);
+		dma_map_sg(this->dev, &this->cmd_sgl, 1, DMA_TO_DEVICE);
+		ret = gpmi_send_command(this, &this->cmd_sgl, this->command_length);
+		if (ret)
+			dev_err(this->dev, "Chip: %u, Error %d\n",
+				this->current_chip, ret);
 	}
 
-	/*
-	 * Apply this short delay always to ensure that we do wait tWB in
-	 * any case on any machine.
-	 */
-	ndelay(100);
+	if (this->command_length2 > 0) {
+		sg_init_one(&this->cmd_sgl2, this->cmd_buffer + 64, this->command_length2);
+		dma_map_sg(this->dev, &this->cmd_sgl2, 1, DMA_TO_DEVICE);
+		ret = gpmi_send_command(this, &this->cmd_sgl2, this->command_length2);
+		if (ret)
+			dev_err(this->dev, "Chip: %u, Error %d\n",
+				this->current_chip, ret);
+	}
 
-	nand_wait_ready(mtd);
+	if (this->command_length > 0) {
+		dma_unmap_sg(this->dev, &this->cmd_sgl, 1, DMA_TO_DEVICE);
+		this->command_length = 0;
+	}
+	if (this->command_length2 > 0) {
+		dma_unmap_sg(this->dev, &this->cmd_sgl2, 1, DMA_TO_DEVICE);
+		this->command_length2 = 0;
+	}
 }
 
 
@@ -2115,7 +2000,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	nand_set_flash_node(chip, this->pdev->dev.of_node);
 	chip->select_chip	= gpmi_select_chip;
 	chip->setup_data_interface = gpmi_setup_data_interface;
-	chip->cmd_ctrl		= gpmi_cmd_ctrl;
 	chip->cmdfunc		= gpmi_nand_command;
 	chip->dev_ready		= gpmi_dev_ready;
 	chip->read_byte		= gpmi_read_byte;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 6aa10d6962d6..9dc3dd16fa0b 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -139,11 +139,15 @@ struct gpmi_nand_data {
 
 	/* General-use Variables */
 	int			current_chip;
-	unsigned int		command_length;
 
+	unsigned int		command_length;
 	struct scatterlist	cmd_sgl;
 	char			*cmd_buffer;
 
+	unsigned int		command_length2;
+	struct scatterlist	cmd_sgl2;
+	char			*cmd_buffer2;
+
 	struct scatterlist	data_sgl;
 	char			*data_buffer_dma;
 
@@ -184,7 +188,8 @@ void gpmi_clear_bch(struct gpmi_nand_data *);
 void gpmi_dump_info(struct gpmi_nand_data *);
 int bch_set_geometry(struct gpmi_nand_data *);
 int gpmi_is_ready(struct gpmi_nand_data *, unsigned chip);
-int gpmi_send_command(struct gpmi_nand_data *);
+int gpmi_send_command(struct gpmi_nand_data *, struct scatterlist *sgl,
+		      unsigned int command_length);
 int gpmi_enable_clk(struct gpmi_nand_data *this);
 int gpmi_disable_clk(struct gpmi_nand_data *this);
 int gpmi_setup_data_interface(struct mtd_info *mtd, int chipnr,
-- 
2.14.1

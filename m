Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RN9-0007kw-BQ
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:35 +0000
Received: by mail-wr0-x243.google.com with SMTP id w3-v6so20658291wrg.2
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:26:13 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Subject: [PATCH 11/18] mtd: rawnand: gpmi: instantiate cmdfunc
Date: Fri, 20 Apr 2018 10:19:39 +0200
Message-Id: <20180420081946.16088-12-sam.lefebvre@essensium.com>
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

Later patches will optimize the command handling for gpmi. This
requires a gpmmi-specific implementation of cmdfunc. As a first step,
nand_command() is copied literally from nand_base.c (after merging
nand_command() and nand_command_lp()).

The auxiliary functions nand_ccs_delay() and nand_wait_status_ready()
also need to be copied, together with the includes they need.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 205 +++++++++++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 3da4c07ce2d9..69bdee0ca679 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -19,11 +19,13 @@
  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/sched/task_stack.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/mtd/partitions.h>
+#include <linux/nmi.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include "gpmi-nand.h"
@@ -1091,6 +1093,208 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	return max_bitflips;
 }
 
+static void gpmi_wait_status_ready(struct mtd_info *mtd, unsigned long timeo)
+{
+	register struct nand_chip *chip = mtd_to_nand(mtd);
+	int ret;
+
+	timeo = jiffies + msecs_to_jiffies(timeo);
+	do {
+		u8 status;
+
+		ret = nand_read_data_op(chip, &status, sizeof(status), true);
+		if (ret)
+			return;
+
+		if (status & NAND_STATUS_READY)
+			break;
+		touch_softlockup_watchdog();
+	} while (time_before(jiffies, timeo));
+};
+
+static void gpmi_ccs_delay(struct nand_chip *chip)
+{
+	/*
+	 * The controller already takes care of waiting for tCCS when the RNDIN
+	 * or RNDOUT command is sent, return directly.
+	 */
+	if (!(chip->options & NAND_WAIT_TCCS))
+		return;
+
+	/*
+	 * Wait tCCS_min if it is correctly defined, otherwise wait 500ns
+	 * (which should be safe for all NANDs).
+	 */
+	if (chip->setup_data_interface)
+		ndelay(chip->data_interface.timings.sdr.tCCS_min / 1000);
+	else
+		ndelay(500);
+}
+
+/**
+ * gpmi_nand_command - Send command to NAND device
+ * @mtd: MTD device structure
+ * @command: the command to be sent
+ * @column: the column address for this command, -1 if none
+ * @page_addr: the page address for this command, -1 if none
+ *
+ * Send command to NAND device.
+ */
+static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
+			      int column, int page_addr)
+{
+	register struct nand_chip *chip = mtd_to_nand(mtd);
+	int ctrl = NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE;
+	/* Large page devices (> 512 bytes) behave slightly differently. */
+	bool is_lp = mtd->writesize > 512;
+
+	if (is_lp) {
+		/* Large page devices don't have the separate regions as we
+		 * have in the small page devices. We must emulate
+		 * NAND_CMD_READOOB to keep the code compatible.
+		 */
+		if (command == NAND_CMD_READOOB) {
+			column += mtd->writesize;
+			command = NAND_CMD_READ0;
+		}
+	} else if (command == NAND_CMD_SEQIN) {
+		/* Write out the command to the device */
+		int readcmd;
+
+		if (column >= mtd->writesize) {
+			/* OOB area */
+			column -= mtd->writesize;
+			readcmd = NAND_CMD_READOOB;
+		} else if (column < 256) {
+			/* First 256 bytes --> READ0 */
+			readcmd = NAND_CMD_READ0;
+		} else {
+			column -= 256;
+			readcmd = NAND_CMD_READ1;
+		}
+		chip->cmd_ctrl(mtd, readcmd, ctrl);
+		ctrl &= ~NAND_CTRL_CHANGE;
+	}
+
+	/* Command latch cycle */
+	if (command != NAND_CMD_NONE)
+		chip->cmd_ctrl(mtd, command, ctrl);
+
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
+		if (is_lp && !nand_opcode_8bits(command))
+			chip->cmd_ctrl(mtd, column >> 8, ctrl);
+	}
+	if (page_addr != -1) {
+		chip->cmd_ctrl(mtd, page_addr, ctrl);
+		ctrl &= ~NAND_CTRL_CHANGE;
+		chip->cmd_ctrl(mtd, page_addr >> 8, ctrl);
+		if (chip->options & NAND_ROW_ADDR_3)
+			chip->cmd_ctrl(mtd, page_addr >> 16, ctrl);
+	}
+	chip->cmd_ctrl(mtd, NAND_CMD_NONE, NAND_NCE | NAND_CTRL_CHANGE);
+
+	/*
+	 * Program and erase have their own busy handlers status, sequential
+	 * in and status need no delay.
+	 */
+	switch (command) {
+
+	case NAND_CMD_NONE:
+	case NAND_CMD_PAGEPROG:
+	case NAND_CMD_ERASE1:
+	case NAND_CMD_ERASE2:
+	case NAND_CMD_SEQIN:
+	case NAND_CMD_STATUS:
+	case NAND_CMD_READID:
+	case NAND_CMD_SET_FEATURES:
+		return;
+
+	case NAND_CMD_CACHEDPROG:
+		if (is_lp)
+			return;
+		break;
+
+	case NAND_CMD_RNDIN:
+		if (is_lp) {
+			gpmi_ccs_delay(chip);
+			return;
+		}
+		break;
+
+	case NAND_CMD_RESET:
+		if (chip->dev_ready)
+			break;
+		udelay(chip->chip_delay);
+		chip->cmd_ctrl(mtd, NAND_CMD_STATUS,
+			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+		chip->cmd_ctrl(mtd, NAND_CMD_NONE,
+			       NAND_NCE | NAND_CTRL_CHANGE);
+		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
+		gpmi_wait_status_ready(mtd, 250);
+		return;
+
+	case NAND_CMD_RNDOUT:
+		if (is_lp) {
+			/* No ready / busy check necessary */
+			chip->cmd_ctrl(mtd, NAND_CMD_RNDOUTSTART,
+				NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+			chip->cmd_ctrl(mtd, NAND_CMD_NONE,
+				NAND_NCE | NAND_CTRL_CHANGE);
+
+			gpmi_ccs_delay(chip);
+			return;
+		}
+		break;
+
+	case NAND_CMD_READ0:
+		/*
+		 * READ0 is sometimes used to exit GET STATUS mode. When this
+		 * is the case no address cycles are requested, and we can use
+		 * this information to detect that that we should not wait for
+		 * the device to be ready and READSTART should not be issued.
+		 */
+		if (column == -1 && page_addr == -1)
+			return;
+
+		if (is_lp) {
+			chip->cmd_ctrl(mtd, NAND_CMD_READSTART,
+				       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+			chip->cmd_ctrl(mtd, NAND_CMD_NONE,
+				       NAND_NCE | NAND_CTRL_CHANGE);
+		}
+		/* Read commands must wait */
+		break;
+	}
+	/*
+	 * If we don't have access to the busy pin, we apply the given command
+	 * delay.
+	 */
+	if (!chip->dev_ready) {
+		udelay(chip->chip_delay);
+		return;
+	}
+
+	/*
+	 * Apply this short delay always to ensure that we do wait tWB in
+	 * any case on any machine.
+	 */
+	ndelay(100);
+
+	nand_wait_ready(mtd);
+}
+
+
 static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			      uint8_t *buf, int oob_required, int page)
 {
@@ -1895,6 +2099,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	chip->select_chip	= gpmi_select_chip;
 	chip->setup_data_interface = gpmi_setup_data_interface;
 	chip->cmd_ctrl		= gpmi_cmd_ctrl;
+	chip->cmdfunc		= gpmi_nand_command;
 	chip->dev_ready		= gpmi_dev_ready;
 	chip->read_byte		= gpmi_read_byte;
 	chip->read_buf		= gpmi_read_buf;
-- 
2.14.1

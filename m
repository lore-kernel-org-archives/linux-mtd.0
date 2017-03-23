Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqT9-0004a4-Lg
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:18 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 thorsten.christiansson@idquantique.com, laurent.monat@idquantique.com,
 Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RESEND PATCH v2 42/53] mtd: nand: denali: switch over to cmd_ctrl
 instead of cmdfunc
Date: Thu, 23 Mar 2017 09:17:51 +0900
Message-Id: <1490228282-10805-16-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND_CMD_SET_FEATURES support is missing from denali_cmdfunc().
This is needed for nand_onfi_set_features().  It would be possible
to add it in the current implementation, but having ->cmd_ctrl()
seems a better approach from the discussion with Boris [1].

Rely on the default implementation for ->cmdfunc() and implement
the driver's own ->cmd_ctrl().

Also add ->write_byte(), which is needed to write parameters for
NAND_CMD_SET_FEATURES.

[1] https://lkml.org/lkml/2017/3/15/97

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 104 +++++++++++++++++++++++-----------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index c0b8179..2d25b2f 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -230,20 +230,16 @@ static uint32_t denali_wait_for_irq(struct denali_nand_info *denali,
 	return denali->irq_status;
 }
 
-/* resets a specific device connected to the core */
-static void reset_bank(struct denali_nand_info *denali)
+static uint32_t denali_check_irq(struct denali_nand_info *denali)
 {
+	unsigned long flags;
 	uint32_t irq_status;
 
-	denali_reset_irq(denali);
-
-	iowrite32(1 << denali->flash_bank, denali->flash_reg + DEVICE_RESET);
-
-	irq_status = denali_wait_for_irq(denali,
-					 INTR__RST_COMP | INTR__TIME_OUT);
+	spin_lock_irqsave(&denali->irq_lock, flags);
+	irq_status = denali->irq_status;
+	spin_unlock_irqrestore(&denali->irq_lock, flags);
 
-	if (!(irq_status & INTR__RST_COMP))
-		dev_err(denali->dev, "reset bank failed.\n");
+	return irq_status;
 }
 
 /*
@@ -273,6 +269,42 @@ static uint8_t denali_read_byte(struct mtd_info *mtd)
 	return ioread32(denali->flash_mem + 0x10);
 }
 
+static void denali_write_byte(struct mtd_info *mtd, uint8_t byte)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+
+	index_addr(denali, MODE_11 | BANK(denali->flash_bank) | 2, byte);
+}
+
+static void denali_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	uint32_t type;
+
+	if (ctrl & NAND_CLE)
+		type = 0;
+	else if (ctrl & NAND_ALE)
+		type = 1;
+	else
+		return;
+
+	/*
+	 * Some commands are followed by chip->dev_ready or chip->waitfunc.
+	 * irq_status must be cleared here to catch the R/B# interrupt later.
+	 */
+	if (ctrl & NAND_CTRL_CHANGE)
+		denali_reset_irq(denali);
+
+	index_addr(denali, MODE_11 | BANK(denali->flash_bank) | type, dat);
+}
+
+static int denali_dev_ready(struct mtd_info *mtd)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+
+	return !!(denali_check_irq(denali) & INTR__INT_ACT);
+}
+
 /*
  * sends a pipeline command operation to the controller. See the Denali NAND
  * controller's user guide for more information (section 4.2.3.6).
@@ -788,7 +820,13 @@ static void denali_select_chip(struct mtd_info *mtd, int chip)
 
 static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
 {
-	return 0;
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	uint32_t irq_status;
+
+	/* R/B# pin transitioned from low to high? */
+	irq_status = denali_wait_for_irq(denali, INTR__INT_ACT);
+
+	return irq_status & INTR__INT_ACT ? 0 : NAND_STATUS_FAIL;
 }
 
 static int denali_erase(struct mtd_info *mtd, int page)
@@ -809,46 +847,6 @@ static int denali_erase(struct mtd_info *mtd, int page)
 	return irq_status & INTR__ERASE_COMP ? 0 : NAND_STATUS_FAIL;
 }
 
-static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
-			   int page)
-{
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t addr, irq_status;
-	int wait_ready = 0;
-
-	switch (cmd) {
-	case NAND_CMD_PARAM:
-		wait_ready = 1;
-		break;
-	case NAND_CMD_STATUS:
-	case NAND_CMD_READID:
-		break;
-	case NAND_CMD_RESET:
-		reset_bank(denali);
-		break;
-	case NAND_CMD_READOOB:
-		/* TODO: Read OOB data */
-		return;
-	default:
-		pr_err(": unsupported command received 0x%x\n", cmd);
-		return;
-	}
-
-	denali_reset_irq(denali);
-
-	addr = MODE_11 | BANK(denali->flash_bank);
-	index_addr(denali, addr | 0, cmd);
-	if (col != -1)
-		index_addr(denali, addr | 1, col);
-
-	if (!wait_ready)
-		return;
-
-	irq_status = denali_wait_for_irq(denali, INTR__INT_ACT);
-	if (!(irq_status & INTR__INT_ACT))
-		dev_err(denali->dev, "failed to issue command 0x%x\n", cmd);
-}
-
 #define DIV_ROUND_DOWN_ULL(ll, d) \
 	({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
 
@@ -1187,8 +1185,10 @@ int denali_init(struct denali_nand_info *denali)
 
 	/* register the driver with the NAND core subsystem */
 	chip->select_chip = denali_select_chip;
-	chip->cmdfunc = denali_cmdfunc;
 	chip->read_byte = denali_read_byte;
+	chip->write_byte = denali_write_byte;
+	chip->cmd_ctrl = denali_cmd_ctrl;
+	chip->dev_ready = denali_dev_ready;
 	chip->waitfunc = denali_waitfunc;
 	/* clk rate info is needed for setup_data_interface */
 	if (denali->clk_x_rate)
-- 
2.7.4

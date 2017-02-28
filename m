Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cil57-0005VU-E0
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 16:57:04 +0000
Received: by mail-qk0-x243.google.com with SMTP id n186so4259071qkb.0
 for <linux-mtd@lists.infradead.org>; Tue, 28 Feb 2017 08:56:36 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@atmel.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH V4,
 2/2] mtd: nand: brcmnand: Check flash #WP pin status before nand
 erase/program
Date: Tue, 28 Feb 2017 11:55:26 -0500
Message-Id: <1488300926-3517-2-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1488300926-3517-1-git-send-email-kdasu.kdev@gmail.com>
References: <1488300926-3517-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

brcmnand controller v6.x and v7.x lets driver to enable disable #WP pin
via NAND_WP bit in CS_SELECT register. Driver implementation assumes that
setting/resetting the bit would assert/de-assert  #WP pin instantaneously
from the flash part's perspective, and was proceeding to erase/program
without verifying flash status byte for protection bit. In rigorous
testing this was causing rare data corruptions with erase and/or
subsequent programming. To fix this check NAND status in addition to
controller #WP pin status to make sure both sides are ready to accept
new commands.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 70 +++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index c7c4efe..af32685 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -101,6 +101,9 @@ struct brcm_nand_dma_desc {
 #define BRCMNAND_MIN_BLOCKSIZE	(8 * 1024)
 #define BRCMNAND_MIN_DEVSIZE	(4ULL * 1024 * 1024)
 
+#define NAND_CTRL_RDY			(INTFC_CTLR_READY | INTFC_FLASH_READY)
+#define NAND_POLL_STATUS_TIMEOUT_MS	100
+
 /* Controller feature flags */
 enum {
 	BRCMNAND_HAS_1K_SECTORS			= BIT(0),
@@ -765,12 +768,69 @@ enum {
 	CS_SELECT_AUTO_DEVICE_ID_CFG		= BIT(30),
 };
 
-static int brcmnand_set_wp(struct brcmnand_host *host, int en)
+static int bcmnand_ctrl_poll_status(struct brcmnand_controller *ctrl,
+				    u32 mask, u32 expected_val,
+				    unsigned long timeout_ms)
+{
+	unsigned long limit;
+	u32 val;
+
+	if (!timeout_ms)
+		timeout_ms = NAND_POLL_STATUS_TIMEOUT_MS;
+
+	limit = jiffies + msecs_to_jiffies(timeout_ms);
+	do {
+		val = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
+		if ((val & mask) == expected_val)
+			return 0;
+
+		cpu_relax();
+	} while (time_after(limit, jiffies));
+
+	dev_warn(ctrl->dev, "timeout on status poll (expected %x got %x)\n",
+		 expected_val, val & mask);
+
+	return -ETIMEDOUT;
+}
+
+static inline void brcmnand_set_wp_reg(struct brcmnand_controller *ctrl, int en)
 {
-	struct brcmnand_controller *ctrl = host->ctrl;
 	u32 val = en ? CS_SELECT_NAND_WP : 0;
 
 	brcmnand_rmw_reg(ctrl, BRCMNAND_CS_SELECT, CS_SELECT_NAND_WP, 0, val);
+}
+
+static int brcmnand_set_wp(struct brcmnand_host *host, int en)
+{
+	struct brcmnand_controller *ctrl = host->ctrl;
+	struct mtd_info *mtd = nand_to_mtd(&host->chip);
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	int ret;
+
+	/*
+	 * make sure ctrl/flash ready before and after
+	 * changing state of WP PIN
+	 */
+	ret = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY | NAND_STATUS_READY,
+				       NAND_CTRL_RDY | NAND_STATUS_READY, 0);
+	if (ret)
+		return ret;
+
+	brcmnand_set_wp_reg(ctrl, en);
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+	/* NAND_STATUS_WP 0x00 = protected, 0x80 = not protected */
+	ret = bcmnand_ctrl_poll_status(ctrl,
+				       NAND_CTRL_RDY | NAND_STATUS_READY |
+				       NAND_STATUS_WP,
+				       NAND_CTRL_RDY | NAND_STATUS_READY |
+				       (en ? 0 : NAND_STATUS_WP), 0);
+
+	if (ret) {
+		dev_err_ratelimited(&host->pdev->dev,
+				    "nand #WP expected %s\n",
+				    en ? "On" : "Off");
+		return ret;
+	}
 
 	return 0;
 }
@@ -1160,15 +1220,15 @@ static irqreturn_t brcmnand_dma_irq(int irq, void *data)
 static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
-	u32 intfc;
+	int ret;
 
 	dev_dbg(ctrl->dev, "send native cmd %d addr_lo 0x%x\n", cmd,
 		brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS));
 	BUG_ON(ctrl->cmd_pending != 0);
 	ctrl->cmd_pending = cmd;
 
-	intfc = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
-	WARN_ON(!(intfc & INTFC_CTLR_READY));
+	ret = bcmnand_ctrl_poll_status(ctrl, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
+	WARN_ON(ret);
 
 	mb(); /* flush previous writes */
 	brcmnand_write_reg(ctrl, BRCMNAND_CMD_START,
-- 
1.9.1

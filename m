Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdfu9-0001mA-P9
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 16:24:39 +0000
Received: by mail-oi0-x243.google.com with SMTP id j15so1349917oih.0
 for <linux-mtd@lists.infradead.org>; Tue, 14 Feb 2017 08:24:17 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org,
	computersforpeace@gmail.com
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH] mtd: brcmnand: Check flash write protect pin status
Date: Tue, 14 Feb 2017 11:23:44 -0500
Message-Id: <1487089424-4354-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With v6.x and v7.x controller lets the driver to enable disable #WP pin.
So to be safe let driver send flash status cmd whenever the #WP pin status
is being changed and makes sure the controller and the the flash are both
ready to accept new cmds by verifying the WP protect/unprotect bit is set
correctly in the flash status byte. Modify enable/disable #WP register only
when the nand controller is not ready.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 75 +++++++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 42ebd73..6935bc1 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -101,6 +101,9 @@ struct brcm_nand_dma_desc {
 #define BRCMNAND_MIN_BLOCKSIZE	(8 * 1024)
 #define BRCMNAND_MIN_DEVSIZE	(4ULL * 1024 * 1024)
 
+#define FLASH_RDY	(NAND_STATUS_READY)
+#define NAND_CTRL_RDY	(INTFC_CTLR_READY | INTFC_FLASH_READY)
+
 /* Controller feature flags */
 enum {
 	BRCMNAND_HAS_1K_SECTORS			= BIT(0),
@@ -765,13 +768,62 @@ enum {
 	CS_SELECT_AUTO_DEVICE_ID_CFG		= BIT(30),
 };
 
-static inline void brcmnand_set_wp(struct brcmnand_controller *ctrl, bool en)
+static int bcmnand_ctrl_busy_poll(struct brcmnand_controller *ctrl, u32 mask)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(200);
+
+	if (!mask)
+		mask = INTFC_CTLR_READY;
+
+	while ((brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS) & mask) !=
+		mask) {
+		if (time_after(jiffies, timeout)) {
+			dev_warn(ctrl->dev, "timeout on ctrl_ready\n");
+			return -ETIMEDOUT;
+		}
+		cpu_relax();
+	}
+	return 0;
+}
+
+static inline void brcmnand_set_wp_reg(struct brcmnand_controller *ctrl, int en)
 {
 	u32 val = en ? CS_SELECT_NAND_WP : 0;
 
 	brcmnand_rmw_reg(ctrl, BRCMNAND_CS_SELECT, CS_SELECT_NAND_WP, 0, val);
 }
 
+static void brcmnand_set_wp(struct brcmnand_host *host, int en)
+{
+	struct brcmnand_controller *ctrl = host->ctrl;
+	struct mtd_info *mtd = &host->mtd;
+	struct nand_chip *chip = mtd->priv;
+	u32 sts_reg;
+	bool is_wp;
+
+	/*
+	 * make sure ctrl/flash ready before and after
+	 * changing state of WP PIN
+	 */
+	bcmnand_ctrl_busy_poll(ctrl, NAND_CTRL_RDY | FLASH_RDY);
+	brcmnand_set_wp_reg(ctrl, en);
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+	bcmnand_ctrl_busy_poll(ctrl, NAND_CTRL_RDY | FLASH_RDY);
+	sts_reg = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
+	/* NAND_STATUS_WP 0x80 = not protected, 0x00 = protected */
+	is_wp = (sts_reg & NAND_STATUS_WP) ? false : true;
+
+	if (is_wp != en) {
+		u32 nand_wp = brcmnand_read_reg(ctrl, BRCMNAND_CS_SELECT);
+
+		nand_wp &= CS_SELECT_NAND_WP;
+		dev_err_ratelimited(&host->pdev->dev,
+				    "#WP %s sts:0x%x expected %s NAND_WP 0x%x\n",
+				    is_wp ? "On" : "Off",  sts_reg & 0xff,
+				    en ? "On" : "Off", nand_wp ? 1 : 0);
+	}
+}
+
 /***********************************************************************
  * Flash DMA
  ***********************************************************************/
@@ -1029,7 +1081,7 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
 			dev_dbg(ctrl->dev, "WP %s\n", wp ? "on" : "off");
 			old_wp = wp;
 		}
-		brcmnand_set_wp(ctrl, wp);
+		brcmnand_set_wp(host, wp);
 	}
 }
 
@@ -1158,15 +1210,18 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
 	u32 intfc;
+	u32 mask = NAND_CTRL_RDY;
 
 	dev_dbg(ctrl->dev, "send native cmd %d addr_lo 0x%x\n", cmd,
 		brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS));
 	BUG_ON(ctrl->cmd_pending != 0);
 	ctrl->cmd_pending = cmd;
 
+	bcmnand_ctrl_busy_poll(ctrl, mask);
 	intfc = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
 	WARN_ON(!(intfc & INTFC_CTLR_READY));
 
+
 	mb(); /* flush previous writes */
 	brcmnand_write_reg(ctrl, BRCMNAND_CMD_START,
 			   cmd << brcmnand_cmd_shift(ctrl));
@@ -2462,14 +2517,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	/* Disable XOR addressing */
 	brcmnand_rmw_reg(ctrl, BRCMNAND_CS_XOR, 0xff, 0, 0);
 
-	if (ctrl->features & BRCMNAND_HAS_WP) {
-		/* Permanently disable write protection */
-		if (wp_on == 2)
-			brcmnand_set_wp(ctrl, false);
-	} else {
-		wp_on = 0;
-	}
-
 	/* IRQ */
 	ctrl->irq = platform_get_irq(pdev, 0);
 	if ((int)ctrl->irq < 0) {
@@ -2522,6 +2569,14 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			}
 
 			list_add_tail(&host->node, &ctrl->host_list);
+
+			if (ctrl->features & BRCMNAND_HAS_WP) {
+				/* Permanently disable write protection */
+				if (wp_on == 2)
+					brcmnand_set_wp(host, false);
+			} else {
+				wp_on = 0;
+			}
 		}
 	}
 
-- 
1.9.1

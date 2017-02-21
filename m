Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg1AQ-00040f-6i
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 03:31:07 +0000
Received: by mail-pg0-x241.google.com with SMTP id s67so5216159pgb.1
 for <linux-mtd@lists.infradead.org>; Mon, 20 Feb 2017 19:30:46 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: f.fainelli@gmail.com, richard@nod.at, marek.vasut@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, cyrille.pitchen@atmel.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH V3,
 2/2] mtd: nand: brcmnand: Check flash #WP pin status before nand
 erase/program
Date: Mon, 20 Feb 2017 22:30:32 -0500
Message-Id: <1487647832-10544-2-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1487647832-10544-1-git-send-email-kdasu.kdev@gmail.com>
References: <1487647832-10544-1-git-send-email-kdasu.kdev@gmail.com>
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
subsequent programming. To fix this added verification logic to
brcmandn_wp_set() by reading  flash status and verifying protection bit
indicating #WP pin status.  The new logic makes sure controller as well
as the flash is ready to accept commands.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 60 ++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index c7c4efe..ad8733f 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -24,6 +24,7 @@
 #include <linux/spinlock.h>
 #include <linux/dma-mapping.h>
 #include <linux/ioport.h>
+#include <linux/iopoll.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
 #include <linux/bitops.h>
@@ -101,6 +102,8 @@ struct brcm_nand_dma_desc {
 #define BRCMNAND_MIN_BLOCKSIZE	(8 * 1024)
 #define BRCMNAND_MIN_DEVSIZE	(4ULL * 1024 * 1024)
 
+#define NAND_CTRL_RDY	(INTFC_CTLR_READY | INTFC_FLASH_READY)
+
 /* Controller feature flags */
 enum {
 	BRCMNAND_HAS_1K_SECTORS			= BIT(0),
@@ -765,12 +768,63 @@ enum {
 	CS_SELECT_AUTO_DEVICE_ID_CFG		= BIT(30),
 };
 
-static int brcmnand_set_wp(struct brcmnand_host *host, int en)
+static void bcmnand_ctrl_busy_poll(struct brcmnand_controller *ctrl, u32 mask,
+				   u32 *reg_val)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(200);
+	u32 val;
+
+	while (1) {
+		val = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
+		if ((val & mask) == mask)
+			break;
+
+		if (time_after(jiffies, timeout)) {
+			dev_warn(ctrl->dev, "timeout on ctrl_ready %x\n", val);
+			break;
+		}
+		cpu_relax();
+	}
+
+	*reg_val = val;
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
+	u32 val;
+	bool is_wp;
+
+	/*
+	 * make sure ctrl/flash ready before and after
+	 * changing state of WP PIN
+	 */
+	bcmnand_ctrl_busy_poll(ctrl, NAND_CTRL_RDY | NAND_STATUS_READY, &val);
+	brcmnand_set_wp_reg(ctrl, en);
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+	bcmnand_ctrl_busy_poll(ctrl, NAND_CTRL_RDY | NAND_STATUS_READY, &val);
+	/* NAND_STATUS_WP 0x80 = not protected, 0x00 = protected */
+	is_wp = !(val & NAND_STATUS_WP);
+
+	if (is_wp != en) {
+		u32 nand_wp = brcmnand_read_reg(ctrl, BRCMNAND_CS_SELECT);
+
+		nand_wp &= CS_SELECT_NAND_WP;
+		dev_err_ratelimited(&host->pdev->dev,
+				    "#WP %s sts:0x%x expected %s NAND_WP %d\n",
+				    is_wp ? "On" : "Off", val & 0xff,
+				    en ? "On" : "Off", nand_wp ? 1 : 0);
+		return -EINVAL;
+	}
 
 	return 0;
 }
@@ -1167,7 +1221,7 @@ static void brcmnand_send_cmd(struct brcmnand_host *host, int cmd)
 	BUG_ON(ctrl->cmd_pending != 0);
 	ctrl->cmd_pending = cmd;
 
-	intfc = brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS);
+	bcmnand_ctrl_busy_poll(ctrl, NAND_CTRL_RDY, &intfc);
 	WARN_ON(!(intfc & INTFC_CTLR_READY));
 
 	mb(); /* flush previous writes */
-- 
1.9.1

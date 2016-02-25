Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYjVK-00075g-EN
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2016 00:10:03 +0000
Received: by mail-pf0-x22e.google.com with SMTP id e127so21855447pfe.3
 for <linux-mtd@lists.infradead.org>; Wed, 24 Feb 2016 16:09:42 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: brcmnand: Fix v7.1 register offsets
Date: Wed, 24 Feb 2016 16:07:23 -0800
Message-Id: <1456358843-16347-1-git-send-email-f.fainelli@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The BRCMNAND controller revision 7.1 is almost 100% compatible with the
previous v6.0 register offset layout, except for the Correctable Error
Reporting Threshold registers. Fix this by adding another table with the
correct offsets for CORR_THRESHOLD and CORR_THRESHOLD_EXT.

Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 844fc07d22cd..f7009c1cb90c 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -311,6 +311,36 @@ static const u16 brcmnand_regs_v60[] = {
 	[BRCMNAND_FC_BASE]		= 0x400,
 };
 
+/* BRCMNAND v7.1 */
+static const u16 brcmnand_regs_v71[] = {
+	[BRCMNAND_CMD_START]		=  0x04,
+	[BRCMNAND_CMD_EXT_ADDRESS]	=  0x08,
+	[BRCMNAND_CMD_ADDRESS]		=  0x0c,
+	[BRCMNAND_INTFC_STATUS]		=  0x14,
+	[BRCMNAND_CS_SELECT]		=  0x18,
+	[BRCMNAND_CS_XOR]		=  0x1c,
+	[BRCMNAND_LL_OP]		=  0x20,
+	[BRCMNAND_CS0_BASE]		=  0x50,
+	[BRCMNAND_CS1_BASE]		=     0,
+	[BRCMNAND_CORR_THRESHOLD]	=  0xdc,
+	[BRCMNAND_CORR_THRESHOLD_EXT]	=  0xe0,
+	[BRCMNAND_UNCORR_COUNT]		=  0xfc,
+	[BRCMNAND_CORR_COUNT]		= 0x100,
+	[BRCMNAND_CORR_EXT_ADDR]	= 0x10c,
+	[BRCMNAND_CORR_ADDR]		= 0x110,
+	[BRCMNAND_UNCORR_EXT_ADDR]	= 0x114,
+	[BRCMNAND_UNCORR_ADDR]		= 0x118,
+	[BRCMNAND_SEMAPHORE]		= 0x150,
+	[BRCMNAND_ID]			= 0x194,
+	[BRCMNAND_ID_EXT]		= 0x198,
+	[BRCMNAND_LL_RDATA]		= 0x19c,
+	[BRCMNAND_OOB_READ_BASE]	= 0x200,
+	[BRCMNAND_OOB_READ_10_BASE]	=     0,
+	[BRCMNAND_OOB_WRITE_BASE]	= 0x280,
+	[BRCMNAND_OOB_WRITE_10_BASE]	=     0,
+	[BRCMNAND_FC_BASE]		= 0x400,
+};
+
 enum brcmnand_cs_reg {
 	BRCMNAND_CS_CFG_EXT = 0,
 	BRCMNAND_CS_CFG,
@@ -406,7 +436,9 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 	}
 
 	/* Register offsets */
-	if (ctrl->nand_version >= 0x0600)
+	if (ctrl->nand_version >= 0x0701)
+		ctrl->reg_offsets = brcmnand_regs_v71;
+	else if (ctrl->nand_version >= 0x0600)
 		ctrl->reg_offsets = brcmnand_regs_v60;
 	else if (ctrl->nand_version >= 0x0500)
 		ctrl->reg_offsets = brcmnand_regs_v50;
-- 
2.1.0

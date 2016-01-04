Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGCKA-0004zD-1n
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 21:06:02 +0000
From: John Crispin <blogic@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 6/6] MTD: lantiq: xway: allow request line masking
Date: Mon,  4 Jan 2016 22:05:01 +0100
Message-Id: <1451941501-42952-7-git-send-email-blogic@openwrt.org>
In-Reply-To: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
References: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are several request lines. Allow masking the unused ones via OF.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/mtd/nand/xway_nand.c |   63 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 4127049..c253720 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -54,8 +54,27 @@
 #define NAND_CON_CSMUX		(1 << 1)
 #define NAND_CON_NANDM		1
 
+#define DANUBE_PCI_REG32(addr)	(*(volatile u32 *)(addr))
+#define PCI_CR_PR_OFFSET	(KSEG1+0x1E105400)
+#define PCI_CR_PC_ARB		(PCI_CR_PR_OFFSET + 0x0080)
+
 static u32 xway_latchcmd;
 
+/*
+ * req_mask provides a mechanism to prevent interference between
+ * nand and pci (probably only relevant for the BT Home Hub 2B).
+ * Setting it causes the corresponding pci req pins to be masked
+ * during nand access, and also moves ebu locking from the read/write
+ * functions to the chip select function to ensure that the whole
+ * operation runs with interrupts disabled.
+ * In addition it switches on some extra waiting in xway_cmd_ctrl().
+ * This seems to be necessary if the ebu_cs1 pin has open-drain disabled,
+ * which in turn seems to be necessary for the nor chip to be recognised
+ * reliably, on a board (Home Hub 2B again) which has both nor and nand.
+ */
+
+static __be32 req_mask;
+
 static void xway_reset_chip(struct nand_chip *chip)
 {
 	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
@@ -86,12 +105,24 @@ static void xway_select_chip(struct mtd_info *mtd, int chip)
 	case -1:
 		ltq_ebu_w32_mask(NAND_CON_CE, 0, EBU_NAND_CON);
 		ltq_ebu_w32_mask(NAND_CON_NANDM, 0, EBU_NAND_CON);
+
+		if (req_mask) {
+			/* Unmask all external PCI request */
+			DANUBE_PCI_REG32(PCI_CR_PC_ARB) &= ~(req_mask << 16);
+		}
 		spin_unlock_irqrestore(&ebu_lock, csflags);
+
 		break;
 	case 0:
 		spin_lock_irqsave(&ebu_lock, csflags);
+		if (req_mask) {
+			/* Mask all external PCI request */
+			DANUBE_PCI_REG32(PCI_CR_PC_ARB) |= (req_mask << 16);
+		}
+
 		ltq_ebu_w32_mask(0, NAND_CON_NANDM, EBU_NAND_CON);
 		ltq_ebu_w32_mask(0, NAND_CON_CE, EBU_NAND_CON);
+
 		break;
 	default:
 		BUG();
@@ -103,6 +134,12 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	struct nand_chip *this = mtd->priv;
 	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
 
+	if (req_mask) {
+		if (cmd != NAND_CMD_STATUS)
+			ltq_ebu_w32(EBU_NAND_WAIT, 0); /* Clear nand ready */
+	}
+
+
 	if (ctrl & NAND_CTRL_CHANGE) {
 		if (ctrl & NAND_CLE)
 			xway_latchcmd = NAND_WRITE_CMD;
@@ -115,6 +152,24 @@ static void xway_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 		while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
 			;
 	}
+
+	if (req_mask) {
+	       /*
+		* program and erase have their own busy handlers
+		* status and sequential in needs no delay
+		*/
+		switch (cmd) {
+		case NAND_CMD_ERASE1:
+		case NAND_CMD_SEQIN:
+		case NAND_CMD_STATUS:
+		case NAND_CMD_READID:
+		return;
+		}
+
+		/* wait until command is processed */
+		while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_RD) == 0)
+			;
+	}
 }
 
 static int xway_dev_ready(struct mtd_info *mtd)
@@ -157,6 +212,8 @@ static int xway_nand_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this = platform_get_drvdata(pdev);
 	unsigned long nandaddr = (unsigned long) this->IO_ADDR_W;
+	const __be32 *req_mask_ptr = of_get_property(pdev->dev.of_node,
+					"req-mask", NULL);
 	const __be32 *cs = of_get_property(pdev->dev.of_node,
 					"lantiq,cs", NULL);
 	u32 cs_flag = 0;
@@ -165,6 +222,12 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (cs && (*cs == 1))
 		cs_flag = NAND_CON_IN_CS1 | NAND_CON_OUT_CS1;
 
+	/*
+	 * Load the PCI req lines to mask from the device tree. If the
+	 * property is not present, setting req_mask to 0 disables masking.
+	 */
+	req_mask = (req_mask_ptr ? *req_mask_ptr : 0);
+
 	/* setup the EBU to run in NAND mode on our base addr */
 	ltq_ebu_w32(CPHYSADDR(nandaddr)
 		| ADDSEL1_MASK(3) | ADDSEL1_REGEN, EBU_ADDSEL1);
-- 
1.7.10.4

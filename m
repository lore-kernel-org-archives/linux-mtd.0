Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBj29-0005hv-P0
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 15:42:12 +0000
Received: by mail-wr0-x244.google.com with SMTP id v60-v6so57238613wrc.7
 for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2018 08:42:06 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Dries Staelens <dries.staelens@barco.com>,
 Sam Lefebvre <sam.lefebvre@essensium.com>,
 Arnout Vandecapelle <arnout@mind.be>, Han Xu <han.xu@nxp.com>
Subject: [PATCH 07/13] mtd: rawnand: gpmi: set aggregate ready/busy signalling
Date: Thu, 26 Apr 2018 17:41:28 +0200
Message-Id: <20180426154134.8270-8-sam.lefebvre@essensium.com>
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

The GPMI block by default decouples the ready/busy signal (which is
shared between all chip-selects) to separate internal signals per
chip-select. However, since the gpmi-nand driver uses DMA0 for all
chip-selects, DMA transfers will not be able to see the ready/busy
status for any chip-select other than 0.

Currently, this happens to work because nand_command() ends with an
explicit nand_wait_ready() and the driver only sets up a single command
in a DMA chain. nand_wait_ready() polls for the chip-select specific
ready/busy status bit. Future patches, however, will set up a DMA chain
with several commands, so these will have to wait correctly in the DMA
chain itself.

To fix this, set the GANGED_RDYBUSY bit in the control1 register. This
ties all internal ready/busy signals together, so DMA0 will also see
the ready/busy status of chip selects 1-2-3. It's a bit silly that this
isn't implied in hardware by the DECOUPLE_CS bit.

Signed-off-by: Sam Lefebvre <sam.lefebvre@essensium.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Han Xu <han.xu@nxp.com>
---
Tested on an i.MX6Q with two identical chips on CS0 and CS1.
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  | 3 +++
 drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 83697b8df871..1858afdb400d 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -193,6 +193,9 @@ int gpmi_init(struct gpmi_nand_data *this)
 	 */
 	writel(BM_GPMI_CTRL1_DECOUPLE_CS, r->gpmi_regs + HW_GPMI_CTRL1_SET);
 
+	/* Aggregate ready busy signalling. */
+	writel(BM_GPMI_CTRL1_GANGED_RDYBUSY, r->gpmi_regs + HW_GPMI_CTRL1_SET);
+
 	gpmi_disable_clk(this);
 	return 0;
 err_out:
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
index d92bf32221ca..e341802c90ac 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
@@ -120,6 +120,7 @@
 #define BV_GPMI_CTRL1_WRN_DLY_SEL_7_TO_12NS		0x2
 #define BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY		0x3
 
+#define BM_GPMI_CTRL1_GANGED_RDYBUSY		(1 << 19)
 #define BM_GPMI_CTRL1_BCH_MODE				(1 << 18)
 
 #define BP_GPMI_CTRL1_DLL_ENABLE			17
-- 
2.14.1

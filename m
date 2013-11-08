Received: from mail-qa0-x231.google.com ([2607:f8b0:400d:c00::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Veass-0007wr-8N
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 01:29:15 +0000
Received: by mail-qa0-f49.google.com with SMTP id cm18so1169264qab.8
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 17:28:52 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: gpmi-lib: Make checkpatch happy
Date: Thu,  7 Nov 2013 23:28:43 -0200
Message-Id: <1383874123-30125-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Fix the following checkpatch warnings:

WARNING: line over 80 characters
#268: FILE: mtd/nand/gpmi-nand/gpmi-lib.c:268:
+	* consecutive reboots. The latter case has not been seen on the MX23 yet,

WARNING: space prohibited before semicolon
#356: FILE: mtd/nand/gpmi-nand/gpmi-lib.c:356:
+		(target.tRHOH_in_ns >= 0) ;

WARNING: space prohibited before semicolon
#1006: FILE: mtd/nand/gpmi-nand/gpmi-lib.c:1006:
+		BF_GPMI_TIMING0_DATA_SETUP(hw.data_setup_in_cycles)       ;

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index aaced29..c7a578c 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -265,8 +265,8 @@ int bch_set_geometry(struct gpmi_nand_data *this)
 	* chip, otherwise it will lock up. So we skip resetting BCH on the MX23.
 	* On the other hand, the MX28 needs the reset, because one case has been
 	* seen where the BCH produced ECC errors constantly after 10000
-	* consecutive reboots. The latter case has not been seen on the MX23 yet,
-	* still we don't know if it could happen there as well.
+	* consecutive reboots. The latter case has not been seen on the MX23
+	* yet, still we don't know if it could happen there as well.
 	*/
 	ret = gpmi_reset_block(r->bch_regs, GPMI_IS_MX23(this));
 	if (ret)
@@ -353,7 +353,7 @@ static int gpmi_nfc_compute_hardware_timing(struct gpmi_nand_data *this,
 	improved_timing_is_available =
 		(target.tREA_in_ns  >= 0) &&
 		(target.tRLOH_in_ns >= 0) &&
-		(target.tRHOH_in_ns >= 0) ;
+		(target.tRHOH_in_ns >= 0);
 
 	/* Inspect the clock. */
 	nfc->clock_frequency_in_hz = clk_get_rate(r->clock[0]);
@@ -1003,7 +1003,7 @@ void gpmi_begin(struct gpmi_nand_data *this)
 	/* [1] Set HW_GPMI_TIMING0 */
 	reg = BF_GPMI_TIMING0_ADDRESS_SETUP(hw.address_setup_in_cycles) |
 		BF_GPMI_TIMING0_DATA_HOLD(hw.data_hold_in_cycles)         |
-		BF_GPMI_TIMING0_DATA_SETUP(hw.data_setup_in_cycles)       ;
+		BF_GPMI_TIMING0_DATA_SETUP(hw.data_setup_in_cycles);
 
 	writel(reg, gpmi_regs + HW_GPMI_TIMING0);
 
-- 
1.8.1.2

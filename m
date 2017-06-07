Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIZXD-0004VD-Su
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 11:54:04 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v5 14/23] mtd: nand: denali: fix bank reset function to detect
 the number of chips
Date: Wed,  7 Jun 2017 20:52:23 +0900
Message-Id: <1496836352-8016-15-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nand_scan_ident() iterates over maxchips, and calls nand_reset()
for each.  This driver currently passes the maximum number of banks
(=chip selects) supported by the controller as maxchips.  So, maxchips
is typically 4 or 8.  Usually, less number of NAND chips are connected
to the controller.

This can be a problem for ONFi devices.  Now, this driver implements
->setup_data_interface() hook, so nand_setup_data_interface() issues
Set Features (0xEF) command, which waits until the chip returns R/B#
response.  If no chip there, we know it never happens, but the driver
still ends up with waiting for a long time.  It will finally bail-out
with timeout error and the driver will work with existing chips, but
unnecessary wait will give a bad user experience.

The denali_nand_reset() polls the INTR__RST_COMP and INTR__TIME_OUT
bits, but they are always set even if not NAND chip is connected to
that bank.  To know the chip existence, INTR__INT_ACT bit must be
checked; this flag is set only when R/B# is toggled.  Since the Reset
(0xFF) command toggles the R/B# pin, this can be used to know the
actual number of chips, and update denali->max_banks.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Boris mentioned this information can be retrieved from DT
(http://patchwork.ozlabs.org/patch/745118/), but I'd like to
take time for controller/chip decoupling.  I am tackling on
that, but not completed yet.

I believe this commit stands for denali_pci, at least I do not
know how to get the number of chips from PCI.


Changes in v5: None
Changes in v4:
  - Reword commit-log

Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 52 +++++++++++++++++++++--------------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 95bce6b341d7..8e2399ddfe3f 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -85,33 +85,6 @@ static void index_addr(struct denali_nand_info *denali,
 	iowrite32(data, denali->flash_mem + 0x10);
 }
 
-/* Reset the flash controller */
-static uint16_t denali_nand_reset(struct denali_nand_info *denali)
-{
-	int i;
-
-	for (i = 0; i < denali->max_banks; i++)
-		iowrite32(INTR__RST_COMP | INTR__TIME_OUT,
-		denali->flash_reg + INTR_STATUS(i));
-
-	for (i = 0; i < denali->max_banks; i++) {
-		iowrite32(1 << i, denali->flash_reg + DEVICE_RESET);
-		while (!(ioread32(denali->flash_reg + INTR_STATUS(i)) &
-			(INTR__RST_COMP | INTR__TIME_OUT)))
-			cpu_relax();
-		if (ioread32(denali->flash_reg + INTR_STATUS(i)) &
-			INTR__TIME_OUT)
-			dev_dbg(denali->dev,
-			"NAND Reset operation timed out on bank %d\n", i);
-	}
-
-	for (i = 0; i < denali->max_banks; i++)
-		iowrite32(INTR__RST_COMP | INTR__TIME_OUT,
-			  denali->flash_reg + INTR_STATUS(i));
-
-	return PASS;
-}
-
 /*
  * Use the configuration feature register to determine the maximum number of
  * banks that the hardware supports.
@@ -999,7 +972,28 @@ static int denali_setup_data_interface(struct mtd_info *mtd,
 	return 0;
 }
 
-/* Initialization code to bring the device up to a known good state */
+static void denali_reset_banks(struct denali_nand_info *denali)
+{
+	int i;
+
+	denali_clear_irq_all(denali);
+
+	for (i = 0; i < denali->max_banks; i++) {
+		iowrite32(1 << i, denali->flash_reg + DEVICE_RESET);
+		while (!(ioread32(denali->flash_reg + INTR_STATUS(i)) &
+			(INTR__RST_COMP | INTR__TIME_OUT)))
+			cpu_relax();
+		if (!(ioread32(denali->flash_reg + INTR_STATUS(i)) &
+		      INTR__INT_ACT))
+			break;
+	}
+
+	dev_dbg(denali->dev, "%d chips connected\n", i);
+	denali->max_banks = i;
+
+	denali_clear_irq_all(denali);
+}
+
 static void denali_hw_init(struct denali_nand_info *denali)
 {
 	/*
@@ -1019,7 +1013,7 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	denali->bbtskipbytes = ioread32(denali->flash_reg +
 						SPARE_AREA_SKIP_BYTES);
 	detect_max_banks(denali);
-	denali_nand_reset(denali);
+	denali_reset_banks(denali);
 	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
 	iowrite32(CHIP_EN_DONT_CARE__FLAG,
 			denali->flash_reg + CHIP_ENABLE_DONT_CARE);
-- 
2.7.4

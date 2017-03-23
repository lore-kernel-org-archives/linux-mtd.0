Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqT6-0004a1-Ai
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:10 +0000
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
Subject: [RESEND PATCH v2 43/53] mtd: nand: denali: fix bank reset function
Date: Thu, 23 Mar 2017 09:17:52 +0900
Message-Id: <1490228282-10805-17-git-send-email-yamada.masahiro@socionext.com>
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

The function denali_nand_reset() is called during the driver probe,
and polls the INTR__RST_COMP and INTR__TIME_OUT bits.  However,
INTR__RST_COMP is set anyway even if no NAND device is connected to
that bank.

This can be a problem for ONFi devices.  The nand_scan_ident()
iterates over maxchips, and calls nand_reset() for each chip.
Now, this driver implements ->setup_data_interface() method, so
nand_setup_data_interface() issues Set Features (0xEF) command to
each chip.  This can cause time-out error since denali_nand_reset()
did not check the chip existence.  If no chip there, the controller
will wait long for R/B# response, which never happens.  (The timeout
error is correctly handled in this driver, so the driver will be
successfully probed anyway, but it will take longer than needed.)

The Reset (0xFF) command also toggles the R/B# pin, and it sets
INTR__INT_ACT bit.  The driver should check this bit to see if the
chip has responded, then it can update denali->max_banks.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 52 +++++++++++++++++++++--------------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 2d25b2f..ef28411 100644
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
@@ -963,7 +936,28 @@ static int denali_setup_data_interface(struct mtd_info *mtd,
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
 	if (!denali->revision)
@@ -979,7 +973,7 @@ static void denali_hw_init(struct denali_nand_info *denali)
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

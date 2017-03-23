Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqT6-0004Zy-Ak
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:14 +0000
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
Subject: [RESEND PATCH v2 44/53] mtd: nand: denali: use interrupt instead of
 polling for bank reset
Date: Thu, 23 Mar 2017 09:17:53 +0900
Message-Id: <1490228282-10805-18-git-send-email-yamada.masahiro@socionext.com>
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

The current bank reset implementation polls the INTR_STATUS register
until interested bits are set.  This is not good because:

- it simply wastes time-slice of the thread which the driver module
  is loaded from.

- The while() loop may continue eternally if no bit is set, for
  example, due to the controller problem.  The denali_wait_for_irq()
  uses wait_for_completion_timeout(), which is safer.

We can use interrupt by moving the denali_reset_bank() call below
the interrupt setup.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ef28411..7609ad6 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -938,24 +938,25 @@ static int denali_setup_data_interface(struct mtd_info *mtd,
 
 static void denali_reset_banks(struct denali_nand_info *denali)
 {
+	u32 irq_status;
 	int i;
 
-	denali_clear_irq_all(denali);
-
 	for (i = 0; i < denali->max_banks; i++) {
-		iowrite32(1 << i, denali->flash_reg + DEVICE_RESET);
-		while (!(ioread32(denali->flash_reg + INTR_STATUS(i)) &
-			(INTR__RST_COMP | INTR__TIME_OUT)))
-			cpu_relax();
-		if (!(ioread32(denali->flash_reg + INTR_STATUS(i)) &
-		      INTR__INT_ACT))
+		denali->flash_bank = i;
+
+		denali_reset_irq(denali);
+
+		iowrite32(DEVICE_RESET__BANK(i),
+			  denali->flash_reg + DEVICE_RESET);
+
+		irq_status = denali_wait_for_irq(denali,
+			INTR__RST_COMP | INTR__INT_ACT | INTR__TIME_OUT);
+		if (!(irq_status & INTR__INT_ACT))
 			break;
 	}
 
 	dev_dbg(denali->dev, "%d chips connected\n", i);
 	denali->max_banks = i;
-
-	denali_clear_irq_all(denali);
 }
 
 static void denali_hw_init(struct denali_nand_info *denali)
@@ -973,7 +974,6 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	denali->bbtskipbytes = ioread32(denali->flash_reg +
 						SPARE_AREA_SKIP_BYTES);
 	detect_max_banks(denali);
-	denali_reset_banks(denali);
 	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
 	iowrite32(CHIP_EN_DONT_CARE__FLAG,
 			denali->flash_reg + CHIP_ENABLE_DONT_CARE);
@@ -1097,9 +1097,6 @@ static void denali_drv_init(struct denali_nand_info *denali)
 	 * element that might be access shared data (interrupt status)
 	 */
 	spin_lock_init(&denali->irq_lock);
-
-	/* indicate that MTD has not selected a valid bank yet */
-	denali->flash_bank = CHIP_SELECT_INVALID;
 }
 
 static int denali_multidev_fixup(struct denali_nand_info *denali)
@@ -1174,6 +1171,9 @@ int denali_init(struct denali_nand_info *denali)
 	}
 
 	denali_enable_irq(denali);
+	denali_reset_banks(denali);
+
+	denali->flash_bank = CHIP_SELECT_INVALID;
 
 	nand_set_flash_node(chip, denali->dev->of_node);
 
-- 
2.7.4

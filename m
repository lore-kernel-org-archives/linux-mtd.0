Received: from conuserg-07.nifty.com ([210.131.2.74])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctTsr-0002Le-48
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 06:48:41 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 27/37] mtd: nand: denali: use interrupt instead of polling
 for bank reset
Date: Thu, 30 Mar 2017 15:46:13 +0900
Message-Id: <1490856383-31560-28-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
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

Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index e4f2699..9dfed20 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -974,24 +974,25 @@ static int denali_setup_data_interface(struct mtd_info *mtd,
 
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
@@ -1013,7 +1014,6 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	denali->bbtskipbytes = ioread32(denali->flash_reg +
 						SPARE_AREA_SKIP_BYTES);
 	detect_max_banks(denali);
-	denali_reset_banks(denali);
 	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
 	iowrite32(CHIP_EN_DONT_CARE__FLAG,
 			denali->flash_reg + CHIP_ENABLE_DONT_CARE);
@@ -1137,9 +1137,6 @@ static void denali_drv_init(struct denali_nand_info *denali)
 	 * element that might be access shared data (interrupt status)
 	 */
 	spin_lock_init(&denali->irq_lock);
-
-	/* indicate that MTD has not selected a valid bank yet */
-	denali->flash_bank = CHIP_SELECT_INVALID;
 }
 
 static int denali_multidev_fixup(struct denali_nand_info *denali)
@@ -1214,6 +1211,9 @@ int denali_init(struct denali_nand_info *denali)
 	}
 
 	denali_enable_irq(denali);
+	denali_reset_banks(denali);
+
+	denali->flash_bank = CHIP_SELECT_INVALID;
 
 	nand_set_flash_node(chip, denali->dev->of_node);
 	/* Fallback to the default name if DT did not give "label" property */
-- 
2.7.4

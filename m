Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyBCf-00049e-UW
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 07:29:20 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/2] mtd: rawnand: denali: remove denali_reset_banks()
Date: Fri,  7 Sep 2018 16:28:29 +0900
Message-Id: <1536305309-28026-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1536305309-28026-1-git-send-email-yamada.masahiro@socionext.com>
References: <1536305309-28026-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In nand_scan_ident(), the controller driver resets every NAND chip.
This is done by sending NAND_CMD_RESET.  The Denali IP provides
another way to do the equivalent thing; if a bit is set in the
DEVICE_RESET register, the controller sends the RESET command to
the corresponding device.  denali_reset_banks() uses it to reset
all devices beforehand.

This redundant reset sequence was needed to know the actual number
of chips before calling nand_scan_ident(); if DEVICE_RESET fails,
there is no chip in that chip select.  Then, denali_reset_banks()
sets denali->max_banks to the number of detected chips.

As commit f486287d2372 ("mtd: nand: denali: fix bank reset function
to detect the number of chips") explained, nand_scan_ident() issued
Set Features (0xEF) command to all CS lines, some of which may not be
connected with a chip. Then, the driver would wait for R/B# response,
which never happens.

This problem was solved by commit 107b7d6a7ad4 ("mtd: rawnand: avoid
setting again the timings to mode 0 after a reset").  In the current
code, nand_setup_data_interface() is called from nand_scan_tail(),
which is invoked after the chip detection.

Now, we can really remove the redundant denali_nand_banks() by simply
passing the maximum number of chip selects supported by this IP
(typically 4 or 8) to nand_scan().  Let's leave all the chip detection
process to nand_scan_ident().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index f069184..d1ae968 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1040,29 +1040,6 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 	return 0;
 }
 
-static void denali_reset_banks(struct denali_nand_info *denali)
-{
-	u32 irq_status;
-	int i;
-
-	for (i = 0; i < denali->max_banks; i++) {
-		denali->active_bank = i;
-
-		denali_reset_irq(denali);
-
-		iowrite32(DEVICE_RESET__BANK(i),
-			  denali->reg + DEVICE_RESET);
-
-		irq_status = denali_wait_for_irq(denali,
-			INTR__RST_COMP | INTR__INT_ACT | INTR__TIME_OUT);
-		if (!(irq_status & INTR__INT_ACT))
-			break;
-	}
-
-	dev_dbg(denali->dev, "%d chips connected\n", i);
-	denali->max_banks = i;
-}
-
 static void denali_hw_init(struct denali_nand_info *denali)
 {
 	/*
@@ -1311,12 +1288,6 @@ int denali_init(struct denali_nand_info *denali)
 	}
 
 	denali_enable_irq(denali);
-	denali_reset_banks(denali);
-	if (!denali->max_banks) {
-		/* Error out earlier if no chip is found for some reasons. */
-		ret = -ENODEV;
-		goto disable_irq;
-	}
 
 	denali->active_bank = DENALI_INVALID_BANK;
 
-- 
2.7.4

Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKe0t-0005xH-R4
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 05:05:17 +0000
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
Subject: [PATCH v6 02/18] mtd: nand: denali: remove unneeded find_valid_banks()
Date: Tue, 13 Jun 2017 14:03:54 +0900
Message-Id: <1497330250-17348-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1497330250-17348-1-git-send-email-yamada.masahiro@socionext.com>
References: <1497330250-17348-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function find_valid_banks() issues the Read ID (0x90) command,
then compares the first byte (Manufacturer ID) of each bank with
the one of bank0.

This is equivalent to what nand_scan_ident() does.  The number of
chips is detected there, so this is unneeded.

What is worse for find_valid_banks() is that, if multiple chips are
connected to INTEL_CE4100 platform, it crashes the kernel by BUG().
This is what we should avoid.  This function is just harmful and
unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 47 -----------------------------------------------
 drivers/mtd/nand/denali.h |  1 -
 2 files changed, 48 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 7133a33b4ad3..122df4c6126d 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -338,51 +338,6 @@ static void get_samsung_nand_para(struct denali_nand_info *denali,
 }
 
 /*
- * determines how many NAND chips are connected to the controller. Note for
- * Intel CE4100 devices we don't support more than one device.
- */
-static void find_valid_banks(struct denali_nand_info *denali)
-{
-	uint32_t id[denali->max_banks];
-	int i;
-
-	denali->total_used_banks = 1;
-	for (i = 0; i < denali->max_banks; i++) {
-		index_addr(denali, MODE_11 | (i << 24) | 0, 0x90);
-		index_addr(denali, MODE_11 | (i << 24) | 1, 0);
-		index_addr_read_data(denali, MODE_11 | (i << 24) | 2, &id[i]);
-
-		dev_dbg(denali->dev,
-			"Return 1st ID for bank[%d]: %x\n", i, id[i]);
-
-		if (i == 0) {
-			if (!(id[i] & 0x0ff))
-				break; /* WTF? */
-		} else {
-			if ((id[i] & 0x0ff) == (id[0] & 0x0ff))
-				denali->total_used_banks++;
-			else
-				break;
-		}
-	}
-
-	if (denali->platform == INTEL_CE4100) {
-		/*
-		 * Platform limitations of the CE4100 device limit
-		 * users to a single chip solution for NAND.
-		 * Multichip support is not enabled.
-		 */
-		if (denali->total_used_banks != 1) {
-			dev_err(denali->dev,
-				"Sorry, Intel CE4100 only supports a single NAND device.\n");
-			BUG();
-		}
-	}
-	dev_dbg(denali->dev,
-		"denali->total_used_banks: %d\n", denali->total_used_banks);
-}
-
-/*
  * Use the configuration feature register to determine the maximum number of
  * banks that the hardware supports.
  */
@@ -439,8 +394,6 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 			ioread32(denali->flash_reg + RDWR_EN_HI_CNT),
 			ioread32(denali->flash_reg + CS_SETUP_CNT));
 
-	find_valid_banks(denali);
-
 	/*
 	 * If the user specified to override the default timings
 	 * with a specific ONFI mode, we apply those changes here.
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 352d8328b94a..0e4a8965f6f1 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -326,7 +326,6 @@ struct denali_nand_info {
 	int platform;
 	struct nand_buf buf;
 	struct device *dev;
-	int total_used_banks;
 	int page;
 	void __iomem *flash_reg;	/* Register Interface */
 	void __iomem *flash_mem;	/* Host Data/Command Interface */
-- 
2.7.4

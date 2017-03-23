Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqT6-0004Zr-Ad
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:15 +0000
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
Subject: [RESEND PATCH v2 29/53] mtd: nand: denali: remove Toshiba and Hynix
 specific fixup code
Date: Thu, 23 Mar 2017 09:17:38 +0900
Message-Id: <1490228282-10805-3-git-send-email-yamada.masahiro@socionext.com>
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

The Denali IP can automatically detect device parameters such as
page size, oob size, device width, etc. and this driver currently
relies on it.  However, this hardware function is problematic.

[1] Due to a hardware bug, various misdetected cases are known.
    That is why get_toshiba_nand_para() and get_hynix_nand_para()
    exist to fix-up the misdetected parameters.  It is not realistic
    to add a new NAND device to the *black list* every time we are
    hit by a misdetected case.  We would never be able to guarantee
    that all cases are covered.

[2] Because this feature is unreliable, it is disabled on some
    platforms.

The nand_scan_ident() detects device parameters in a more tested
way.  The hardware should not set the device parameter registers in
a different, unreliable way.  Instead, set the parameters from the
nand_scan_ident() back to the registers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mtd/nand/denali.c | 40 ++++++----------------------------------
 1 file changed, 6 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 70e9f06..fba1908 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -338,36 +338,6 @@ static void get_samsung_nand_para(struct denali_nand_info *denali,
 	}
 }
 
-static void get_toshiba_nand_para(struct denali_nand_info *denali)
-{
-	/*
-	 * Workaround to fix a controller bug which reports a wrong
-	 * spare area size for some kind of Toshiba NAND device
-	 */
-	if ((ioread32(denali->flash_reg + DEVICE_MAIN_AREA_SIZE) == 4096) &&
-		(ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE) == 64))
-		iowrite32(216, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
-}
-
-static void get_hynix_nand_para(struct denali_nand_info *denali,
-							uint8_t device_id)
-{
-	switch (device_id) {
-	case 0xD5: /* Hynix H27UAG8T2A, H27UBG8U5A or H27UCG8VFA */
-	case 0xD7: /* Hynix H27UDG8VEM, H27UCG8UDM or H27UCG8V5A */
-		iowrite32(128, denali->flash_reg + PAGES_PER_BLOCK);
-		iowrite32(4096, denali->flash_reg + DEVICE_MAIN_AREA_SIZE);
-		iowrite32(224, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
-		iowrite32(0, denali->flash_reg + DEVICE_WIDTH);
-		break;
-	default:
-		dev_warn(denali->dev,
-			 "Unknown Hynix NAND (Device ID: 0x%x).\n"
-			 "Will use default parameter values instead.\n",
-			 device_id);
-	}
-}
-
 /*
  * determines how many NAND chips are connected to the controller. Note for
  * Intel CE4100 devices we don't support more than one device.
@@ -454,10 +424,6 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 			return FAIL;
 	} else if (maf_id == 0xEC) { /* Samsung NAND */
 		get_samsung_nand_para(denali, device_id);
-	} else if (maf_id == 0x98) { /* Toshiba NAND */
-		get_toshiba_nand_para(denali);
-	} else if (maf_id == 0xAD) { /* Hynix NAND */
-		get_hynix_nand_para(denali, device_id);
 	}
 
 	dev_info(denali->dev,
@@ -1649,6 +1615,12 @@ int denali_init(struct denali_nand_info *denali)
 						chip->ecc.strength);
 
 	iowrite32(chip->ecc.strength, denali->flash_reg + ECC_CORRECTION);
+	iowrite32(mtd->erasesize / mtd->writesize,
+		  denali->flash_reg + PAGES_PER_BLOCK);
+	iowrite32(denali->nand.options & NAND_BUSWIDTH_16 ? 1 : 0,
+		  denali->flash_reg + DEVICE_WIDTH);
+	iowrite32(mtd->writesize, denali->flash_reg + DEVICE_MAIN_AREA_SIZE);
+	iowrite32(mtd->oobsize, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
 
 	iowrite32(chip->ecc.size, denali->flash_reg + CFG_DATA_BLOCK_SIZE);
 	iowrite32(chip->ecc.size, denali->flash_reg + CFG_LAST_DATA_BLOCK_SIZE);
-- 
2.7.4

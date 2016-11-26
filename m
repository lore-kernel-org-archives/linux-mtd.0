Received: from conuserg-11.nifty.com ([210.131.2.78])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhOJ-000264-MG
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:08:01 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 38/39] mtd: nand: denali: remove Toshiba,
 Hynix specific fixup code
Date: Sun, 27 Nov 2016 03:06:24 +0900
Message-Id: <1480183585-592-39-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Denali IP can automatically detect device parameters such as
page size, device width, etc. and this driver currently relies on it.
However, this hardware function is problematic.

[1] Due to a hardware bug, various misdetected cases are known.
    That is why get_toshiba_nand_para(), get_hynix_nand_para() exist
    to fix the misdetected parameters.  It is not realistic to add a
    new NAND device to the *black list* every time we are hit by a
    misdetected case.  We would never be able to guarantee that all
    the cases are covered.

[2] Because this feature is unreliable, it is disabled on some
    platforms.

The nand_scan_ident() sets device parameters such as mtd->writesize,
mtd->erasesize, etc. in a more tested way.  We should not set the
hardware registers in a different, unreliable way.  Instead, set
the parameters from nand_scan_ident() back to the registers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 39 ++++++---------------------------------
 1 file changed, 6 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index df174ca..1aa19ec 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -338,35 +338,6 @@ static void get_samsung_nand_para(struct denali_nand_info *denali, u8 device_id)
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
-static void get_hynix_nand_para(struct denali_nand_info *denali, u8 device_id)
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
@@ -468,10 +439,6 @@ static u16 denali_nand_timing_set(struct denali_nand_info *denali)
 			return FAIL;
 	} else if (maf_id == 0xEC) { /* Samsung NAND */
 		get_samsung_nand_para(denali, device_id);
-	} else if (maf_id == 0x98) { /* Toshiba NAND */
-		get_toshiba_nand_para(denali);
-	} else if (maf_id == 0xAD) { /* Hynix NAND */
-		get_hynix_nand_para(denali, device_id);
 	}
 
 	dev_info(denali->dev,
@@ -1661,6 +1628,12 @@ int denali_init(struct denali_nand_info *denali)
 						chip->ecc.strength);
 
 	iowrite32(chip->ecc.strength, denali->flash_reg + ECC_CORRECTION);
+	iowrite32(mtd->erasesize / mtd->writesize,
+		  denali->flash_reg + PAGES_PER_BLOCK);
+	iowrite32(denali->nand.options & NAND_BUSWIDTH_16 ? 1 : 0,
+		  denali->flash_reg + DEVICE_WIDTH);
+	iowrite32(mtd->writesize, denali->flash_reg + DEVICE_MAIN_AREA_SIZE);
+	iowrite32(mtd->oobsize, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
 
 	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
 
-- 
2.7.4

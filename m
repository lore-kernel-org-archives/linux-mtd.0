Received: from mail-pa0-f48.google.com ([209.85.220.48])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V21QO-000843-RY
 for linux-mtd@lists.infradead.org; Wed, 24 Jul 2013 15:56:25 +0000
Received: by mail-pa0-f48.google.com with SMTP id kp1so816686pab.21
 for <linux-mtd@lists.infradead.org>; Wed, 24 Jul 2013 08:56:03 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] mtd: nand: omap2: Fix compilation warning
Date: Wed, 24 Jul 2013 08:56:32 -0700
Message-Id: <1374681392-6183-1-git-send-email-olof@lixom.net>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, Olof Johansson <olof@lixom.net>,
 linux-omap@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fb1585bc13b (mtd: nand: omap2: clean-up BCHx_HW and BCHx_SW ECC
configurations in device_probe) introduced a warning when the new option
is disabled, i.e. with omap2plus_defconfig:

drivers/mtd/nand/omap2.c:1075:13: warning: 'omap3_enable_hwecc_bch' defined but not used [-Wunused-function]

Fix this by rescoping the ifdef. Also remove a redudant #endif/#ifdef
pair.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 drivers/mtd/nand/omap2.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index c4c7e0d..cbf8b28 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1060,6 +1060,7 @@ static int omap_dev_ready(struct mtd_info *mtd)
 	}
 }
 
+#ifdef CONFIG_MTD_NAND_OMAP_BCH
 /**
  * omap3_enable_hwecc_bch - Program OMAP3 GPMC to perform BCH ECC correction
  * @mtd: MTD device structure
@@ -1141,7 +1142,6 @@ static void omap3_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 	writel(ECCCLEAR | ECC1, info->reg.gpmc_ecc_control);
 }
 
-#ifdef CONFIG_MTD_NAND_ECC_BCH
 /**
  * omap3_calculate_ecc_bch4 - Generate 7 bytes of ECC bytes
  * @mtd: MTD device structure
@@ -1959,8 +1959,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 		omap_oobinfo.oobfree->offset	= omap_oobinfo.eccpos[0] +
 							omap_oobinfo.eccbytes;
 		goto custom_ecc_layout;
-#endif
-#ifdef CONFIG_MTD_NAND_ECC_BCH
+
 	case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
 		pr_info("using OMAP_ECC_BCH8_CODE_HW_DETECTION_SW ECC\n");
 		info->nand.ecc.mode		= NAND_ECC_HW;
-- 
1.7.10.4

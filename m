Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHG8T-0007MY-0g
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 19:22:13 +0000
Received: by mail-pa0-x232.google.com with SMTP id uo6so247440858pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2016 11:21:52 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: linuxppc-dev@lists.ozlabs.org, Brian Norris <computersforpeace@gmail.com>,
 Scott Wood <scottwood@freescale.com>
Subject: [PATCH] mtd: nand: add FSL_SOC dependency to drivers using FSL_LBC
Date: Thu,  7 Jan 2016 11:21:41 -0800
Message-Id: <1452194501-115280-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've managed to construct .config files (for ppc64) that come across
this Kconfig warning:

  warning: (MPC836x_RDK && MTD_NAND_FSL_ELBC && MTD_NAND_FSL_UPM) selects FSL_LBC which has unmet direct dependencies (FSL_SOC)

Let's add the FSL_SOC dependency to the NAND drivers. AFAICT, they are
only supported on PPC32 FSL SoCs anyway.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 289664089cf3..13bbceec6b5f 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -427,6 +427,7 @@ config MTD_NAND_ORION
 config MTD_NAND_FSL_ELBC
 	tristate "NAND support for Freescale eLBC controllers"
 	depends on PPC
+	depends on FSL_SOC
 	select FSL_LBC
 	help
 	  Various Freescale chips, including the 8313, include a NAND Flash
@@ -448,6 +449,7 @@ config MTD_NAND_FSL_IFC
 config MTD_NAND_FSL_UPM
 	tristate "Support for NAND on Freescale UPM"
 	depends on PPC_83xx || PPC_85xx
+	depends on FSL_SOC
 	select FSL_LBC
 	help
 	  Enables support for NAND Flash chips wired onto Freescale PowerPC
-- 
2.6.0.rc2.230.g3dd15c0

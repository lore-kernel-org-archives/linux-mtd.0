Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TUK04-0003l0-Qd
 for linux-mtd@lists.infradead.org; Fri, 02 Nov 2012 16:21:41 +0000
From: Murali Karicheri <m-karicheri2@ti.com>
To: <dwmw2@infradead.org>, <artem.bityutskiy@linux.intel.com>,
 <b32955@freescale.com>, <shubhrajyoti@ti.com>, <wim@iguana.be>,
 <hs@denx.de>, <nsekhar@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <grant.likely@secretlab.ca>,
 <rob.herring@calxeda.com>, <rob@landley.net>,
 <gregkh@linuxfoundation.org>, <swarren@wwwdotorg.org>,
 <hdoyu@nvidia.com>, <santosh.shilimkar@ti.com>,
 <devicetree-discuss@lists.ozlabs.org>, <linux-doc@vger.kernel.org>,
 <davinci-linux-open-source@linux.davincidsp.com>
Subject: =?UTF-8?q?=5BRFC=20PATCH=202/2=5D=20mtd=3A=20davinci=20-=20remove=20DaVinci=20architecture=20depedency?=
Date: Fri, 2 Nov 2012 12:21:18 -0400
Message-ID: <1351873278-27325-3-git-send-email-m-karicheri2@ti.com>
In-Reply-To: <1351873278-27325-1-git-send-email-m-karicheri2@ti.com>
References: <1351873278-27325-1-git-send-email-m-karicheri2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Murali Karicheri <m-karicheri2@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DaVinci NAND driver is a controller driver based on the AEMIF hardware
IP found on TI SoCs. It is also used on SoCs that are not DaVinci based. This
patch removes the driver dependency on DaVinci architecture so that it
can be used on other architectures such as c6x, keystone etc.

Also migrate the driver to use the new AEMIF platform driver API.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 drivers/mtd/nand/Kconfig                   |    6 +-
 drivers/mtd/nand/davinci_nand.c            |   40 ++++++-------
 include/linux/platform_data/davinci-nand.h |   87 ++++++++++++++++++++++++++++
 3 files changed, 107 insertions(+), 26 deletions(-)
 create mode 100644 include/linux/platform_data/davinci-nand.h

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 8ca4176..390cc95 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -569,11 +569,11 @@ config MTD_NAND_SH_FLCTL
 	  for NAND Flash using FLCTL.
 
 config MTD_NAND_DAVINCI
-        tristate "Support NAND on DaVinci SoC"
-        depends on ARCH_DAVINCI
+        tristate "Support NAND on SoCs with AEMIF"
+	select TI_DAVINCI_AEMIF
         help
 	  Enable the driver for NAND flash chips on Texas Instruments
-	  DaVinci processors.
+	  SoCs that has Asynchronous External Memory Interface (AEMIF).
 
 config MTD_NAND_TXX9NDFMC
 	tristate "NAND Flash support for TXx9 SoC"
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 321b053..306959e 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -35,8 +35,8 @@
 #include <linux/slab.h>
 #include <linux/of_device.h>
 
-#include <mach/nand.h>
-#include <mach/aemif.h>
+#include <linux/platform_data/davinci-nand.h>
+#include <linux/platform_data/davinci-aemif.h>
 
 /*
  * This is a device driver for the NAND flash controller found on the
@@ -73,7 +73,7 @@ struct davinci_nand_info {
 
 	uint32_t		core_chipsel;
 
-	struct davinci_aemif_timing	*timing;
+	struct davinci_aemif_cs_data	*cs_data;
 };
 
 static DEFINE_SPINLOCK(davinci_nand_lock);
@@ -652,7 +652,6 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 	info->chip.options	= pdata->options;
 	info->chip.bbt_td	= pdata->bbt_td;
 	info->chip.bbt_md	= pdata->bbt_md;
-	info->timing		= pdata->timing;
 
 	info->ioaddr		= (uint32_t __force) vaddr;
 
@@ -731,26 +730,21 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 		goto err_clk_enable;
 	}
 
-	/*
-	 * Setup Async configuration register in case we did not boot from
-	 * NAND and so bootloader did not bother to set it up.
-	 */
-	val = davinci_nand_readl(info, A1CR_OFFSET + info->core_chipsel * 4);
-
-	/* Extended Wait is not valid and Select Strobe mode is not used */
-	val &= ~(ACR_ASIZE_MASK | ACR_EW_MASK | ACR_SS_MASK);
-	if (info->chip.options & NAND_BUSWIDTH_16)
-		val |= 0x1;
+	if (info->chip.options & NAND_BUSWIDTH_16) {
+		info->cs_data =
+			davinci_aemif_get_abus_params(info->core_chipsel);
+		if (info->cs_data == NULL)
+			goto err_bus_config;
 
-	davinci_nand_writel(info, A1CR_OFFSET + info->core_chipsel * 4, val);
+		/* asize = 1 for 16bit bus */
+		info->cs_data->asize = 1;
+		ret = davinci_aemif_set_abus_params(info->core_chipsel,
+						info->cs_data);
 
-	ret = 0;
-	if (info->timing)
-		ret = davinci_aemif_setup_timing(info->timing, info->base,
-							info->core_chipsel);
-	if (ret < 0) {
-		dev_dbg(&pdev->dev, "NAND timing values setup fail\n");
-		goto err_timing;
+		if (ret < 0) {
+			dev_dbg(&pdev->dev, "NAND timing values setup fail\n");
+			goto err_bus_config;
+		}
 	}
 
 	spin_lock_irq(&davinci_nand_lock);
@@ -841,7 +835,7 @@ syndrome_done:
 	return 0;
 
 err_scan:
-err_timing:
+err_bus_config:
 	clk_disable_unprepare(info->clk);
 
 err_clk_enable:
diff --git a/include/linux/platform_data/davinci-nand.h b/include/linux/platform_data/davinci-nand.h
new file mode 100644
index 0000000..df1fc66
--- /dev/null
+++ b/include/linux/platform_data/davinci-nand.h
@@ -0,0 +1,87 @@
+/*
+ * mach-davinci/nand.h
+ *
+ * Copyright © 2006 Texas Instruments.
+ *
+ * Ported to 2.6.23 Copyright © 2008 by
+ *   Sander Huijsen <Shuijsen@optelecom-nkf.com>
+ *   Troy Kisky <troy.kisky@boundarydevices.com>
+ *   Dirk Behme <Dirk.Behme@gmail.com>
+ *
+ * --------------------------------------------------------------------------
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#ifndef __ARCH_ARM_DAVINCI_NAND_H
+#define __ARCH_ARM_DAVINCI_NAND_H
+
+#include <linux/mtd/nand.h>
+
+#define NANDFCR_OFFSET		0x60
+#define NANDFSR_OFFSET		0x64
+#define NANDF1ECC_OFFSET	0x70
+
+/* 4-bit ECC syndrome registers */
+#define NAND_4BIT_ECC_LOAD_OFFSET	0xbc
+#define NAND_4BIT_ECC1_OFFSET		0xc0
+#define NAND_4BIT_ECC2_OFFSET		0xc4
+#define NAND_4BIT_ECC3_OFFSET		0xc8
+#define NAND_4BIT_ECC4_OFFSET		0xcc
+#define NAND_ERR_ADD1_OFFSET		0xd0
+#define NAND_ERR_ADD2_OFFSET		0xd4
+#define NAND_ERR_ERRVAL1_OFFSET		0xd8
+#define NAND_ERR_ERRVAL2_OFFSET		0xdc
+
+/* NOTE:  boards don't need to use these address bits
+ * for ALE/CLE unless they support booting from NAND.
+ * They're used unless platform data overrides them.
+ */
+#define	MASK_ALE		0x08
+#define	MASK_CLE		0x10
+
+struct davinci_nand_pdata {		/* platform_data */
+	uint32_t		mask_ale;
+	uint32_t		mask_cle;
+
+	/* for packages using two chipselects */
+	uint32_t		mask_chipsel;
+
+	/* board's default static partition info */
+	struct mtd_partition	*parts;
+	unsigned		nr_parts;
+
+	/* none  == NAND_ECC_NONE (strongly *not* advised!!)
+	 * soft  == NAND_ECC_SOFT
+	 * else  == NAND_ECC_HW, according to ecc_bits
+	 *
+	 * All DaVinci-family chips support 1-bit hardware ECC.
+	 * Newer ones also support 4-bit ECC, but are awkward
+	 * using it with large page chips.
+	 */
+	nand_ecc_modes_t	ecc_mode;
+	u8			ecc_bits;
+
+	/* e.g. NAND_BUSWIDTH_16 */
+	unsigned		options;
+	/* e.g. NAND_BBT_USE_FLASH */
+	unsigned		bbt_options;
+
+	/* Main and mirror bbt descriptor overrides */
+	struct nand_bbt_descr	*bbt_td;
+	struct nand_bbt_descr	*bbt_md;
+};
+
+#endif	/* __ARCH_ARM_DAVINCI_NAND_H */
-- 
1.7.9.5

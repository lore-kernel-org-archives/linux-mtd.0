Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSRgg-0002ZT-Bu
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 10:33:07 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so1814016wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 03:33:06 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?q?=5BPATCHv2=203/6=5D=20nand/denali=3A=20allow=20the=20number=20of=20ECC=20bits=20to=20be=20set=20by=20pdata?=
Date: Fri,  3 Jun 2011 11:32:46 +0100
Message-Id: <1307097169-11744-4-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
References: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Jamie Iles <jamie@jamieiles.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rather than having the number of ECC bits to be used set by a
preprocessor definition, allow it to be set by platform_data.  If there
is no platform_data then default to 8 bit ECC.

Changes since v1: fixup compile error introduced from a bad rebase.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c            |   24 ++++++++++++------------
 drivers/mtd/nand/denali.h            |    1 +
 include/linux/platform_data/denali.h |   21 +++++++++++++++++++++
 3 files changed, 34 insertions(+), 12 deletions(-)
 create mode 100644 include/linux/platform_data/denali.h

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 491458a..5557d7b 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -26,6 +26,7 @@
 #include <linux/pci.h>
 #include <linux/mtd/mtd.h>
 #include <linux/module.h>
+#include <linux/platform_data/denali.h>
 
 #include "denali.h"
 
@@ -60,8 +61,6 @@ MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting."
  * valid or not */
 #define CHIP_SELECT_INVALID	-1
 
-#define SUPPORT_8BITECC		1
-
 /* This macro divides two integers and rounds fractional values up
  * to the nearest integer value. */
 #define CEIL_DIV(X, Y) (((X)%(Y)) ? ((X)/(Y)+1) : ((X)/(Y)))
@@ -357,11 +356,8 @@ static void get_toshiba_nand_para(struct denali_nand_info *denali)
 			ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
 		iowrite32(tmp,
 				denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);
-#if SUPPORT_15BITECC
-		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
-#elif SUPPORT_8BITECC
-		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
-#endif
+		iowrite32(denali->nr_ecc_bits,
+			  denali->flash_reg + ECC_CORRECTION);
 	}
 }
 
@@ -385,11 +381,8 @@ static void get_hynix_nand_para(struct denali_nand_info *denali,
 		iowrite32(spare_size,
 				denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);
 		iowrite32(0, denali->flash_reg + DEVICE_WIDTH);
-#if SUPPORT_15BITECC
-		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
-#elif SUPPORT_8BITECC
-		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
-#endif
+		iowrite32(denali->nr_ecc_bits,
+			  denali->flash_reg + ECC_CORRECTION);
 		break;
 	default:
 		dev_warn(denali->dev,
@@ -1414,6 +1407,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	resource_size_t csr_base, mem_base;
 	unsigned long csr_len, mem_len;
 	struct denali_nand_info *denali;
+	struct denali_nand_pdata *pdata;
 
 	denali = kzalloc(sizeof(*denali), GFP_KERNEL);
 	if (!denali)
@@ -1421,6 +1415,12 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	denali->dev = &dev->dev;
 
+	pdata = dev_get_platdata(denali->dev);
+	if (pdata && pdata->nr_ecc_bits > 8)
+		denali->nr_ecc_bits = pdata->nr_ecc_bits;
+	else
+		denali->nr_ecc_bits = 8;
+
 	ret = pci_enable_device(dev);
 	if (ret) {
 		dev_err(denali->dev, "Spectra: pci_enable_device failed.\n");
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index fabb9d5..b428ce3 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -494,6 +494,7 @@ struct denali_nand_info {
 	uint32_t blksperchip;
 	uint32_t bbtskipbytes;
 	uint32_t max_banks;
+	int nr_ecc_bits;
 };
 
 #endif /*_LLD_NAND_*/
diff --git a/include/linux/platform_data/denali.h b/include/linux/platform_data/denali.h
new file mode 100644
index 0000000..cfdb775
--- /dev/null
+++ b/include/linux/platform_data/denali.h
@@ -0,0 +1,21 @@
+/*
+ * NAND flash controller device driver platform data.
+ * Copyright © 2011, Picochip
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ */
+#ifndef __DENALI_PDATA_H__
+#define __DENALI_PDATA_H__
+
+struct denali_nand_pdata {
+	int	nr_ecc_bits;
+};
+
+#endif /* __DENALI_PDATA_H__ */
-- 
1.7.4.1

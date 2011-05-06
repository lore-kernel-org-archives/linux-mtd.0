Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIM2Q-0008O9-KK
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:29:51 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so2593287wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 07:29:50 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?q?=5BRFC=20PATCH=208/9=5D=20nand/denali=3A=20allow=20the=20number=20of=20ECC=20bits=20to=20be=20set=20by=20pdata?=
Date: Fri,  6 May 2011 15:29:02 +0100
Message-Id: <1304692143-22432-9-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org,
	chuanxiao.dong@intel.com
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

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c            |   23 +++++++++++------------
 drivers/mtd/nand/denali.h            |    1 +
 include/linux/platform_data/denali.h |   21 +++++++++++++++++++++
 3 files changed, 33 insertions(+), 12 deletions(-)
 create mode 100644 include/linux/platform_data/denali.h

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index ce6afd7..c79009f 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include <linux/module.h>
+#include <linux/platform_data/denali.h>
 
 #include "denali.h"
 
@@ -58,8 +59,6 @@ MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting."
  * valid or not */
 #define CHIP_SELECT_INVALID	-1
 
-#define SUPPORT_8BITECC		1
-
 /* This macro divides two integers and rounds fractional values up
  * to the nearest integer value. */
 #define CEIL_DIV(X, Y) (((X)%(Y)) ? ((X)/(Y)+1) : ((X)/(Y)))
@@ -348,11 +347,8 @@ static void get_toshiba_nand_para(struct denali_nand_info *denali)
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
 
@@ -376,11 +372,8 @@ static void get_hynix_nand_para(struct denali_nand_info *denali,
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
@@ -1401,6 +1394,12 @@ void denali_drv_init(struct denali_nand_info *denali)
 int denali_init(struct denali_nand_info *denali)
 {
 	int ret;
+	struct denali_nand_pdata *pdata = dev_get_platdata(denali->dev);
+
+	if (pdata && pdata->nr_ecc_bits > 8)
+		denali->nr_ecc_bits = pdata->nr_ecc_bits;
+	else
+		denali->nr_ecc_bits = 8;
 
 	if (denali->platform == INTEL_CE4100) {
 		/* Due to a silicon limitation, we can only support
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 3f99b7b..30f8553 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -496,6 +496,7 @@ struct denali_nand_info {
 	uint32_t blksperchip;
 	uint32_t bbtskipbytes;
 	uint32_t max_banks;
+	int nr_ecc_bits;
 };
 
 extern int denali_init(struct denali_nand_info *denali);
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
1.7.4.4

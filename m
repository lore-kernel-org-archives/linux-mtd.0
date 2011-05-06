Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIM2U-0008OE-CG
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:29:55 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so2593348wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 07:29:54 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 9/9] nand/denali: support MTD partitioning
Date: Fri,  6 May 2011 15:29:03 +0100
Message-Id: <1304692143-22432-10-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
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

If CONFIG_MTD_PARTITION is enabled then take the partitions from the
platform data.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c            |    8 ++++++++
 include/linux/platform_data/denali.h |    6 +++++-
 2 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index c79009f..ae954de 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -23,6 +23,7 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
 #include <linux/module.h>
 #include <linux/platform_data/denali.h>
 
@@ -1563,7 +1564,14 @@ int denali_init(struct denali_nand_info *denali)
 		goto failed_req_irq;
 	}
 
+#ifdef CONFIG_MTD_PARTITIONS
+	if (pdata && pdata->parts) {
+		ret = add_mtd_partitions(&denali->mtd, pdata->parts,
+					 pdata->nr_parts);
+	} else
+#endif /* CONFIG_MTD_PARTITIONS */
 	ret = add_mtd_device(&denali->mtd);
+
 	if (ret) {
 		dev_err(denali->dev, "failed to register MTD: %d\n", ret);
 		goto failed_req_irq;
diff --git a/include/linux/platform_data/denali.h b/include/linux/platform_data/denali.h
index cfdb775..e9e415b 100644
--- a/include/linux/platform_data/denali.h
+++ b/include/linux/platform_data/denali.h
@@ -14,8 +14,12 @@
 #ifndef __DENALI_PDATA_H__
 #define __DENALI_PDATA_H__
 
+struct mtd_partition;
+
 struct denali_nand_pdata {
-	int	nr_ecc_bits;
+	int				nr_ecc_bits;
+	const struct mtd_partition	*parts;
+	unsigned int			nr_parts;
 };
 
 #endif /* __DENALI_PDATA_H__ */
-- 
1.7.4.4

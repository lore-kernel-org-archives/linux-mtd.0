Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSRRm-0002Bx-H7
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 10:17:44 +0000
Received: by wwi18 with SMTP id 18so5001452wwi.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 03:17:40 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] nand/denali: support MTD partitioning
Date: Fri,  3 Jun 2011 11:17:17 +0100
Message-Id: <1307096238-25751-6-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1307096238-25751-1-git-send-email-jamie@jamieiles.com>
References: <1307096238-25751-1-git-send-email-jamie@jamieiles.com>
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

Allow the platform to specify partitions through platform data.  If
there are no partitions specified then the whole device will be
registered.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c            |    8 +++++++-
 include/linux/platform_data/denali.h |    8 ++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index fb8e49e..19998ed 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -25,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/pci.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
 #include <linux/module.h>
 #include <linux/platform_data/denali.h>
 
@@ -1644,7 +1645,12 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto failed_req_irq;
 	}
 
-	ret = mtd_device_register(&denali->mtd, NULL, 0);
+	if (pdata && pdata->parts)
+		ret = mtd_device_register(&denali->mtd, pdata->parts,
+					 pdata->nr_parts);
+	else
+		ret = mtd_device_register(&denali->mtd, NULL, 0);
+
 	if (ret) {
 		dev_err(denali->dev, "Spectra: Failed to register MTD: %d\n",
 				ret);
diff --git a/include/linux/platform_data/denali.h b/include/linux/platform_data/denali.h
index 3767333..141da35 100644
--- a/include/linux/platform_data/denali.h
+++ b/include/linux/platform_data/denali.h
@@ -14,9 +14,13 @@
 #ifndef __DENALI_PDATA_H__
 #define __DENALI_PDATA_H__
 
+struct mtd_partition;
+
 struct denali_nand_pdata {
-	int	nr_ecc_bits;
-	bool	have_hw_ecc_fixup;
+	int				nr_ecc_bits;
+	bool				have_hw_ecc_fixup;
+	const struct mtd_partition	*parts;
+	unsigned int			nr_parts;
 };
 
 #endif /* __DENALI_PDATA_H__ */
-- 
1.7.4.1

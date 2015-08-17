Received: from mail-bl2on0128.outbound.protection.outlook.com ([65.55.169.128]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRC6S-0007Qc-4R
 for linux-mtd@lists.infradead.org; Mon, 17 Aug 2015 04:32:57 +0000
From: Zhiqiang Hou <B48286@freescale.com>
To: <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>
CC: <zajec5@gmail.com>, <mike@steroidmicros.com>, <Mingkai.Hu@freescale.com>,
 Hou Zhiqiang <B48286@freescale.com>
Subject: [PATCH V6] mtd: m25p80: Modify the name of mtd_info
Date: Mon, 17 Aug 2015 12:27:05 +0800
Message-ID: <1439785625-36183-1-git-send-email-B48286@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hou Zhiqiang <B48286@freescale.com>

Set the mtd_info's name to a fixed one, so spi flash layouts can
be specified by "mtdparts=..." in kernel cmdline, because the
cmdlinepart's parser will match the name of mtd_info with the name
given in cmdline.

So far, if DT is used, the mtd_info's name will be set to the name
of spi->dev. It includes spi_master->bus_num, and the bus_num may
be dynamically allocated. So, replace the component bus_num with
the physical address of spi controller.

Signed-off-by: Hou Zhiqiang <B48286@freescale.com>
---
V6:
	Removed the sentence return error number when allocating the
	mtd_info's name failed.
V5:
	Rebase this patch on the latest l2-mtd tree.
V4:
	add check no-NULL for pointer of master's device node, and if it failed
	to get physcial address of the master, then name the mtd_info by the
	name of spi->dev.
V3:
	Fix a bug, matching unsigned long long with "%llx".
V2:
	1. Fix some code style issue.
	2. Cast physical address to unsigned long long.

 drivers/mtd/devices/m25p80.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index d313f948b..35d11c3 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -26,6 +26,7 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
 #include <linux/mtd/spi-nor.h>
+#include <linux/of_address.h>
 
 #define	MAX_CMD_SIZE		6
 struct m25p {
@@ -183,6 +184,8 @@ static int m25p_probe(struct spi_device *spi)
 	struct spi_nor *nor;
 	enum read_mode mode = SPI_NOR_NORMAL;
 	char *flash_name = NULL;
+	struct resource res;
+	struct device_node *mnp = spi->master->dev.of_node;
 	int ret;
 
 	data = dev_get_platdata(&spi->dev);
@@ -215,6 +218,16 @@ static int m25p_probe(struct spi_device *spi)
 
 	if (data && data->name)
 		flash->mtd.name = data->name;
+	else if (mnp) {
+		ret = of_address_to_resource(mnp, 0, &res);
+		if (!ret)
+			flash->mtd.name = kasprintf(GFP_KERNEL, "spi%llx.%d",
+					(unsigned long long)res.start,
+					spi->chip_select);
+		else
+			dev_dbg(&spi->dev,
+				"Failed to get spi master resource\n");
+	}
 
 	/* For some (historical?) reason many platforms provide two different
 	 * names in flash_platform_data: "name" and "type". Quite often name is
-- 
2.1.0.27.g96db324

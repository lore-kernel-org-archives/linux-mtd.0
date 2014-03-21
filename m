Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQxT6-0000p5-Ti
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 11:18:34 +0000
From: Hou Zhiqiang <B48286@freescale.com>
To: <linux-mtd@lists.infradead.org>, <linuxppc-dev@ozlabs.org>
Subject: [PATCH] mtd: m25p80: Modify the name of mtd_info
Date: Fri, 21 Mar 2014 19:16:18 +0800
Message-ID: <1395400578-5637-1-git-send-email-B48286@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: scottwood@freescale.com, mingkai.hu@freescale.com,
 Hou Zhiqiang <B48286@freescale.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To specify spi flash layouts by "mtdparts=..." in cmdline, we must
give mtd_info a fixed name,because the cmdlinepart's parser will
match the name of mtd_info given in cmdline.
Now, if use DT, the mtd_info's name will be spi->dev->name. It
consists of spi_master->bus_num, and the spi_master->bus_num maybe
dynamically fetched. So, in this case, replace the component bus_num
with thei physical address of spi master.

Signed-off-by: Hou Zhiqiang <B48286@freescale.com>
---
 drivers/mtd/devices/m25p80.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 7eda71d..64450a2 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -30,6 +30,7 @@
 #include <linux/mtd/cfi.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 
 #include <linux/spi/spi.h>
@@ -934,9 +935,11 @@ static int m25p_probe(struct spi_device *spi)
 	struct flash_platform_data	*data;
 	struct m25p			*flash;
 	struct flash_info		*info;
-	unsigned			i;
+	unsigned			i, ret;
 	struct mtd_part_parser_data	ppdata;
 	struct device_node *np = spi->dev.of_node;
+	struct resource res;
+	struct device_node *mnp = spi->master->dev.of_node;
 
 	/* Platform data helps sort out which chip type we have, as
 	 * well as how this board partitions it.  If we don't have
@@ -1009,8 +1012,17 @@ static int m25p_probe(struct spi_device *spi)
 
 	if (data && data->name)
 		flash->mtd.name = data->name;
-	else
-		flash->mtd.name = dev_name(&spi->dev);
+	else{
+		ret = of_address_to_resource(mnp, 0, &res);
+		if (ret) {
+			dev_err(&spi->dev, "failed to get spi master resource\n");
+			return ret;
+		}
+		flash->mtd.name = kasprintf(GFP_KERNEL, "spi%x.%d",
+				(unsigned)res.start, spi->chip_select);
+		if (!flash->mtd.name)
+			return -ENOMEM;
+	}
 
 	flash->mtd.type = MTD_NORFLASH;
 	flash->mtd.writesize = 1;
-- 
1.8.5

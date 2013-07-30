Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V458F-0004FJ-2r
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 08:18:13 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQQ00KJBPPDG2P0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 17:17:44 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 29/35] mtd: devices: use dev_get_platdata()
Date: Tue, 30 Jul 2013 17:17:44 +0900
Message-id: <005801ce8cfd$44518210$ccf48630$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the wrapper function for retrieving the platform data instead of
accessing dev->platform_data directly.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/devices/m25p80.c        |    2 +-
 drivers/mtd/devices/mtd_dataflash.c |    2 +-
 drivers/mtd/devices/sst25l.c        |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index af972b2..026bf9b8 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -929,7 +929,7 @@ static int m25p_probe(struct spi_device *spi)
 	 * a chip ID, try the JEDEC id commands; they'll work for most
 	 * newer chips, even if we don't recognize the particular chip.
 	 */
-	data = spi->dev.platform_data;
+	data = dev_get_platdata(&spi->dev);
 	if (data && data->type) {
 		const struct spi_device_id *plat_id;
 
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 4a43664..0e8cbfe 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -622,7 +622,7 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
 	struct dataflash		*priv;
 	struct mtd_info			*device;
 	struct mtd_part_parser_data	ppdata;
-	struct flash_platform_data	*pdata = spi->dev.platform_data;
+	struct flash_platform_data	*pdata = dev_get_platdata(&spi->dev);
 	char				*otp_tag = "";
 	int				err = 0;
 
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 38b5979..a42f1f0 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -372,7 +372,7 @@ static int sst25l_probe(struct spi_device *spi)
 	mutex_init(&flash->lock);
 	spi_set_drvdata(spi, flash);
 
-	data = spi->dev.platform_data;
+	data = dev_get_platdata(&spi->dev);
 	if (data && data->name)
 		flash->mtd.name = data->name;
 	else
-- 
1.7.10.4

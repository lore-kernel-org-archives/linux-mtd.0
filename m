Received: from mail-bn1on0114.outbound.protection.outlook.com
 ([157.56.110.114] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZDTSn-0006JH-Hc
 for linux-mtd@lists.infradead.org; Fri, 10 Jul 2015 08:15:18 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <linux-mtd@lists.infradead.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>
CC: Haikun Wang <haikun.wang@freescale.com>
Subject: [PATCH] mtd: m25p80: Get mtd_info->name from spi_device as the second
 choice
Date: Fri, 10 Jul 2015 16:10:08 +0800
Message-ID: <1436515808-45639-1-git-send-email-haikun.wang@freescale.com>
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

If we can't get "mtd_info->name" form struct flash_platform_data,
get it from "spi_device".

Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
---
 drivers/mtd/devices/m25p80.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index d313f948b..ebac9e5 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -215,6 +215,8 @@ static int m25p_probe(struct spi_device *spi)
 
 	if (data && data->name)
 		flash->mtd.name = data->name;
+	else
+		flash->mtd.name = dev_name(&spi->dev);
 
 	/* For some (historical?) reason many platforms provide two different
 	 * names in flash_platform_data: "name" and "type". Quite often name is
-- 
2.1.0.27.g96db324

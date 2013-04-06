Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UOMog-0006iZ-GA
 for linux-mtd@lists.infradead.org; Sat, 06 Apr 2013 06:41:34 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKT008YOML90E00@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Sat, 06 Apr 2013 15:41:33 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>
References: <001401ce3291$a1bdcba0$e53962e0$%han@samsung.com>
In-reply-to: <001401ce3291$a1bdcba0$e53962e0$%han@samsung.com>
Subject: [PATCH 3/3] mtd: m25p80: use spi_get_drvdata() and spi_set_drvdata()
Date: Sat, 06 Apr 2013 15:41:32 +0900
Message-id: <001601ce3291$c6d7a0f0$5486e2d0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the wrapper functions for getting and setting the driver data using
spi_device instead of using dev_{get|set}_drvdata with &spi->dev, so we
can directly pass a struct spi_device.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/devices/m25p80.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 2f3d2a5..d2232e7 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -972,7 +972,7 @@ static int m25p_probe(struct spi_device *spi)
 
 	flash->spi = spi;
 	mutex_init(&flash->lock);
-	dev_set_drvdata(&spi->dev, flash);
+	spi_set_drvdata(spi, flash);
 
 	/*
 	 * Atmel, SST and Intel/Numonyx serial flash tend to power
@@ -1080,7 +1080,7 @@ static int m25p_probe(struct spi_device *spi)
 
 static int m25p_remove(struct spi_device *spi)
 {
-	struct m25p	*flash = dev_get_drvdata(&spi->dev);
+	struct m25p	*flash = spi_get_drvdata(spi);
 	int		status;
 
 	/* Clean up MTD stuff. */
-- 
1.7.2.5

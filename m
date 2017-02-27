Received: from fllnx209.ext.ti.com ([198.47.19.16])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciK94-00087I-F4
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 12:11:22 +0000
From: Vignesh R <vigneshr@ti.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, Vignesh R <vigneshr@ti.com>, Frode Isaksen
 <fisaksen@baylibre.com>, <linux-spi@vger.kernel.org>
Subject: [RFC PATCH 2/2] mtd: devices: m25p80: Enable spi-nor bounce buffer
 support
Date: Mon, 27 Feb 2017 17:38:39 +0530
Message-ID: <20170227120839.16545-3-vigneshr@ti.com>
In-Reply-To: <20170227120839.16545-1-vigneshr@ti.com>
References: <20170227120839.16545-1-vigneshr@ti.com>
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

Many SPI controller drivers use DMA to read/write from m25p80 compatible
flashes. Therefore enable bounce buffers support provided by spi-nor
framework to take care of handling vmalloc'd buffers which may not be
DMA'able.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 drivers/mtd/devices/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c4df3b1bded0..d05acf22eadf 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -241,6 +241,7 @@ static int m25p_probe(struct spi_device *spi)
 	else
 		flash_name = spi->modalias;
 
+	nor->flags |= SNOR_F_USE_BOUNCE_BUFFER;
 	ret = spi_nor_scan(nor, flash_name, mode);
 	if (ret)
 		return ret;
-- 
2.11.0

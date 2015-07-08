Received: from mail-qg0-f43.google.com ([209.85.192.43])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZCvrN-0005iN-Fz
 for linux-mtd@lists.infradead.org; Wed, 08 Jul 2015 20:22:26 +0000
Received: by qgef3 with SMTP id f3so55982393qge.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jul 2015 13:22:01 -0700 (PDT)
From: Cory Tusar <cory.tusar@pid1solutions.com>
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org, shawnguo@kernel.org,
 kernel@pengutronix.de, han.xu@freescale.com, dwmw2@infradead.org,
 computersforpeace@gmail.com
Cc: stefan@agner.ch, linux@arm.linux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, andrew@lunn.ch,
 Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH v1 6/7] mtd: spi-nor: Add support for Micron MT25QL02GC serial
 flash.
Date: Wed,  8 Jul 2015 16:21:20 -0400
Message-Id: <1436386881-28088-7-git-send-email-cory.tusar@pid1solutions.com>
In-Reply-To: <1436386881-28088-1-git-send-email-cory.tusar@pid1solutions.com>
References: <1436386881-28088-1-git-send-email-cory.tusar@pid1solutions.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add Micron (mt25ql02gc) 256 MiB flash to the list of supported devices.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d78831b..7a8896d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -596,6 +596,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "mt25ql02gc",  INFO(0x20ba22, 0, 64 * 1024, 4096, SPI_NOR_QUAD_READ) },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
-- 
2.3.6

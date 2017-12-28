Received: from mail-ve1eur01on0131.outbound.protection.outlook.com
 ([104.47.1.131] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUV3d-0004Rt-QV
 for linux-mtd@lists.infradead.org; Thu, 28 Dec 2017 10:05:14 +0000
From: Romain Porte <romain.porte@nokia.com>
To: <cyrille.pitchen@wedev4u.fr>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <alexander.sverdlin@nokia.com>, <pascal.fabreges@nokia.com>, Romain Porte
 <romain.porte@nokia.com>
Subject: [PATCH v3] mtd: spi-nor: Add ISSI is25lp080d support
Date: Thu, 28 Dec 2017 11:03:24 +0100
Message-ID: <20171228100324.2214-1-romain.porte@nokia.com>
In-Reply-To: <20171219134325.3315-1-romain.porte@nokia.com>
References: <20171219134325.3315-1-romain.porte@nokia.com>
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

Add support for a new ISSI 1MB SPI NOR chip that was tested in our lab.
Datasheet is available at: http://www.issi.com/WW/pdf/25LP-WP080D.pdf

Testing was done only without the SPI_NOR_{DUAL,QUAD}_READ flags that
were added later, according to the datasheet.

Tested-by: Pascal Fabreges <pascal.fabreges@nokia.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Signed-off-by: Romain Porte <romain.porte@nokia.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 8bafd462f..18e826d36 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1050,6 +1050,8 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "is25lp080d", INFO(0x9d6014, 0, 64 * 1024,  16,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-- 
2.11.0

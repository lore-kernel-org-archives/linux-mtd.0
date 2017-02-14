Received: from ns.omicron.at ([212.183.10.25])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdfAU-00045h-G9
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 15:37:33 +0000
From: <mark.marshall@omicronenergy.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>,
 <cyrille.pitchen@atmel.com>, <marek.vasut@gmail.com>
CC: <markmarshall14@gmail.com>, <dwmw2@infradead.org>, <richard@nod.at>,
 <boris.brezillon@free-electrons.com>, Mark Marshall
 <mark.marshall@omicronenergy.com>
Subject: [PATCH v2 3/3] mtd: spi-nor: s25fl512s: Set a page size of 512
Date: Tue, 14 Feb 2017 16:35:53 +0100
Message-ID: <22ee35326eb763a0f7477c845838ef7aa1c8d1fd.1487085166.git.mark.marshall@omicronenergy.com>
In-Reply-To: <cover.1487085166.git.mark.marshall@omicronenergy.com>
References: <cover.1487085166.git.mark.marshall@omicronenergy.com>
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

From: Mark Marshall <mark.marshall@omicronenergy.com>

This device has a write page size of 512.  Changing this from 256 to 512
almost doubles the write performance of the flash.

Signed-off-by: Mark Marshall <mark.marshall@omicronenergy.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 467dc93..ba4d7b7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1056,6 +1056,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25fl256s0", INFO(JEDEC_ID(0x010219, 0x4d00, 2), 256 * 1024, 128, 0) },
 	{ "s25fl256s1", INFO(JEDEC_ID(0x010219, 0x4d01, 2),  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl512s",  INFO(JEDEC_ID(0x010220, 0x4d00, 2), 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl512s",  INFO_FULL(JEDEC_ID(0x010220, 0x4d00, 2),
+				  256 * 1024, 256, 512, 0, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s70fl01gs",  INFO(JEDEC_ID(0x010221, 0x4d00, 2), 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(JEDEC_ID(0x012018, 0x0300, 2), 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(JEDEC_ID(0x012018, 0x0301, 2),  64 * 1024, 256, 0) },
-- 
2.7.4

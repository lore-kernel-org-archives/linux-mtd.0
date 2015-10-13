Received: from mail01.prevas.se ([62.95.78.3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZltQV-00013L-Nr
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 06:51:12 +0000
From: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
To: <linux-mtd@lists.infradead.org>
CC: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Subject: [PATCH v2] mtd: spi-nor: Add support for s25fl004k
Date: Tue, 13 Oct 2015 08:50:30 +0200
Message-ID: <1444719030-26781-1-git-send-email-sean.nyekjaer@prevas.dk>
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

Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
---
Changes since v1:
- Added support for both dual and quad read
- Fixed JEDEC id

 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 0397dba..9940296 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -649,6 +649,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
 	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
 	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
+	{ "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
-- 
2.6.1

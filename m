Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bri4N-0008UG-CE
 for linux-mtd@lists.infradead.org; Wed, 05 Oct 2016 09:00:59 +0000
From: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
To: linux-mtd@lists.infradead.org
Cc: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Subject: [PATCHv1] mtd: spi-nor: add support for s25fl208k
Date: Wed,  5 Oct 2016 10:59:49 +0200
Message-Id: <20161005085949.29804-1-sean.nyekjaer@prevas.dk>
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
Changes: Fixed commit msg

 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165..80e7968 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -921,6 +921,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
 	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
 	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ) },
 
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
-- 
2.10.0

Received: from mail01.prevas.se ([62.95.78.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePkVX-0004Lg-6j
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 07:34:13 +0000
From: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
To: <linux-mtd@lists.infradead.org>, <marek.vasut@gmail.com>,
 <cyrille.pitchen@wedev4u.fr>
CC: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Subject: [PATCHv3 1/2] mtd: spi-nor: add support for is25lq040b
Date: Fri, 15 Dec 2017 08:33:31 +0100
Message-ID: <20171215073332.10965-1-sean.nyekjaer@prevas.dk>
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
v3:
 - this spi-nor is 4Mbit or 512KB
 - readded SECT_4K as per Cyrille comments
 - spi-nor supports fast read dual and quad

v2:
 - removed SECT_4K as the chip are supporting 32K and bulk erase

 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 9178139a39d0..f7676aa50ce6 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1046,6 +1046,8 @@ static const struct flash_info spi_nor_ids[] = {
 
 	/* ISSI */
 	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
+	{ "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,  8,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25lp128", INFO(0x9d6018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ) },
 
-- 
2.15.1

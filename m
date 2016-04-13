Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqOWu-0001T7-TX
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 17:24:43 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH RFC 3/8] mtd: spi-nor: add entry for Macronix mx25l25673g
Date: Wed, 13 Apr 2016 19:23:35 +0200
Message-ID: <a35b0ba892ed4f10be82f6e616bad68147fba558.1460567256.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1460567255.git.cyrille.pitchen@atmel.com>
References: <cover.1460567255.git.cyrille.pitchen@atmel.com>
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

The Macronix MX25L25635E and MX25L25673G share the same JEDEC ID, C22019,
with no extended ID to differenciate them at runtime.

However, the 73G supports dedicated 4byte address op code for (Fast) Read,
Page Program and Sectore Erase Operation whereas the 35E doesn't.

So this patch adds a specific entry to support the 73G revision.

For backward compatibility purpose, this new entry is inserted AFTER the
legacy "mx25l25635e" entry so this later entry is still the first one
found hence returned by spi_nor_read_id().

Then using the new entry requires the "mx25l25673g" string to be given
as the 'name' argument of spi_nor_scan().

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index aac291a590e1..54115aface9f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -933,6 +933,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
+	{ "mx25l25673g", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
-- 
1.8.2.2

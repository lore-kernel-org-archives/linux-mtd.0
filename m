Received: from mta-01.yadro.com ([89.207.88.251])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1frhOx-0003p3-31
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2018 10:27:12 +0000
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: <linux-mtd@lists.infradead.org>
CC: Marek Vasut <marek.vasut@gmail.com>, <openbmc@lists.ozlabs.org>, Joel
 Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
Date: Mon, 20 Aug 2018 13:26:51 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently in spi-nor driver there is a line for mx66l51235l.
According to Macronix site, there is no such part number. The chip
detected as such is actually mx66l51235f. Hence, this commit renames
the chip.

According to the datasheet for mx66l51235f, "The device default is in
24-bit address mode" (section 9-10). Having option SPI_NOR_4B_OPCODES
makes the code act as if the device was already in 4B mode and didn't
need the EN4B command. That prevents this chip from functioning on
systems where the boot loader left the chip in 3B mode (e.g. if the
chip wasn't used during the boot process).

Hence, this commit removes the SPI_NOR_4B_OPCODES option for
mx66l51235f (added previously by commit d342b6a973af).

Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: <linux-mtd@lists.infradead.org>
Cc: <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>
Fixes: d342b6a973af ("mtd: spi-nor: enable 4B opcodes for mx66l51235l")
Signed-off-by: Alexander Amelkin <a.amelkin@yadro.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f028277..c5ef85e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1091,7 +1091,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
-- 
2.7.4

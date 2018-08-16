Received: from mta-01.yadro.com ([89.207.88.251])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fqFsN-0007dl-6b
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2018 10:51:36 +0000
From: Alexander Soldatov <a.soldatov@yadro.com>
To: <linux-mtd@lists.infradead.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
CC: Alexander Soldatov <a.soldatov@yadro.com>, <stable@vger.kernel.org>
Subject: [PATCH linux dev-4.17 1/2] mtd: spi-nor: fix options for mx66l51235f
Date: Thu, 16 Aug 2018 13:40:54 +0300
Message-ID: <1534416055-23939-1-git-send-email-a.soldatov@yadro.com>
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

Currently in driver spi-nor there is a line for mx66l51235l.
According to Macronix site there is no such part number.
The chip detected as such is actually mx66l51235f.

According to the datasheet for mx66l51235f,
"The device default is in 24-bit address mode" (section 9-10).
Hence we removed SPI_NOR_4B_OPCODES option with this commit.

Cc: stable@vger.kernel.org
Fixes: d342b6a973af ("mtd: spi-nor: enable 4B opcodes for mx66l51235l")
Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5bfa36e95f35..e9f44475571a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1068,7 +1068,7 @@ static const struct flash_info spi_nor_ids[] = {
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

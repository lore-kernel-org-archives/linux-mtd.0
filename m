Received: from vegas.theobroma-systems.com ([144.76.126.164]
 helo=mail.theobroma-systems.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ds2tj-0002Iw-8H
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 08:19:53 +0000
From: Klaus Goger <klaus.goger@theobroma-systems.com>
To: linux-mtd@lists.infradead.org
Cc: Klaus Goger <klaus.goger@theobroma-systems.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: spi-nor: add support for Gigadevice GD25LQ32
Date: Wed, 13 Sep 2017 10:19:07 +0200
Message-Id: <20170913081907.63946-1-klaus.goger@theobroma-systems.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tested against GD25LQ32D but the GD25LQ32C datasheet seems to be
identically feature-wise. Therefore dropping the suffix as it's
probably only indicating the die revision.

Signed-off-by: Klaus Goger <klaus.goger@theobroma-systems.com>

---

 drivers/mtd/spi-nor/spi-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index cf1d4a15e10a..bfd64354defc 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -983,6 +983,11 @@ static const struct flash_info spi_nor_ids[] = {
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 	{
+		"gd25lql32", INFO(0xc86016, 0, 64 * 1024, 64,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
 		"gd25q64", INFO(0xc84017, 0, 64 * 1024, 128,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-- 
2.11.0

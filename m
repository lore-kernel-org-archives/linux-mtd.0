Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCn41-0000DA-93
 for linux-mtd@lists.infradead.org; Wed, 17 Oct 2018 14:44:47 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] mtd: spi-nor: Use 4B opcodes when the NOR advertises both
 3B and 4B
Date: Wed, 17 Oct 2018 16:44:24 +0200
Message-Id: <20181017144424.17554-2-boris.brezillon@bootlin.com>
In-Reply-To: <20181017144424.17554-1-boris.brezillon@bootlin.com>
References: <20181017144424.17554-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the NOR supports 4 bytes opcodes we should use those instead of
switching the flash in 4-bytes mode. This way, we don't have to restore
the addressing mode when resetting the board.

Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 85e57e9ea1b5..260ed1757a08 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2643,6 +2643,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		break;
 
 	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
+	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
 		nor->flags |= SNOR_F_4B_OPCODES;
 		nor->addr_width = 4;
 		break;
-- 
2.14.1

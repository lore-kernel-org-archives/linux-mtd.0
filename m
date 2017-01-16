Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT8yA-0004vE-4s
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 15:13:18 +0000
From: Bastian Stender <bst@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Bastian Stender <bst@pengutronix.de>
Subject: [PATCH 1/2] mtd: spi-nor: make n_sectors in flash_info 32 bit wide
Date: Mon, 16 Jan 2017 16:12:13 +0100
Message-Id: <20170116151214.11195-1-bst@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since MRAM chips (like the Everspin mr25h40) are not sector organized
they should be defined as n_sectors * 1 byte sectors. To be able to
store the higher number of sectors n_sectors should be an unsigned 32
bit integer just like sector_size.

Signed-off-by: Bastian Stender <bst@pengutronix.de>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index da7cd69d4857..c8399522c69d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -55,7 +55,7 @@ struct flash_info {
 	 * necessarily called a "sector" by the vendor.
 	 */
 	unsigned	sector_size;
-	u16		n_sectors;
+	unsigned	n_sectors;
 
 	u16		page_size;
 	u16		addr_width;
-- 
2.11.0

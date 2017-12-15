Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePkVX-0004Lh-4i
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 07:34:13 +0000
From: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
To: <linux-mtd@lists.infradead.org>, <marek.vasut@gmail.com>,
 <cyrille.pitchen@wedev4u.fr>
CC: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Subject: [PATCHv3 2/2] mtd: spi-nor: indent issi section
Date: Fri, 15 Dec 2017 08:33:32 +0100
Message-ID: <20171215073332.10965-2-sean.nyekjaer@prevas.dk>
In-Reply-To: <20171215073332.10965-1-sean.nyekjaer@prevas.dk>
References: <20171215073332.10965-1-sean.nyekjaer@prevas.dk>
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
 drivers/mtd/spi-nor/spi-nor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f7676aa50ce6..74153796b6fe 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1045,10 +1045,10 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
 
 	/* ISSI */
-	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
+	{ "is25cd512",  INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
 	{ "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,  8,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "is25lp128", INFO(0x9d6018, 0, 64 * 1024, 256,
+	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ) },
 
 	/* Macronix */
-- 
2.15.1

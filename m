Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fn7rT-0008Hn-TL
 for linux-mtd@lists.infradead.org; Tue, 07 Aug 2018 19:41:47 +0000
Received: by mail-pg1-x544.google.com with SMTP id r1-v6so8298137pgp.11
 for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2018 12:41:33 -0700 (PDT)
Subject: [PATCH v2 2/2] spi-nor: add support for is25wp256
Date: Tue,  7 Aug 2018 12:40:59 -0700
Message-Id: <20180807194059.26348-3-palmer@sifive.com>
In-Reply-To: <20180807194059.26348-1-palmer@sifive.com>
References: <20180807194059.26348-1-palmer@sifive.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com,
 richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Wesley W. Terpstra" <wesley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: marek.vasut@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Wesley W. Terpstra" <wesley@sifive.com>

This is used of the HiFive Unleashed development board, and follows the
pattern of similar ISSI devices already listed.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index aab93463a5e7..f10017b4543d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1072,6 +1072,8 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25wp256",  INFO(0x9d7019, 0, 64 * 1024, 512,
+	                SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-- 
2.16.4

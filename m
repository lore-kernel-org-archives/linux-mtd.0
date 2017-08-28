Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmJpc-0004QC-A6
 for linux-mtd@lists.infradead.org; Mon, 28 Aug 2017 13:11:58 +0000
Received: by mail-wm0-x233.google.com with SMTP id b14so12988562wme.0
 for <linux-mtd@lists.infradead.org>; Mon, 28 Aug 2017 06:11:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: cyrille.pitchen@wedev4u.fr,
	marek.vasut@gmail.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: Add support for Winbond w25q16dw
Date: Mon, 28 Aug 2017 15:11:33 +0200
Message-Id: <1503925893-17116-1-git-send-email-narmstrong@baylibre.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add JEDEC entry for the Winbond w25q16fw/w25q16dw with similar
flags and format than the Winbond w25q32dw entry.

Tested on a Khadas VIM2 SBC board with an Amlogic S912 SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index cf1d4a1..2f74583 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1137,6 +1137,11 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	{ "w25x40", INFO(0xef3013, 0, 64 * 1024,  8,  SECT_4K) },
 	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
+	{
+		"w25q16dw", INFO(0xef6015, 0, 64 * 1024,  32,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4, SECT_4K) },
 	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4, SECT_4K) },
-- 
1.9.1

From: sergei.shtylyov@cogentembedded.com (Sergei Shtylyov)
Date: Wed, 16 Jan 2019 20:53:25 +0300
Subject: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
In-Reply-To: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
Message-ID: <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Spansion S25FL512S ID is erroneously using 5-byte JEDEC ID, while the chip
family ID is stored in the 6th byte. Due to using only 5-byte ID, it's also
covering S25FS512S and now that we have added 6-byte ID for that chip, we
can convert S25FL512S to using a proper 6-byte ID as well...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/mtd/spi-nor/spi-nor.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-mtd/drivers/mtd/spi-nor/spi-nor.c
===================================================================
--- linux-mtd.orig/drivers/mtd/spi-nor/spi-nor.c
+++ linux-mtd/drivers/mtd/spi-nor/spi-nor.c
@@ -1887,8 +1887,8 @@ static const struct flash_info spi_nor_i
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
+	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },

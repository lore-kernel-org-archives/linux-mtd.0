From: sergei.shtylyov@cogentembedded.com (Sergei Shtylyov)
Date: Wed, 16 Jan 2019 20:51:56 +0300
Subject: [PATCH 1/2] mtd: spi-nor: add Spansion S25FS512S ID
In-Reply-To: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
Message-ID: <650c47f3-8657-0fc9-81bd-63974bbe06a5@cogentembedded.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Spansion S25FS512S flash is currently misdetected as S25FL512S since the
latter uses 5-byte JEDEC ID, while the 6th ID byte (family ID) is different
on those chips. Add the 6-byte S25FS512S ID before S25FL512S ID in order
not to break the existing S25FS512S users.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/mtd/spi-nor/spi-nor.c |    1 +
 1 file changed, 1 insertion(+)

Index: linux-mtd/drivers/mtd/spi-nor/spi-nor.c
===================================================================
--- linux-mtd.orig/drivers/mtd/spi-nor/spi-nor.c
+++ linux-mtd/drivers/mtd/spi-nor/spi-nor.c
@@ -1887,6 +1887,7 @@ static const struct flash_info spi_nor_i
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
+	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },

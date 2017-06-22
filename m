Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dO8Fc-00028l-68
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 19:58:50 +0000
Received: by mail-pg0-x244.google.com with SMTP id j186so3692263pge.1
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 12:58:27 -0700 (PDT)
From: Harry Chou <harryyc.chou@gmail.com>
To: cyrille.pitchen@wedev4u.fr
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Harry Chou <HarryYC.Chou@gmail.com>
Subject: [PATCH v2] mtd: spi-nor: Add support for Spansion S25FL064L
Date: Fri, 23 Jun 2017 03:58:11 +0800
Message-Id: <1498161491-22411-1-git-send-email-HarryYC.Chou@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's an 8 MiB flash with 4 KiB erase sectors.

Signed-off-by: Harry Chou <HarryYC.Chou@gmail.com>
---
Changes v1 -> v2:
 - added SPI_NOR_DUAL_READ flag (supports Dual Output and I/O)
 - added SPI_NOR_QUAD_READ flag (supports Quad Output and I/O)
 - added SPI_NOR_4B_OPCODES flag (supports the 4-byte address instruction set)

 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index dea8c9c..9db5861 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1076,6 +1076,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
 	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
-- 
2.7.4

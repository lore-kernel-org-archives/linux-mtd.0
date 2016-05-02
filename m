Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axHtm-0006j3-VR
 for linux-mtd@lists.infradead.org; Mon, 02 May 2016 17:44:47 +0000
Received: by mail-pa0-x230.google.com with SMTP id xk12so5633088pac.0
 for <linux-mtd@lists.infradead.org>; Mon, 02 May 2016 10:44:26 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: dwmw2@infradead.org
Cc: computersforpeace@gmail.com, ezequiel@vanguardiasur.com.ar,
 zajec5@gmail.com, boris.brezillon@free-electrons.com, jteki@openedev.com,
 furquan@google.com, cyrille.pitchen@atmel.com,
 moritz.fischer.private@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH] mtd: spi-nor: Add support for Micron n25q016a
Date: Mon,  2 May 2016 10:44:10 -0700
Message-Id: <1462211050-30264-1-git-send-email-moritz.fischer@ettus.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adds support in the spi-nor driver for the
N25Q016A, a 16Mbit SPI NOR flash from Micron.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---

Hi,

attached patch adds support for N25Q016a from Micron.
I have another set of changes that adds support for the 64 byte
part of this (and other N25Q Micron chips) that I'll send in follow
up patches.

Question:

Checkpatch complains about lines over 80 chars which happens all
over the place in drivers/mtd/spi-nor/spi-nor.c in the tables

Does anyone care? If so I can submit a patch that cleans that up,
as follow up.

Cheers,

Moritz

---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 157841d..885ab0f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -860,6 +860,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
 
 	/* Micron */
+	{ "n25q016a",	 INFO(0x20bb15, 0x1000, 64 * 1024,32, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
 	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
 	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
-- 
2.5.5

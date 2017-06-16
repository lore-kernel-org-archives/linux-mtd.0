Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dLhKm-0006iD-PS
 for linux-mtd@lists.infradead.org; Fri, 16 Jun 2017 02:50:06 +0000
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v5G2nbvF012755
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jun 2017 21:49:38 -0500
Message-ID: <1497581377.2897.90.camel@kernel.crashing.org>
Subject: [PATCH] spi-nor: Add Winbond w25q256jv
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 16 Jun 2017 12:49:37 +1000
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's similar to the non-"jv" version with a different ID.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---

--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1160,6 +1160,7 @@ static const struct flash_info spi_nor_ids[] = {
        { "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
        { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
        { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
+       { "w25q256jv", INFO(0xef7119, 0, 64 * 1024, 512, SECT_4K) },
 
        /* Catalyst / On Semiconductor -- non-JEDEC */
        { "cat25c11", CAT25_INFO(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },

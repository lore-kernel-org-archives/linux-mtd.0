Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzsAA-0000in-Dr
 for linux-mtd@lists.infradead.org; Thu, 27 Oct 2016 21:24:39 +0000
Received: by mail-wm0-x243.google.com with SMTP id y138so4575149wme.1
 for <linux-mtd@lists.infradead.org>; Thu, 27 Oct 2016 14:24:17 -0700 (PDT)
Subject: [PATCH RESEND v3] mtd: spi-nor: fix flags for s25fl128s
References: <4d3db993-d030-3659-2f62-94c373f57038@gmail.com>
 <808bf727-f562-79d4-a60f-5e437cc15da6@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 MTD Mailing List <linux-mtd@lists.infradead.org>,
 Jagan Teki <jteki@openedev.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <514b12c9-447b-1688-29d3-aac839de08ac@gmail.com>
Date: Thu, 27 Oct 2016 23:13:26 +0200
MIME-Version: 1.0
In-Reply-To: <808bf727-f562-79d4-a60f-5e437cc15da6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Spansion S25FL128S also supports dual read mode.
In addition remove flag SECT_4K. 4K erases are supported,
but not uniformly.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Jagan Teki <jteki@openedev.com>
---
v2:
- In addition remove SECT_4K flag. 4K erases are supported,
  but not uniformly.
v3:
- mention removal of SECT_4K also in actual commit message
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165..4f8e488 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -905,7 +905,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-	{ "s25fl128s",	INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "s25fl128s",	INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
-- 
2.9.2

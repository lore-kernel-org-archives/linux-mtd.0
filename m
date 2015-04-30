Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnwQV-0006oH-J6
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 21:55:25 +0000
Message-Id: <3df22a1b0c6730787cfe38e54388732d02b6ceed.1430430153.git.hramrach@gmail.com>
In-Reply-To: <cover.1430430153.git.hramrach@gmail.com>
References: <cover.1430430153.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 30 Apr 2015 21:02:42 +0200
Subject: [PATCH 2/3] MTD: spi-nor: Add Pm25LD020 and GD25Q41B chip ID.
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, <zajec5@gmail.com>,
 Marek Vasut <marex@denx.de>, Alison Chaiken <alison_chaiken@mentor.com>,
 Michal Suchanek <hramrach@gmail.com>, Ben Hutchings <ben@decadent.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>,
 "grmoore@altera.com" <grmoore@altera.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

First chip reads Pm25LD020 or Pm25L0020. Found on some WD HDD PCB.
Identified as PMC Pm25LD020.
Flash read does not return consistent data which explains why the disk died.

Second chip reads something like 25Q41BT. Found on Esspif ESP8266 based
ESP-01 board. Identified as Elm Techchnology GD25Q41B.
Datasheet is not clear about block size so erasing blocks may not work
as expected.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 14a5d23..de73cf5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -551,6 +551,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
 
 	/* GigaDevice */
+	{ "gd25q41b", INFO(0xc84013, 0, 64 * 1024,  8, SECT_4K) },
 	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },
@@ -589,6 +590,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
 	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) },
+	{ "pm25ld020",   INFO(0x7f9d22, 0, 64 * 1024,    4, SECT_4K) },
 	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64, SECT_4K) },
 
 	/* Spansion -- single (large) sector size only, at least
-- 
2.1.4

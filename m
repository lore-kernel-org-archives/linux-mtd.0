Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMZGl-0006J5-Gd
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2018 14:02:22 +0000
Received: by mail-wr1-x444.google.com with SMTP id j26-v6so13439369wre.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Nov 2018 06:02:09 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "David S . Miller" <davem@davemloft.net>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Wolfram Sang <wsa@the-dreams.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 08/25] ARM: davinci: dm850-evm: use cell nvmem lookup for
 mac address
Date: Tue, 13 Nov 2018 15:01:16 +0100
Message-Id: <20181113140133.17385-9-brgl@bgdev.pl>
In-Reply-To: <20181113140133.17385-1-brgl@bgdev.pl>
References: <20181113140133.17385-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We now support nvmem lookups and cell definitions for machine code.
Add relevant data structures for the mac-address stored in at24 EEPROM.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-da850-evm.c | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index e1a949b47306..bac2162e2153 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -28,6 +28,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
+#include <linux/nvmem-provider.h>
 #include <linux/mtd/physmap.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/gpio-davinci.h>
@@ -100,6 +101,31 @@ static struct mtd_partition da850evm_spiflash_part[] = {
 	},
 };
 
+static struct nvmem_cell_info da850evm_nvmem_cells[] = {
+	{
+		.name		= "macaddr",
+		.offset		= 0x0,
+		.bytes		= ETH_ALEN,
+	}
+};
+
+static struct nvmem_cell_table da850evm_nvmem_cell_table = {
+	/*
+	 * The nvmem name differs from the partition name because of the
+	 * internal works of the nvmem framework.
+	 */
+	.nvmem_name	= "MAC-Address0",
+	.cells		= da850evm_nvmem_cells,
+	.ncells		= ARRAY_SIZE(da850evm_nvmem_cells),
+};
+
+static struct nvmem_cell_lookup da850evm_nvmem_cell_lookup = {
+	.nvmem_name	= "MAC-Address0",
+	.cell_name	= "macaddr",
+	.dev_id		= "davinci_emac.1",
+	.con_id		= "mac-address",
+};
+
 static struct flash_platform_data da850evm_spiflash_data = {
 	.name		= "m25p80",
 	.parts		= da850evm_spiflash_part,
@@ -1395,6 +1421,9 @@ static __init void da850_evm_init(void)
 
 	davinci_serial_init(da8xx_serial_device);
 
+	nvmem_add_cell_table(&da850evm_nvmem_cell_table);
+	nvmem_add_cell_lookups(&da850evm_nvmem_cell_lookup, 1);
+
 	i2c_register_board_info(1, da850_evm_i2c_devices,
 			ARRAY_SIZE(da850_evm_i2c_devices));
 
-- 
2.19.1

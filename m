Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dArgl-0003aF-4A
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 05:40:01 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: dwmw2@infradead.org, computersforpeace@gmail.com, andrew@lunn.ch,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org
Subject: [PATCH 1/4] mtd: mchp23k256: Add OF device ID table
Date: Wed, 17 May 2017 17:39:05 +1200
Message-Id: <20170517053908.26138-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This allows registering of this device via a Device Tree.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../devicetree/bindings/mtd/microchip,mchp23k256.txt   | 18 ++++++++++++++++++
 drivers/mtd/devices/mchp23k256.c                       |  8 ++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt

diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
new file mode 100644
index 000000000000..25e5ad38b0f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
@@ -0,0 +1,18 @@
+* MTD SPI driver for Microchip 23K256 (and similar) serial SRAM
+
+Required properties:
+- #address-cells, #size-cells : Must be present if the device has sub-nodes
+  representing partitions.
+- compatible : Must be "microchip,mchp23k256"
+- reg : Chip-Select number
+- spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
+
+Example:
+
+	spi-sram@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "microchip,mchp23k256";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index e237db9f1bdb..9d8306a15833 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -19,6 +19,7 @@
 #include <linux/sizes.h>
 #include <linux/spi/flash.h>
 #include <linux/spi/spi.h>
+#include <linux/of_device.h>
 
 struct mchp23k256_flash {
 	struct spi_device	*spi;
@@ -166,9 +167,16 @@ static int mchp23k256_remove(struct spi_device *spi)
 	return mtd_device_unregister(&flash->mtd);
 }
 
+static const struct of_device_id mchp23k256_of_table[] = {
+	{ .compatible = "microchip,mchp23k256" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mchp23k256_of_table);
+
 static struct spi_driver mchp23k256_driver = {
 	.driver = {
 		.name	= "mchp23k256",
+		.of_match_table = of_match_ptr(mchp23k256_of_table),
 	},
 	.probe		= mchp23k256_probe,
 	.remove		= mchp23k256_remove,
-- 
2.11.0.24.ge6920cf

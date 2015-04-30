Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnpWv-0005b9-Rm
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 14:33:37 +0000
Message-Id: <3b0c112672f364452e80c333048161eaffb655db.1430403750.git.hramrach@gmail.com>
In-Reply-To: <cover.1430403750.git.hramrach@gmail.com>
References: <cover.1430403750.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 30 Apr 2015 15:46:11 +0200
Subject: [PATCH 3/3] MTD: m25p80: Add option to limit SPI transfer size.
To: linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
  Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
  Ian Campbell <ijc+devicetree@hellion.org.uk>,
  Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
  Huang Shijie <b32955@freescale.com>, Michal Suchanek <hramrach@gmail.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Ben Hutchings <ben@decadent.org.uk>,
  Alison Chaiken <alison_chaiken@mentor.com>,
  Mika Westerberg <mika.westerberg@linux.intel.com>,
  "Bean Huo 霍斌斌 \(beanhuo\)" <beanhuo@micron.com>,
  "grmoore@altera.com" <grmoore@altera.com>, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My SPI driver does not support DMA so sizes larger than 64 bytes return
an error. Add an option to limit transfer size so m25p80 can be used
with reduced speed with such controller.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 Documentation/devicetree/bindings/mtd/m25p80.txt |  5 +++++
 drivers/mtd/devices/m25p80.c                     | 19 +++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documentation/devicetree/bindings/mtd/m25p80.txt
index f20b111..2bda5be 100644
--- a/Documentation/devicetree/bindings/mtd/m25p80.txt
+++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
@@ -19,6 +19,11 @@ Optional properties:
                    all chips and support for it can not be detected at runtime.
                    Refer to your chips' datasheet to check if this is supported
                    by your chip.
+- linux,max_tx_len : With some SPI controller drivers transfer size is
+                     limited.s
+                     Transfer data in chunks no larger than this value.
+                     Using this option will degrade performance when
+                     max_tx_len is smaller than flash page size.
 
 Example:
 
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 0b2bc21..dfdb750 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -26,12 +26,14 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
 #include <linux/mtd/spi-nor.h>
+#include <linux/of_platform.h>
 
 #define	MAX_CMD_SIZE		6
 struct m25p {
 	struct spi_device	*spi;
 	struct spi_nor		spi_nor;
 	struct mtd_info		mtd;
+	size_t max_tx_len;
 	u8			command[MAX_CMD_SIZE];
 };
 
@@ -97,7 +99,10 @@ static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	spi_message_add_tail(&t[0], &m);
 
 	t[1].tx_buf = buf;
-	t[1].len = len;
+	if (flash->max_tx_len)
+		t[1].len = min(len,flash->max_tx_len);
+	else
+		t[1].len = len;
 	spi_message_add_tail(&t[1], &m);
 
 	spi_sync(spi, &m);
@@ -145,7 +150,10 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 
 	t[1].rx_buf = buf;
 	t[1].rx_nbits = m25p80_rx_nbits(nor);
-	t[1].len = len;
+	if (flash->max_tx_len)
+		t[1].len = min(len,flash->max_tx_len);
+	else
+		t[1].len = len;
 	spi_message_add_tail(&t[1], &m);
 
 	spi_sync(spi, &m);
@@ -233,6 +241,13 @@ static int m25p_probe(struct spi_device *spi)
 		return ret;
 
 	ppdata.of_node = spi->dev.of_node;
+	if (spi->dev.of_node){
+		int result = of_property_read_u32(spi->dev.of_node, "linux,max_tx_len", &flash->max_tx_len);
+		if (result)
+			flash->max_tx_len = 0;
+		else
+			dev_info(&spi->dev, "Using maximum transfer length %u\n", flash->max_tx_len);
+	}
 
 	return mtd_device_parse_register(&flash->mtd, NULL, &ppdata,
 			data ? data->parts : NULL,
-- 
2.1.4

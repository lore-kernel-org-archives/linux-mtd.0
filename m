Received: from mail.southpole.se ([193.12.106.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6jmw-00033p-3f
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 12:53:35 +0000
From: Jonas Bonn <jonas@southpole.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: m25p80 -- parse partitions from OF tree
Date: Fri, 15 Oct 2010 14:53:28 +0200
Message-Id: <1287147208-11588-1-git-send-email-jonas@southpole.se>
Cc: Jonas Bonn <jonas@southpole.se>, devicetree-discuss@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It needs to be possible to define the partitions of an MTD device from an OF
devicetree.  This patch adds a call to of_mtd_parse_partitions if:

i)   there are no commandline partitions defined
ii)  there are no partitions set up by platform_data
iii) and an of_node is present on the device

This permits the following devicetree structure:

flash0: mtd@0 {
	compatible = "st,m25p10";
	reg = <0>;
	spi-max-frequency = <100000000>;

	#address-cells = <1>;
	#size-cells = <1>;

	partition@0 {
		label = "bootloader";
		reg = <0x00000000 0x00018000>;
		read-only;
	}

	partition@18000 {
		label = "data";
		reg = <0x00018000 0x00008000>;
	};
};

Signed-off-by: Jonas Bonn <jonas@southpole.se>
---
 drivers/mtd/devices/m25p80.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 6f512b5..a349498 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -924,6 +924,10 @@ static int __devinit m25p_probe(struct spi_device *spi)
 			nr_parts = data->nr_parts;
 		}
 
+		if (nr_parts <= 0 && spi->dev.of_node) {
+			nr_parts = of_mtd_parse_partitions(&spi->dev, spi->dev.of_node, &parts);
+		}
+
 		if (nr_parts > 0) {
 			for (i = 0; i < nr_parts; i++) {
 				DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] = "
-- 
1.7.1

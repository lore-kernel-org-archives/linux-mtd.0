Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xvn5e-0003Zt-Gw
 for linux-mtd@lists.infradead.org; Tue, 02 Dec 2014 13:02:03 +0000
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
To: Andrew Bresticker <abrestic@chromium.org>, Ionela Voinescu
 <ionela.voinescu@imgtec.com>, James Hartley <james.hartley@imgtec.com>,
 "Brian Norris" <computersforpeace@gmail.com>, <bpqw@micron.com>,
 <arnaud.mouiche@invoxia.com>, <frankliu@micron.com>
Subject: [PATCH 5/6] mtd: spi-nand: Add devicetree binding
Date: Tue, 2 Dec 2014 09:58:55 -0300
Message-ID: <1417525136-25731-6-git-send-email-ezequiel.garcia@imgtec.com>
In-Reply-To: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adds the devicetree binding document that specifies the
SPI NAND devices support.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 Documentation/devicetree/bindings/mtd/spi-nand.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.txt b/Documentation/devicetree/bindings/mtd/spi-nand.txt
new file mode 100644
index 0000000..1c5e412
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/spi-nand.txt
@@ -0,0 +1,21 @@
+* NAND driver for MT29F, GD5F and similar serial NAND flash chips
+
+Required properties:
+- #address-cells, #size-cells : Must be present if the device has sub-nodes
+  representing partitions.
+- compatible : Should be the manufacturer and the name of the chip. Bear in mind
+               the DT binding is not Linux-only, but in case of Linux, see the
+               "spi_nand_id_table" array in drivers/mtd/spi-nand/spi-nand-devices.c
+               for the list of supported chips.
+- reg : Chip-Select number
+- spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
+
+Example:
+
+	flash: flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "gigadevice,gd5f";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+	};
-- 
2.1.0

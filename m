Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmPLg-0008Hi-Lh
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 15:51:49 +0000
From: Ionela Voinescu <ionela.voinescu@imgtec.com>
To: <computersforpeace@gmail.com>, <gregkh@linuxfoundation.org>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] Documentation: staging: mtd: Binding document for
 GigaDevice SPI NAND
Date: Thu, 6 Nov 2014 15:51:19 +0000
Message-ID: <1415289079-16922-3-git-send-email-ionela.voinescu@imgtec.com>
In-Reply-To: <1415289079-16922-1-git-send-email-ionela.voinescu@imgtec.com>
References: <1415289079-16922-1-git-send-email-ionela.voinescu@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Ionela Voinescu <ionela.voinescu@imgtec.com>, abrestic@chromium.org,
 dehrenberg@chromium.org, ezequiel.garcia@imgtec.com, sourav.poddar@ti.com,
 james.hartley@imgtec.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Ionela Voinescu <ionela.voinescu@imgtec.com>
---
 .../bindings/staging/mtd/gd5f_spinand.txt          |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/mtd/gd5f_spinand.txt

diff --git a/Documentation/devicetree/bindings/staging/mtd/gd5f_spinand.txt b/Documentation/devicetree/bindings/staging/mtd/gd5f_spinand.txt
new file mode 100644
index 0000000..b511c1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/staging/mtd/gd5f_spinand.txt
@@ -0,0 +1,13 @@
+GigaDevice 4Gb SPI NAND flash
+
+Required properties:
+- compatible: "gigadevice,gd5f"
+- reg: SPI chip select line
+- spi-max-frequency : maximum frequency of the SPI bus the chip can operate at
+
+
+gd5f: spi@18101000 {
+	compatible = "gigadevice,gd5f";
+	reg = <1>; /* Chip select 1 */
+	spi-max-frequency = <6250000>;
+};
-- 
1.7.9.5

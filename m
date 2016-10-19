Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwwx1-0005x2-3K
 for linux-mtd@lists.infradead.org; Wed, 19 Oct 2016 19:55:02 +0000
Received: by mail-qt0-x243.google.com with SMTP id g49so1258760qtc.2
 for <linux-mtd@lists.infradead.org>; Wed, 19 Oct 2016 12:54:38 -0700 (PDT)
From: Sergio Prado <sergio.prado@e-labworks.com>
To: linux@armlinux.org.uk, linux@simtec.co.uk, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org, kgene@kernel.org,
 javier@osg.samsung.com, boris.brezillon@free-electrons.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Subject: [PATCH v2 2/3] dt-bindings: mtd: add DT binding for s3c2410 flash
 controller
Date: Wed, 19 Oct 2016 17:52:04 -0200
Message-Id: <1476906725-22613-3-git-send-email-sergio.prado@e-labworks.com>
In-Reply-To: <1476906725-22613-1-git-send-email-sergio.prado@e-labworks.com>
References: <1476906725-22613-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adds the device tree bindings description for Samsung S3C2410 and
compatible NAND flash controller.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 .../devicetree/bindings/mtd/samsung-s3c2410.txt    | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt

diff --git a/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt b/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
new file mode 100644
index 000000000000..0040eb8895e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
@@ -0,0 +1,56 @@
+* Samsung S3C2410 and compatible NAND flash controller
+
+Required properties:
+- compatible : The possible values are:
+	"samsung,s3c2410-nand"
+	"samsung,s3c2412-nand"
+	"samsung,s3c2440-nand"
+- reg : register's location and length.
+- #address-cells, #size-cells : see nand.txt
+- clocks : phandle to the nand controller clock
+- clock-names : must contain "nand"
+
+Optional child nodes:
+Child nodes representing the available nand chips.
+
+Optional child properties:
+- nand-ecc-mode : see nand.txt
+- nand-on-flash-bbt : see nand.txt
+
+Each child device node may optionally contain a 'partitions' sub-node,
+which further contains sub-nodes describing the flash partition mapping.
+See partition.txt for more detail.
+
+Example:
+
+nand-controller@4e000000 {
+	compatible = "samsung,s3c2440-nand";
+	reg = <0x4e000000 0x40>;
+
+	#address-cells = <1>;
+        #size-cells = <0>;
+
+	clocks = <&clocks HCLK_NAND>;
+	clock-names = "nand";
+
+	nand {
+		nand-ecc-mode = "soft";
+		nand-on-flash-bbt;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0 0x040000>;
+			};
+
+			partition@40000 {
+				label = "kernel";
+				reg = <0x040000 0x500000>;
+			};
+		};
+	};
+};
-- 
1.9.1

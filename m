Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5gKl-0006N1-F6
 for linux-mtd@lists.infradead.org; Wed, 25 May 2016 21:27:20 +0000
Received: by mail-pa0-x22a.google.com with SMTP id xk12so21419960pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 25 May 2016 14:26:58 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: dwmw2@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 devicetree@vger.kernel.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com,
 Moritz Fischer <moritz.fischer@ettus.com>
Subject: [RFC/PATCH 1/2] doc: bindings: Add bindings documentation for mtd otp
 nvmem
Date: Wed, 25 May 2016 14:26:46 -0700
Message-Id: <1464211607-8843-2-git-send-email-moritz.fischer@ettus.com>
In-Reply-To: <1464211607-8843-1-git-send-email-moritz.fischer@ettus.com>
References: <1464211607-8843-1-git-send-email-moritz.fischer@ettus.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adds documentation describing the bindings for
exposing mtd flash otp regions as nvmem providers via devicetree.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 .../devicetree/bindings/mtd/otp-nvmem.txt          | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/otp-nvmem.txt

diff --git a/Documentation/devicetree/bindings/mtd/otp-nvmem.txt b/Documentation/devicetree/bindings/mtd/otp-nvmem.txt
new file mode 100644
index 0000000..a83a7da
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/otp-nvmem.txt
@@ -0,0 +1,62 @@
+Representing OTP regions in devicetree
+
+OTP regions can be represented by sub-nodes of an mtd device.
+
+The partition table should be a subnode of the mtd node and should be names
+'otp-partitions'. This node should have the following property:
+
+- compatible: (required) must be 'fixed-partitions'
+
+OTP regions are then defined in subnodes of the partitions node.
+
+Required properties for OTP regions:
+- reg: The region's offset and size within the mtd device
+
+Optional properties:
+- label: The label / name for this region. If ommited, the label is taken
+  from the node name (excluding the unit address).
+
+Example:
+
+flash@0 {
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "uboot-spl";
+			reg = <0x0 0xe0000>;
+		};
+		partition@1 {
+			label = "uboot-env";
+			reg = <0xe0000 0x20000>;
+		};
+		partition@2 {
+			label = "uboot";
+			reg = <0x100000 0x100000>;
+		};
+	};
+
+	otp-partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		region@0 {
+			label = "factory-data";
+			reg = <0x0 0x40>;
+
+			#address-cells = <0x1>;
+			#size-cells = <0x1>;
+
+			product: nvmem@0 {
+				reg = <0x0 0x2>;
+			};
+
+			revision: nvmem@3 {
+				reg = <0x3 0x2>;
+			};
+		};
+	};
+}
-- 
2.5.5

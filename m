Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdz7r-0000Ey-5v
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 14:32:52 +0000
Received: by mail-lf0-x244.google.com with SMTP id y200-v6so27367614lfd.7
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 07:32:39 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] dt-bindings: mtd: explicitly document nesting
 partitions descriptions
Date: Fri, 13 Jul 2018 16:32:20 +0200
Message-Id: <20180713143221.8474-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

Documentation was already saying that fixed and dynamic partitioning can
be mixed but was missing a clear description and examples. This commit
adds a proper documentation of how descriptions can be nested and how
layouts can be mixed.

This addition is important for partitions that contain subpartitions.
In such cases partitions have to be properly described in order to let
system handle them correctly.

Depending on situation, nesting descriptions may provide more accurate
logic/structure and/or allow mixing partitioning types (various
"compatible" values).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Rewrote example: I can include "brcm,trx" now as its Documentation
    has been pushed into mtd git tree.
    Updated commit message.
---
 .../devicetree/bindings/mtd/partition.txt          | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index a8f382642ba9..afbbd870496d 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -14,6 +14,13 @@ method is used for a given flash device. To describe the method there should be
 a subnode of the flash device that is named 'partitions'. It must have a
 'compatible' property, which is used to identify the method to use.
 
+When a single partition is represented with a DT node (it depends on a used
+format) it may also be described using above rules ('compatible' and optionally
+some extra properties / subnodes). It allows describing more complex,
+hierarchical (multi-level) layouts and should be used if there is some
+significant relation between partitions or some partition internally uses
+another partitioning method.
+
 Available bindings are listed in the "partitions" subdirectory.
 
 
@@ -109,3 +116,42 @@ flash@2 {
 		};
 	};
 };
+
+flash@3 {
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "bootloader";
+			reg = <0x000000 0x100000>;
+			read-only;
+		};
+
+		firmware@100000 {
+			label = "firmware";
+			reg = <0x100000 0xe00000>;
+			compatible = "brcm,trx";
+		};
+
+		calibration@f00000 {
+			label = "calibration";
+			reg = <0xf00000 0x100000>;
+			compatible = "fixed-partitions";
+			ranges = <0 0xf00000 0x100000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "wifi0";
+				reg = <0x000000 0x080000>;
+			};
+
+			partition@80000 {
+				label = "wifi1";
+				reg = <0x080000 0x080000>;
+			};
+		};
+	};
+};
-- 
2.13.7

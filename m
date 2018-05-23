Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLXNN-0001XB-IK
 for linux-mtd@lists.infradead.org; Wed, 23 May 2018 17:16:48 +0000
Received: by mail-wr0-x243.google.com with SMTP id k5-v6so15771953wrn.3
 for <linux-mtd@lists.infradead.org>; Wed, 23 May 2018 10:16:26 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: mtd: explicitly describe nesting partitions
Date: Wed, 23 May 2018 19:14:47 +0200
Message-Id: <20180523171448.26234-1-zajec5@gmail.com>
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
adds a proper description of how partitions can be nested and how layout
descriptions can be mixed.

This addition is important for partitions that contain subpartitions.
It's useful to have parent partition registered (e.g. for overwriting
purposes) as well as children ones (for accessing data). It's also
required when a single partition uses different partitioning method
(e.g. vendor custom "firmware" partition with kernel + rootfs).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
Another example (I couldn't put in Documentation yet) could be:

flash@0 {
	partitions {
		compatible = "fixed-partitions";
		#address-cells = <1>;
		#size-cells = <1>;

		partition@0 {
			label = "bootloader";
			reg = <0x0000000 0x0100000>;
			read-only;
		};

		firmware@100000 {
			label = "firmware";
			reg = <0x0100000 0x0800000>;
			compatible = "brcm,trx";
		};
	};
};

It's probably even more realistic one, but we don't describe "brcm,trx"
binding yet.

The purpose of above description would be to:
1) Specify fixed partitions (they never change)
2) Tell operating system that "firmware" partition uses Broadcom's TRX
   format which is a container for 2 or 3 subpartitions (usually: kernel
   and rootfs).
---
 .../devicetree/bindings/mtd/partition.txt          | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index a8f382642ba9..2214167ce88a 100644
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
 
 
@@ -73,6 +80,24 @@ flash@0 {
 		uimage@100000 {
 			reg = <0x0100000 0x200000>;
 		};
+
+		calibration@200000 {
+			label = "calibration";
+			reg = <0x0200000 0x100000>;
+			compatible = "fixed-partitions";
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
 	};
 };
 
-- 
2.13.6

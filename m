Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrZWu-000305-7r
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 22:49:16 +0000
Received: by pacfv9 with SMTP id fv9so20360366pac.3
 for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2015 15:48:54 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: devicetree-spec@vger.kernel.org
Cc: <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v4] doc: dt: mtd: support partitions in a special 'partitions'
 subnode
Date: Wed, 28 Oct 2015 15:48:06 -0700
Message-Id: <1446072486-145169-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michal Suchanek <hramrach@gmail.com>

To avoid conflict with other drivers using subnodes of the mtd device
create only one ofpart-specific node rather than any number of
arbitrary partition subnodes.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 .../devicetree/bindings/mtd/partition.txt          | 71 +++++++++++++---------
 1 file changed, 42 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index 8e5557da1955..f1e2a02381a4 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -4,10 +4,17 @@ Partitions can be represented by sub-nodes of an mtd device. This can be used
 on platforms which have strong conventions about which portions of a flash are
 used for what purposes, but which don't use an on-flash partition table such
 as RedBoot.
-NOTE: if the sub-node has a compatible string, then it is not a partition.
 
-#address-cells & #size-cells must both be present in the mtd device. There are
-two valid values for both:
+The partition table should be a subnode of the mtd node and should be named
+'partitions'. Partitions are defined in subnodes of the partitions node.
+
+For backwards compatibility partitions as direct subnodes of the mtd device are
+supported. This use is discouraged.
+NOTE: also for backwards compatibility, direct subnodes that have a compatible
+string are not considered partitions, as they may be used for other bindings.
+
+#address-cells & #size-cells must both be present in the partitions subnode of the
+mtd device. There are two valid values for both:
 <1>: for partitions that require a single 32-bit cell to represent their
      size/address (aka the value is below 4 GiB)
 <2>: for partitions that require two 32-bit cells to represent their
@@ -28,44 +35,50 @@ Examples:
 
 
 flash@0 {
-	#address-cells = <1>;
-	#size-cells = <1>;
+	partitions {
+		#address-cells = <1>;
+		#size-cells = <1>;
 
-	partition@0 {
-		label = "u-boot";
-		reg = <0x0000000 0x100000>;
-		read-only;
-	};
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0000000 0x100000>;
+			read-only;
+		};
 
-	uimage@100000 {
-		reg = <0x0100000 0x200000>;
+		uimage@100000 {
+			reg = <0x0100000 0x200000>;
+		};
 	};
 };
 
 flash@1 {
-	#address-cells = <1>;
-	#size-cells = <2>;
+	partitions {
+		#address-cells = <1>;
+		#size-cells = <2>;
 
-	/* a 4 GiB partition */
-	partition@0 {
-		label = "filesystem";
-		reg = <0x00000000 0x1 0x00000000>;
+		/* a 4 GiB partition */
+		partition@0 {
+			label = "filesystem";
+			reg = <0x00000000 0x1 0x00000000>;
+		};
 	};
 };
 
 flash@2 {
-	#address-cells = <2>;
-	#size-cells = <2>;
+	partitions {
+		#address-cells = <2>;
+		#size-cells = <2>;
 
-	/* an 8 GiB partition */
-	partition@0 {
-		label = "filesystem #1";
-		reg = <0x0 0x00000000 0x2 0x00000000>;
-	};
+		/* an 8 GiB partition */
+		partition@0 {
+			label = "filesystem #1";
+			reg = <0x0 0x00000000 0x2 0x00000000>;
+		};
 
-	/* a 4 GiB partition */
-	partition@200000000 {
-		label = "filesystem #2";
-		reg = <0x2 0x00000000 0x1 0x00000000>;
+		/* a 4 GiB partition */
+		partition@200000000 {
+			label = "filesystem #2";
+			reg = <0x2 0x00000000 0x1 0x00000000>;
+		};
 	};
 };
-- 
2.6.0.rc2.230.g3dd15c0

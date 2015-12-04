Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4fid-0003Lo-Mp
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 02:03:32 +0000
Received: by pacej9 with SMTP id ej9so78686192pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 03 Dec 2015 18:03:10 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Simon Arlott <simon@fire.lp0.eu>, Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH for-4.4 2/2] doc: dt: mtd: partitions: add compatible property
 to "partitions" node
Date: Thu,  3 Dec 2015 18:02:09 -0800
Message-Id: <1449194529-145705-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1449194529-145705-1-git-send-email-computersforpeace@gmail.com>
References: <1449194529-145705-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As noted here [1], there are potentially future conflicts if we try to
use MTD's "partitions" subnode to describe anything besides just the
fixed-in-the-device-tree partitions currently described in this
document. Particularly, there was a proposal to use this node for the
AFS parser too.

It can pose a (small) problem to try to differentiate the following
nodes:

	// using binding as currently specified
	partitions {
		#address-cells = <x>;
		#size-cells = <y>;
		partition@0 {
			...;
		};
	};

and

	// proposed future binding
	partitions {
		compatible = "arm,arm-flash-structure";
	};

It's especially difficult if other uses of this node start having
subnodes.

So, since the "partitions" node is new in v4.4, let's fixup the binding
before release so that it requires a compatible property, so it's much
clearer to distinguish. e.g.:

	// proposed
	partitions {
		compatible = "partitions";
		#address-cells = <x>;
		#size-cells = <y>;
		partition@0 {
			...;
		};
	};

[1] Subject: "mtd: create a partition type device tree binding"
    http://lkml.kernel.org/g/20151113220039.GA74382@google.com
    http://lists.infradead.org/pipermail/linux-mtd/2015-November/063355.html
    http://lists.infradead.org/pipermail/linux-mtd/2015-November/063364.html

Cc: Michal Suchanek <hramrach@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
This one is more of a future proofing patch. We should probably take this for
4.4, before the binding "stabilizes" (I don't actually see any users yet), or
else we'll have to find some other (possibly more complicated) way to avoid
this potential collision on future development.

 Documentation/devicetree/bindings/mtd/partition.txt | 7 ++++++-
 drivers/mtd/ofpart.c                                | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index f1e2a02381a4..047e80575881 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -6,7 +6,9 @@ used for what purposes, but which don't use an on-flash partition table such
 as RedBoot.
 
 The partition table should be a subnode of the mtd node and should be named
-'partitions'. Partitions are defined in subnodes of the partitions node.
+'partitions'. This node should have the following property:
+- compatible : (required) must be "partitions"
+Partitions are then defined in subnodes of the partitions node.
 
 For backwards compatibility partitions as direct subnodes of the mtd device are
 supported. This use is discouraged.
@@ -36,6 +38,7 @@ Examples:
 
 flash@0 {
 	partitions {
+		compatible = "partitions";
 		#address-cells = <1>;
 		#size-cells = <1>;
 
@@ -53,6 +56,7 @@ flash@0 {
 
 flash@1 {
 	partitions {
+		compatible = "partitions";
 		#address-cells = <1>;
 		#size-cells = <2>;
 
@@ -66,6 +70,7 @@ flash@1 {
 
 flash@2 {
 	partitions {
+		compatible = "partitions";
 		#address-cells = <2>;
 		#size-cells = <2>;
 
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 3e9c5857c991..23cd809fad4c 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -55,6 +55,9 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 			 master->name, mtd_node->full_name);
 		ofpart_node = mtd_node;
 		dedicated = false;
+	} else if (!of_device_is_compatible(ofpart_node, "partitions")) {
+		/* The 'partitions' subnode might be used by another parser */
+		return 0;
 	}
 
 	/* First count the subnodes */
-- 
2.6.0.rc2.230.g3dd15c0

Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1CYG-00054X-Bd
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 13:55:18 +0000
Received: by mail-lf0-x243.google.com with SMTP id x72so5902014lfb.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 06:54:55 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/4] dt-bindings: mtd: make partitions doc a bit more generic
Date: Thu, 20 Apr 2017 15:54:28 +0200
Message-Id: <20170420135431.12585-2-zajec5@gmail.com>
In-Reply-To: <20170420135431.12585-1-zajec5@gmail.com>
References: <20170420135431.12585-1-zajec5@gmail.com>
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

From: Brian Norris <computersforpeace@gmail.com>

Currently the only documented partitioning is "fixed-partitions" but
there are more methods in use that we may want to support in the future.
Mention them and make it clear Fixed Partitions are just a single case.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/mtd/partition.txt          | 28 +++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index 81a224da63be..27593adc45c2 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -1,29 +1,45 @@
-Representing flash partitions in devicetree
+Flash partitions in device tree
+===============================
 
-Partitions can be represented by sub-nodes of an mtd device. This can be used
+Flash devices can be partitioned into one or more functional ranges (e.g. "boot
+code", "nvram", "kernel").
+
+Different devices may be partitioned in a different ways. Some may use a fixed
+flash layout set at production time. Some may use on-flash table that describes
+the geometry and naming/purpose of each functional region. It is also possible
+to see these methods mixed.
+
+To assist system software in locating partitions, we provide a binding to
+describe which method is used for a given flash.
+
+
+Fixed Partitions
+================
+
+Partitions can be represented by sub-nodes of a flash device. This can be used
 on platforms which have strong conventions about which portions of a flash are
 used for what purposes, but which don't use an on-flash partition table such
 as RedBoot.
 
-The partition table should be a subnode of the mtd node and should be named
+The partition table should be a subnode of the flash node and should be named
 'partitions'. This node should have the following property:
 - compatible : (required) must be "fixed-partitions"
 Partitions are then defined in subnodes of the partitions node.
 
-For backwards compatibility partitions as direct subnodes of the mtd device are
+For backwards compatibility partitions as direct subnodes of the flash device are
 supported. This use is discouraged.
 NOTE: also for backwards compatibility, direct subnodes that have a compatible
 string are not considered partitions, as they may be used for other bindings.
 
 #address-cells & #size-cells must both be present in the partitions subnode of the
-mtd device. There are two valid values for both:
+flash device. There are two valid values for both:
 <1>: for partitions that require a single 32-bit cell to represent their
      size/address (aka the value is below 4 GiB)
 <2>: for partitions that require two 32-bit cells to represent their
      size/address (aka the value is 4 GiB or greater).
 
 Required properties:
-- reg : The partition's offset and size within the mtd bank.
+- reg : The partition's offset and size within the flash
 
 Optional properties:
 - label : The label / name for this partition.  If omitted, the label is taken
-- 
2.11.0

Received: from xes-mad.com ([216.165.139.218])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8eeE-0006SG-NT
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 22:29:51 +0000
Date: Thu, 21 Feb 2013 16:29:45 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Huang Shijie <b32955@freescale.com>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2] mtd: ofpart: support partitions of 4 GB and larger
Message-ID: <9b66b475-1755-4842-b44e-4948ed7ed9d4@zimbra>
In-Reply-To: <0da230c4-1d54-411d-ac99-93c6052c154f@zimbra>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Joe Schaack <jschaack@xes-inc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Joe Schaack <jschaack@xes-inc.com>

Previously, partitions were limited to less than 4 GB in size because
the address and size were read as 32-bit values. Add support for 64-bit
values to support devices of 4 GB and larger.

Signed-off-by: Joe Schaack <jschaack@xes-inc.com>
Signed-off-by: Nate Case <ncase@xes-inc.com>
Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 .../devicetree/bindings/mtd/partition.txt          |   36 ++++++++++++++++++--
 drivers/mtd/ofpart.c                               |    7 ++--
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index 6e1f61f..8f354bc 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -5,8 +5,12 @@ on platforms which have strong conventions about which portions of a flash are
 used for what purposes, but which don't use an on-flash partition table such
 as RedBoot.
 
-#address-cells & #size-cells must both be present in the mtd device and be
-equal to 1.
+#address-cells & #size-cells must both be present in the mtd device. There are
+two valid values for both:
+<1>: for partitions that require a single 32-bit cell to represent their
+     size/address (aka the value is below 4 GB)
+<2>: for partitions that require two 32-bit cells to represent their
+     size/address (aka the value is 4 GB or greater).
 
 Required properties:
 - reg : The partition's offset and size within the mtd bank.
@@ -36,3 +40,31 @@ flash@0 {
 		reg = <0x0100000 0x200000>;
 	};
 };
+
+flash@1 {
+	#address-cells = <1>;
+	#size-cells = <2>;
+
+	/* a 4 GB partition */
+	partition@0 {
+		label = "filesystem";
+		reg = <0x00000000 0x1 0x00000000>;
+	};
+};
+
+flash@2 {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	/* an 8 GB partition */
+	partition@0 {
+		label = "filesystem #1";
+		reg = <0x0 0x00000000 0x2 0x00000000>;
+	};
+
+	/* a 4 GB partition */
+	partition@200000000 {
+		label = "filesystem #2";
+		reg = <0x2 0x00000000 0x1 0x00000000>;
+	};
+};
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 30bd907..553d6d6 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -55,6 +55,7 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 	while ((pp = of_get_next_child(node, pp))) {
 		const __be32 *reg;
 		int len;
+		int a_cells, s_cells;
 
 		reg = of_get_property(pp, "reg", &len);
 		if (!reg) {
@@ -62,8 +63,10 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 			continue;
 		}
 
-		(*pparts)[i].offset = be32_to_cpu(reg[0]);
-		(*pparts)[i].size = be32_to_cpu(reg[1]);
+		a_cells = of_n_addr_cells(pp);
+		s_cells = of_n_size_cells(pp);
+		(*pparts)[i].offset = of_read_number(reg, a_cells);
+		(*pparts)[i].size = of_read_number(reg + a_cells, s_cells);
 
 		partname = of_get_property(pp, "label", &len);
 		if (!partname)
-- 
1.7.9.5

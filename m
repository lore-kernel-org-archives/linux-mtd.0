Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwhJO-0007jz-JL
 for linux-mtd@lists.infradead.org; Tue, 26 Sep 2017 04:17:37 +0000
From: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 ezequiel.garcia@free-electrons.com, devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chris.packham@alliedtelesis.co.nz,
 Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
Subject: [PATCH 1/2] dt-bindings: mtd: pxa3xx: Add "marvell,
 nand-force-csx" compatible string
Date: Tue, 26 Sep 2017 17:16:59 +1300
Message-Id: <20170926041700.22663-2-kalyan.kinthada@alliedtelesis.co.nz>
In-Reply-To: <20170926041700.22663-1-kalyan.kinthada@alliedtelesis.co.nz>
References: <20170926041700.22663-1-kalyan.kinthada@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the arbitration between NOR and NAND flash is enabled
the <FORCE_CSX> field bit[21] in the Data Flash Control Register
needs to be set to 1 according to guidleine GL-5830741.

This patch introduces a new compatible string "marvell,nand-force-csx"
which is activated through device tree to implement the guideline
GL-5830741.

Signed-off-by: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
---
 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
index d9b655f11048..157ca7efa3d3 100644
--- a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
@@ -20,6 +20,7 @@ Optional properties:
 				not present false
  - nand-ecc-strength:           number of bits to correct per ECC step
  - nand-ecc-step-size:          number of data bytes covered by a single ECC step
+ - marvell,nand-force-csx:      Set to implement guideline when arbitration of NAND and NOR flash is enabled.
 
 The following ECC strength and step size are currently supported:
 
-- 
2.14.1

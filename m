Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ald6P-0004X1-Cg
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2016 13:57:38 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: [PATCH] mtd: nand: document the NAND controller/NAND chip DT
 representation
Date: Thu, 31 Mar 2016 15:57:13 +0200
Message-Id: <1459432633-23162-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Standardize the NAND controller/NAND chip DT representation. Now, all new
NAND controller drivers should comply with this representation, even if
they are only supporting a single NAND chip.

Existing drivers can keep support for the old representation (where only
the NAND chip was described), but are encouraged to also support the new
one.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 Documentation/devicetree/bindings/mtd/nand.txt | 37 +++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index b53f92e..fbf5677 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -1,4 +1,23 @@
-* MTD generic binding
+* NAND chip and NAND controller generic binding
+
+NAND controller/NAND chip representation:
+
+The NAND controller should be represented with it's own DT node, and all
+NAND chips attached to this controller should be defined as children nodes
+of the NAND controller. This representation should be enforced even for
+simple controllers supporting only one chip.
+
+Mandatory NAND controller properties:
+- #address-cells: depends on your controller. Should at least be 1 to
+		  encode the CS line id.
+- #size-cells: depends on your controller. Put zero unless you need a
+	       mapping between CS lines and dedicated memory regions
+
+Optional NAND controller properties
+- ranges: only needed if you need to define a mapping between CS lines and
+	  memory regions
+
+Optional NAND chip properties:
 
 - nand-ecc-mode : String, operation mode of the NAND ecc mode.
   Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
@@ -19,3 +38,19 @@ errors per {size} bytes".
 The interpretation of these parameters is implementation-defined, so not all
 implementations must support all possible combinations. However, implementations
 are encouraged to further specify the value(s) they support.
+
+Example:
+
+	nand-controller {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* controller specific properties */
+
+		nand@0 {
+			reg = <0>;
+			nand-ecc-mode = "soft_bch";
+
+			/* controller specific properties */
+		};
+	};
-- 
2.5.0

Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFpll-0002Yb-7q
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 18:51:50 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 2/2] mtd: nand: Add a devicetree binding for ECC strength
 and ECC step size
Date: Tue, 18 Feb 2014 15:51:14 -0300
Message-Id: <1392749474-12936-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1392749474-12936-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1392749474-12936-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Grant Likely <grant.likely@secretlab.ca>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some flashes can only be properly accessed when the ECC mode is
specified, so a way to describe such mode is required.

Together, the ECC strength and step size define the correction capability,
so that we say we will correct "{strength} bit errors per {size} bytes".

The interpretation of these parameters is implementation-defined, but they
often have ramifications on the formation, interpretation, and placement of
correction metadata on the flash. Not all implementations must support all
possible combinations. Implementations are encouraged to further define the
value(s) they support.

Acked-by: Grant Likely <grant.likely@secretlab.ca>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
Brian,

Feel free to rephrase or improve the explanation below as you whish.

 Documentation/devicetree/bindings/mtd/nand.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index 03855c8..b53f92e 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -5,3 +5,17 @@
   "soft_bch".
 - nand-bus-width : 8 or 16 bus width if not present 8
 - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
+
+- nand-ecc-strength: integer representing the number of bits to correct
+		     per ECC step.
+
+- nand-ecc-step-size: integer representing the number of data bytes
+		      that are covered by a single ECC step.
+
+The ECC strength and ECC step size properties define the correction capability
+of a controller. Together, they say a controller can correct "{strength} bit
+errors per {size} bytes".
+
+The interpretation of these parameters is implementation-defined, so not all
+implementations must support all possible combinations. However, implementations
+are encouraged to further specify the value(s) they support.
-- 
1.8.1.5

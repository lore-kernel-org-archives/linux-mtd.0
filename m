Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQxjm-0001Ra-QS
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 11:35:48 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 4/4] mtd: nand: pxa3xx: Add supported ECC strength and step
 size to the DT binding
Date: Fri, 21 Mar 2014 08:34:50 -0300
Message-Id: <1395401690-25221-5-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Simon Guinot <sguinot@lacie.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit updates the devicetree binding documentation for this driver
with the supported ECC strength and step size combinations.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
index 86e0a56..650c0dc 100644
--- a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
@@ -17,6 +17,14 @@ Optional properties:
  - num-cs:			Number of chipselect lines to usw
  - nand-on-flash-bbt: 		boolean to enable on flash bbt option if
 				not present false
+ - nand-ecc-strength:           number of bits to correct per ECC step
+ - nand-ecc-step-size:          number of data bytes covered by a single ECC step
+
+The following ECC strength and step size are currently supported:
+
+ - nand-ecc-strength = <1>, nand-ecc-step-size = <512>   (aka Hamming)
+ - nand-ecc-strength = <16>, nand-ecc-step-size = <2048> (aka BCH-4)
+ - nand-ecc-strength = <16>, nand-ecc-step-size = <1024> (aka BCH-8)
 
 Example:
 
-- 
1.9.0

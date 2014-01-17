Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W48J2-0006pa-K0
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 12:13:49 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <devicetree@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: [RFC/PATCH 1/1] mtd: nand: Add a devicetree binding for ECC strength
 and ECC step size
Date: Fri, 17 Jan 2014 09:13:40 -0300
Message-Id: <1389960820-18696-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some flashes can only be properly accessed when the ECC mode is
specified, and a way to describe such mode is required.

Such ECC mode is completely driver-specific so instead of having one binding
per compatible-string, let's add generic ECC strength and ECC step size.
Driver's can choose the appropriate ECC mode, based on this specification.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 Documentation/devicetree/bindings/mtd/nand.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index 03855c8..683a310 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -3,5 +3,9 @@
 - nand-ecc-mode : String, operation mode of the NAND ecc mode.
   Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
   "soft_bch".
+- nand-ecc-strength : integer ECC required strength.
+- nand-ecc-size : integer step size associated to the ECC strength.
+  The exact meaning of the ECC strength and ECC size parameters is completely
+  driver-specific.
 - nand-bus-width : 8 or 16 bus width if not present 8
 - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
-- 
1.8.1.5

Received: from mout.perfora.net ([74.208.4.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgQEi-0006lT-Ng
 for linux-mtd@lists.infradead.org; Fri, 20 Jul 2018 07:54:04 +0000
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-mtd@lists.infradead.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] mtd: nand: fix spelling in driver api documentation
Date: Fri, 20 Jul 2018 09:53:33 +0200
Message-Id: <20180720075334.24254-1-marcel@ziswiler.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

This fixes some spelling mistakes.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 Documentation/driver-api/mtdnand.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/mtdnand.rst b/Documentation/driver-api/mtdnand.rst
index dcd63599f700..c55a6034c397 100644
--- a/Documentation/driver-api/mtdnand.rst
+++ b/Documentation/driver-api/mtdnand.rst
@@ -374,7 +374,7 @@ The nand driver supports three different types of hardware ECC.
 
 -  NAND_ECC_HW8_512
 
-   Hardware ECC generator providing 6 bytes ECC per 512 byte.
+   Hardware ECC generator providing 8 bytes ECC per 512 byte.
 
 If your hardware generator has a different functionality add it at the
 appropriate place in nand_base.c
@@ -889,7 +889,7 @@ Use these constants to select the ECC algorithm::
     #define NAND_ECC_HW3_512    3
     /* Hardware ECC 6 byte ECC per 512 Byte data */
     #define NAND_ECC_HW6_512    4
-    /* Hardware ECC 6 byte ECC per 512 Byte data */
+    /* Hardware ECC 8 byte ECC per 512 Byte data */
     #define NAND_ECC_HW8_512    6
 
 
-- 
2.14.4

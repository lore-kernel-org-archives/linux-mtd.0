Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLYnK-0003wF-8v
 for linux-mtd@lists.infradead.org; Wed, 11 Feb 2015 15:01:39 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: sunxi: fix generic nand binding reference
Date: Wed, 11 Feb 2015 17:01:07 +0200
Message-Id: <302c93d229b98702db0c96bca0216a3c948fe092.1423666867.git.baruch@tkos.co.il>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
index 0273adb8638c..086d6f44c4b9 100644
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -21,7 +21,7 @@ Optional properties:
 - nand-ecc-mode : one of the supported ECC modes ("hw", "hw_syndrome", "soft",
   "soft_bch" or "none")
 
-see Documentation/devicetree/mtd/nand.txt for generic bindings.
+see Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
 
 
 Examples:
-- 
2.1.4

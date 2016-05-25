Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5Pm0-0002Iv-1n
 for linux-mtd@lists.infradead.org; Wed, 25 May 2016 03:46:21 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Baruch Siach <baruch@tkos.co.il>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] Documentation: dt: mtd: drop "soft_bch" from example
Date: Wed, 25 May 2016 06:45:10 +0300
Message-Id: <a206ce4cabf9ba8d376241fc23e9973f6db2443b.1464147910.git.baruch@tkos.co.il>
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

Commit 32698aafc9f0 (Documentation: devicetree: deprecate "soft_bch"
nand-ecc-mode value, 2016-04-22) deprecated "soft_bch". Update the example to
match.

Cc: Rafał Miłecki <zajec5@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/devicetree/bindings/mtd/nand.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index 68342eac2383..3733300de8dd 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -53,7 +53,8 @@ Example:
 
 		nand@0 {
 			reg = <0>;
-			nand-ecc-mode = "soft_bch";
+			nand-ecc-mode = "soft";
+			nand-ecc-algo = "bch";
 
 			/* controller specific properties */
 		};
-- 
2.8.1

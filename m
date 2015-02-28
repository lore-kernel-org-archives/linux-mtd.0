Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRdel-0005ao-Ek
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 09:25:56 +0000
Received: by pdbnh10 with SMTP id nh10so1014297pdb.4
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 01:25:34 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] Documentation: devicetree: fix spelling in pxa3xx-nand binding
Date: Sat, 28 Feb 2015 01:25:17 -0800
Message-Id: <1425115517-4411-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
index de8b517a5521..4f833e3c4f51 100644
--- a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
@@ -14,7 +14,7 @@ Optional properties:
  - marvell,nand-enable-arbiter:	Set to enable the bus arbiter
  - marvell,nand-keep-config:	Set to keep the NAND controller config as set
 				by the bootloader
- - num-cs:			Number of chipselect lines to usw
+ - num-cs:			Number of chipselect lines to use
  - nand-on-flash-bbt: 		boolean to enable on flash bbt option if
 				not present false
  - nand-ecc-strength:           number of bits to correct per ECC step
-- 
2.1.0

Received: from mo6-p04-ob.smtp.rzone.de ([2a01:238:20a:202:5304::5])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xtzum-0005Fz-2N
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 14:19:25 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: gpmi: Remove "We support only one NAND chip" from
 bindings doc
Date: Thu, 27 Nov 2014 15:18:49 +0100
Message-Id: <1417097929-17832-1-git-send-email-sr@denx.de>
Cc: devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This sentence "We support only one NAND chip now" is not true any more.
Multiple chips are supported. So lets remove this sentence to not
confuse anyone.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Huang Shijie <b32955@freescale.com>
Cc: Brian Norris <computersforpeace@gmail.com>
---
 Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
index a011fdf..d02acaf 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -1,7 +1,7 @@
 * Freescale General-Purpose Media Interface (GPMI)
 
 The GPMI nand controller provides an interface to control the
-NAND flash chips. We support only one NAND chip now.
+NAND flash chips.
 
 Required properties:
   - compatible : should be "fsl,<chip>-gpmi-nand"
-- 
2.2.0

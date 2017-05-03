Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5tFc-0004Fm-W9
 for linux-mtd@lists.infradead.org; Wed, 03 May 2017 12:19:28 +0000
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] mtd: nand: gpio: update binding
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Message-Id: <20170503121824.DD82C67889@pc13941vm.idsi0.si.c-s.fr>
Date: Wed,  3 May 2017 14:18:24 +0200 (CEST)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch updates the binding documentation in accordance with
commit 44dd182861f99 ("mtd: nand: gpio: make nCE GPIO optional")

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reported-by: Brian Norris <computersforpeace@gmail.com>
---
 Documentation/devicetree/bindings/mtd/gpio-control-nand.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
index af8915b41ccf..486a17d533d7 100644
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -12,7 +12,7 @@ Required properties:
 - #address-cells, #size-cells : Must be present if the device has sub-nodes
   representing partitions.
 - gpios : Specifies the GPIO pins to control the NAND device.  The order of
-  GPIO references is:  RDY, nCE, ALE, CLE, and an optional nWP.
+  GPIO references is:  RDY, nCE, ALE, CLE, and nWP. nCE and nWP are optional.
 
 Optional properties:
 - bank-width : Width (in bytes) of the device.  If not present, the width
@@ -36,7 +36,7 @@ gpio-nand@1,0 {
 	#address-cells = <1>;
 	#size-cells = <1>;
 	gpios = <&banka 1 0>,	/* RDY */
-		<&banka 2 0>, 	/* nCE */
+		<0>, 		/* nCE */
 		<&banka 3 0>, 	/* ALE */
 		<&banka 4 0>, 	/* CLE */
 		<0>;		/* nWP */
-- 
2.12.0

Received: from mail-yb0-f195.google.com ([209.85.213.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNedx-0000wc-7w
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 12:21:58 +0000
Received: by mail-yb0-f195.google.com with SMTP id g206so5791874yba.2
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2017 05:21:36 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] dt-bindings: mtd: elm: Correct compatible string requirement
Date: Wed, 21 Jun 2017 08:22:06 -0400
Message-Id: <1498047726-31398-1-git-send-email-trini@konsulko.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The binding says that the compatible string must be "ti,am33xx-elm"
but the code checks only for, and all functioning users set, this as
"ti,am3352-elm" so correct the binding.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
I have submitted a separate patch that correct the dm816x.dtsi to set
the compatible string there for the elm from ti,816-elm to ti,am3352-elm
and tested it on the hardware, where it works.  It is quite likely that
dm814x.dtsi can be trivially corrected as it came after dm816x and
before am335x but as I cannot test the hardware, I did not update that.
---
 Documentation/devicetree/bindings/mtd/elm.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/elm.txt b/Documentation/devicetree/bindings/mtd/elm.txt
index 8c1528c421d4..59ddc61c1076 100644
--- a/Documentation/devicetree/bindings/mtd/elm.txt
+++ b/Documentation/devicetree/bindings/mtd/elm.txt
@@ -1,7 +1,7 @@
 Error location module
 
 Required properties:
-- compatible: Must be "ti,am33xx-elm"
+- compatible: Must be "ti,am3352-elm"
 - reg: physical base address and size of the registers map.
 - interrupts: Interrupt number for the elm.
 
-- 
1.9.1

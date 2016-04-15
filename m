Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ar3WQ-0005B6-Rm
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 13:10:56 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com
Subject: [PATCH v3 2/2] mtd: nand: sunxi: update DT bindings
Date: Fri, 15 Apr 2016 15:10:31 +0200
Message-Id: <1460725831-9736-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1460725831-9736-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1460725831-9736-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Document dmas and dma-names properties.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
index 086d6f4..6fdf8f6 100644
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -11,6 +11,10 @@ Required properties:
     * "ahb" : AHB gating clock
     * "mod" : nand controller clock
 
+Optional properties:
+- dmas : shall reference DMA channel associated to the NAND controller.
+- dma-names : shall be "rxtx".
+
 Optional children nodes:
 Children nodes represent the available nand chips.
 
-- 
2.5.0

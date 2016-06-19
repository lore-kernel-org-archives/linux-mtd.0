Received: from forward17j.cmail.yandex.net ([2a02:6b8:0:1630::f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEb3c-0007yg-3v
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 11:38:32 +0000
From: Icenowy Zheng <icenowy@aosc.xyz>
To: maxime.ripard@free-electrons.com, wens@csie.org,
 boris.brezillon@free-electrons.com
Cc: robh+dt@kernel.org, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 1/2] mtd: nand: sunxi: update DT bindings
Date: Sun, 19 Jun 2016 19:37:38 +0800
Message-Id: <20160619113739.30362-1-icenowy@aosc.xyz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Document the reset lines

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
index 086d6f4..a328fbb 100644
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -15,6 +15,8 @@ Optional children nodes:
 Children nodes represent the available nand chips.
 
 Optional properties:
+- reset : phandle + reset specifier pair
+- reset-names : must contain "ahb"
 - allwinner,rb : shall contain the native Ready/Busy ids.
  or
 - rb-gpios : shall contain the gpios used as R/B pins.
-- 
2.8.1

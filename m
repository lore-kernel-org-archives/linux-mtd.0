From: Icenowy Zheng <icenowy@aosc.xyz>
To: maxime.ripard@free-electrons.com, wens@csie.org,
 boris.brezillon@free-electrons.com
Cc: robh+dt@kernel.org, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH v2 1/2] mtd: nand: sunxi: update DT bindings
Date: Sun, 19 Jun 2016 22:52:35 +0800
Message-Id: <20160619145236.43769-1-icenowy@aosc.xyz>
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
Changes in v2:
  - Nothing.

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
2.9.0

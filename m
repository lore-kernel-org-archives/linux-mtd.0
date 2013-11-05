From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 02/28] ARM: mvebu: Add Core Divider clock device-tree
 binding
Date: Tue,  5 Nov 2013 09:55:09 -0300
Message-Id: <1383656135-8627-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1383656135-8627-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1383656135-8627-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Armada 370/XP SoCs have a Core Divider clock providing
several clocks. For now, only the NAND clock is supported.

Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 .../devicetree/bindings/clock/mvebu-corediv-clock.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt b/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt
new file mode 100644
index 0000000..c62391f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt
@@ -0,0 +1,19 @@
+* Core Divider Clock bindings for Marvell MVEBU SoCs
+
+The following is a list of provided IDs and clock names on Armada 370/XP:
+ 0 = nand (NAND clock)
+
+Required properties:
+- compatible : must be "marvell,armada-370-corediv-clock"
+- reg : must be the register address of Core Divider control register
+- #clock-cells : from common clock binding; shall be set to 1
+- clocks : must be set to the parent's phandle
+
+Example:
+
+corediv_clk: corediv-clocks@18740 {
+	compatible = "marvell,armada-370-corediv-clock";
+	reg = <0x18740 0xc>;
+	#clock-cells = <1>;
+	clocks = <&pll>;
+};
-- 
1.8.1.5

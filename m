Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMgh2-00015i-Qm
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:03:07 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 18/21] ARM: mvebu: Add a fixed 0Hz clock to represent NAND
 clock
Date: Thu, 19 Sep 2013 13:01:42 -0300
Message-Id: <1379606505-2529-19-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
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

The NAND controller in Armada 370 and Armada XP SoC has an input clock
that's either 125 MHz or 200 MHz. As a temporary representation, this
commit adds a 0Hz fixed-clock compatible DT node.

Not-Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
Of course, this is not intended for inclusion and I'm adding it to the
series only to allow the driver's probe() to get the clock.

This clock shouldn't be used anywhere, which means we must set
"marvell,keep-config" parameter in the NAND device tree node.

 arch/arm/boot/dts/armada-370-xp.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 90b1176..2e00da4 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -37,6 +37,15 @@
 		};
 	};
 
+	clocks {
+		/* NAND reference clock */
+		nandclk: nd_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.8.1.5

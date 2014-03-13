From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Mike Turquette <mturquette@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 2/6] ARM: mvebu: Add a 2 GHz fixed-clock on Armada 38x SoCs
Date: Thu, 13 Mar 2014 17:24:29 -0300
Message-Id: <1394742273-5113-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1394742273-5113-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1394742273-5113-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 sergei.shtylyov@cogentembedded.com, Tawfik Bayouk <tawfik@marvell.com>,
 Andrew Lunn <andrew@lunn.ch>, Seif Mazareeb <seif@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Armada 38x SoCs have a 2 GHz fixed main PLL that is used to feed
other clocks. This commit adds a DT representation of this clock
through a fixed-clock compatible node.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 arch/arm/boot/dts/armada-38x.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index 812ce28..38fc3a0 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -341,6 +341,13 @@
 	};
 
 	clocks {
+		/* 2 GHz fixed main PLL */
+		mainpll: mainpll {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <2000000000>;
+		};
+
 		/* 25 MHz reference crystal */
 		refclk: oscillator {
 			compatible = "fixed-clock";
-- 
1.9.0

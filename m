From: Teresa Remmet <t.remmet@phytec.de>
To: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Brian Norris <briannorris@chromium.org>
Subject: [PATCH] ARM: dts: am335x-phycore-som: Remove partition tables
Date: Mon, 9 Jan 2017 09:37:30 +0100
Message-Id: <1483951050-46588-1-git-send-email-t.remmet@phytec.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As the bootloader passes the NAND and the SPI flash partition tables
there is no need to keep them in the kernel device tree.
Removed them.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 arch/arm/boot/dts/am335x-phycore-som.dtsi | 58 -------------------------------
 1 file changed, 58 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-phycore-som.dtsi b/arch/arm/boot/dts/am335x-phycore-som.dtsi
index 25f5449..14533ff 100644
--- a/arch/arm/boot/dts/am335x-phycore-som.dtsi
+++ b/arch/arm/boot/dts/am335x-phycore-som.dtsi
@@ -211,43 +211,6 @@
 
 		#address-cells = <1>;
 		#size-cells = <1>;
-
-		partition@0 {
-			label = "xload";
-			reg = <0x0 0x20000>;
-		};
-		partition@1 {
-			label = "xload_backup1";
-			reg = <0x20000 0x20000>;
-		};
-		partition@2 {
-			label = "xload_backup2";
-			reg = <0x40000 0x20000>;
-		};
-		partition@3 {
-			label = "xload_backup3";
-			reg = <0x60000 0x20000>;
-		};
-		partition@4 {
-			label = "barebox";
-			reg = <0x80000 0x80000>;
-		};
-		partition@5 {
-			label = "bareboxenv";
-			reg = <0x100000 0x40000>;
-		};
-		partition@6 {
-			label = "oftree";
-			reg = <0x140000 0x40000>;
-		};
-		partition@7 {
-			label = "kernel";
-			reg = <0x180000 0x800000>;
-		};
-		partition@8 {
-			label = "root";
-			reg = <0x980000 0x0>;
-		};
 	};
 };
 
@@ -358,26 +321,5 @@
 		status = "disabled";
 		#address-cells = <1>;
 		#size-cells = <1>;
-
-		partition@0 {
-			label = "xload";
-			reg = <0x0 0x20000>;
-		};
-		partition@1 {
-			label = "barebox";
-			reg = <0x20000 0x80000>;
-		};
-		partition@2 {
-			label = "bareboxenv";
-			reg = <0xa0000 0x20000>;
-		};
-		partition@3 {
-			label = "oftree";
-			reg = <0xc0000 0x20000>;
-		};
-		partition@4 {
-			label = "kernel";
-			reg = <0xe0000 0x0>;
-		};
 	};
 };
-- 
1.9.1

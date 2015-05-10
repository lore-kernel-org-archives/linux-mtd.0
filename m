From: Lucas Stach <dev@lynxeye.de>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>
Subject: [Patch v3 4/5] ARM: tegra: add Tegra20 NAND flash controller node
Date: Sun, 10 May 2015 20:30:01 +0200
Message-Id: <1431282602-7137-5-git-send-email-dev@lynxeye.de>
In-Reply-To: <1431282602-7137-1-git-send-email-dev@lynxeye.de>
References: <1431282602-7137-1-git-send-email-dev@lynxeye.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>,
 Pawel Moll <pawel.moll@arm.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add basic controller description to be extended
by individual boards.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
 arch/arm/boot/dts/tegra20.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index adf6b04..8264cb1 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -373,6 +373,19 @@
 		status = "disabled";
 	};
 
+	nand: nand@70008000 {
+		compatible = "nvidia,tegra20-nand";
+		reg = <0x70008000 0x100>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
+		clock-names = "nand";
+		resets = <&tegra_car 13>;
+		reset-names = "nand";
+		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	pwm: pwm@7000a000 {
 		compatible = "nvidia,tegra20-pwm";
 		reg = <0x7000a000 0x100>;
-- 
2.1.0

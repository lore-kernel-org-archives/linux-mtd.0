From: Lucas Stach <dev@lynxeye.de>
To: Brian Norris <computersforpeace@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Courbot <gnurou@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>
Subject: [PATCH 4/4] ARM: tegra: enable NAND flash on Colibri T20
Date: Sun,  4 Jan 2015 21:39:20 +0100
Message-Id: <1420403960-26626-4-git-send-email-dev@lynxeye.de>
In-Reply-To: <1420403960-26626-1-git-send-email-dev@lynxeye.de>
References: <1420403960-26626-1-git-send-email-dev@lynxeye.de>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This enables the on-module ONFI conformant NAND flash.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index 8e0066a..034d84b 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -455,6 +455,12 @@
 		};
 	};
 
+	nand@70008000 {
+		status = "okay";
+		nand-bus-width = <8>;
+		nvidia,wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_HIGH>;
+	};
+
 	usb@c5004000 {
 		status = "okay";
 		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 1)
-- 
2.1.0

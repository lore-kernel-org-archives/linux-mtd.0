From: Lucas Stach <dev@lynxeye.de>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH v2 5/5] ARM: tegra: enable NAND flash on Colibri T20
Date: Wed,  8 Apr 2015 21:46:10 +0200
Message-Id: <1428522370-18035-6-git-send-email-dev@lynxeye.de>
In-Reply-To: <1428522370-18035-1-git-send-email-dev@lynxeye.de>
References: <1428522370-18035-1-git-send-email-dev@lynxeye.de>
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

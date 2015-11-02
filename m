Received: from ns.lynxeye.de ([87.118.118.114] helo=lynxeye.de)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtLxW-0007rK-Nf
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 20:44:07 +0000
From: Lucas Stach <dev@lynxeye.de>
To: Stephen Warren <swarren@wwwdotorg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Courbot <gnurou@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v4 5/5] ARM: tegra: enable NAND flash on Colibri T20
Date: Mon,  2 Nov 2015 21:33:22 +0100
Message-Id: <1446496402-8142-6-git-send-email-dev@lynxeye.de>
In-Reply-To: <1446496402-8142-1-git-send-email-dev@lynxeye.de>
References: <1446496402-8142-1-git-send-email-dev@lynxeye.de>
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
 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index 8e0066a..f688282 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -455,6 +455,13 @@
 		};
 	};
 
+	nand@70008000 {
+		status = "okay";
+		nand-bus-width = <8>;
+		nand-on-flash-bbt;
+		wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_HIGH>;
+	};
+
 	usb@c5004000 {
 		status = "okay";
 		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 1)
-- 
2.4.3

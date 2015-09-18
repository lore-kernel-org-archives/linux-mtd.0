From: Bayi Cheng <bayi.cheng@mediatek.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <jteki@openedev.com>, <ezequiel@vanduardiasur.com.ar>, Bayi Cheng
 <bayi.cheng@mediatek.com>
Subject: [PATCH v2 3/3] arm64: dts: mt8173: Add nor flash node
Date: Fri, 18 Sep 2015 14:58:53 +0800
Message-ID: <1442559533-17552-4-git-send-email-bayi.cheng@mediatek.com>
In-Reply-To: <1442559533-17552-1-git-send-email-bayi.cheng@mediatek.com>
References: <1442559533-17552-1-git-send-email-bayi.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add Mediatek nor flash node

Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index d18ee42..385c2e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -365,6 +365,21 @@
 			status = "disabled";
 		};
 
+		nor_flash: spi@1100d000 {
+			compatible = "mediatek,mt8173-nor";
+			reg = <0 0x1100d000 0 0xe0>;
+			clocks = <&pericfg CLK_PERI_SPI>,
+				 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
+			clock-names = "spi", "sf";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			flash@0 {
+				compatible = "jedec,spi-nor";
+				reg = <0>;
+			};
+		};
+
 		i2c3: i2c3@11010000 {
 			compatible = "mediatek,mt8173-i2c";
 			reg = <0 0x11010000 0 0x70>,
-- 
1.8.1.1.dirty

From: Bayi Cheng <bayi.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Brian Norris <computersforpeace@gmail.com>, Daniel Kurtz
 <djkurtz@chromium.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>
Subject: [PATCH] arm64: dts: mt8173: Add nor flash node
Date: Mon, 7 Dec 2015 11:53:14 +0800
Message-ID: <1449460394-31601-1-git-send-email-bayi.cheng@mediatek.com>
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
Acked-by: Brian Norris <computersforpeace@gmail.com>
---
Previous version of this patch is
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/386005.html
Drop flash node from mt8173.dtsi accroding review comment

---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 4dd5f93..af08e97 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -387,6 +387,17 @@
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
+			status = "disabled";
+		};
+
 		i2c3: i2c@11010000 {
 			compatible = "mediatek,mt8173-i2c";
 			reg = <0 0x11010000 0 0x70>,
-- 
1.8.1.1.dirty

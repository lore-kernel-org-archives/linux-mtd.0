From: Josh Wu <josh.wu@atmel.com>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] at91: at91sam9n12: add DT parameters to enable PMECC
Date: Wed, 19 Dec 2012 18:27:20 +0800
Message-Id: <1355912840-29501-4-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1355912840-29501-1-git-send-email-josh.wu@atmel.com>
References: <1355912840-29501-1-git-send-email-josh.wu@atmel.com>
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com, Josh Wu <josh.wu@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Default ecc correctable setting is 2bits in 512 bytes.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 arch/arm/boot/dts/at91sam9n12.dtsi  |    1 +
 arch/arm/boot/dts/at91sam9n12ek.dts |    5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91sam9n12.dtsi b/arch/arm/boot/dts/at91sam9n12.dtsi
index 82508d6..c9719ce 100644
--- a/arch/arm/boot/dts/at91sam9n12.dtsi
+++ b/arch/arm/boot/dts/at91sam9n12.dtsi
@@ -213,6 +213,7 @@
 				0xffffe600 0x00000200
 				0x00100000 0x00100000
 			       >;
+			atmel,pmecc-lookup-table-offset = <0x8000 0x10000>;
 			atmel,nand-addr-offset = <21>;
 			atmel,nand-cmd-offset = <22>;
 			gpios = <&pioD 5 0
diff --git a/arch/arm/boot/dts/at91sam9n12ek.dts b/arch/arm/boot/dts/at91sam9n12ek.dts
index 912b2c2..88ee0da 100644
--- a/arch/arm/boot/dts/at91sam9n12ek.dts
+++ b/arch/arm/boot/dts/at91sam9n12ek.dts
@@ -49,7 +49,10 @@
 
 		nand0: nand@40000000 {
 			nand-bus-width = <8>;
-			nand-ecc-mode = "soft";
+			nand-ecc-mode = "hw";
+			atmel,has-pmecc;
+			atmel,pmecc-cap = <2>;
+			atmel,pmecc-sector-size = <512>;
 			nand-on-flash-bbt;
 			status = "okay";
 		};
-- 
1.7.9.5

Received: from mail-yh0-f50.google.com ([209.85.213.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmN4D-0003EH-Kd
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 12:21:06 +0000
Received: by mail-yh0-f50.google.com with SMTP id b6so6578392yha.23
 for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2013 04:20:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dwmw2@infradead.org
Subject: [PATCH v3 36/36] ARM: STi: Add support for the FSM Serial Flash
 Controller
Date: Fri, 29 Nov 2013 12:19:25 +0000
Message-Id: <1385727565-25794-37-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, linus.walleij@linaro.org,
 Lee Jones <lee.jones@linaro.org>, linux-mtd@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here we add the necessary device nodes required for successful device
probing and Pinctrl setup for the FSM.

Cc: Srinivas Kandagatla <srinivas.kandagatla@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih416-b2105.dts    | 14 ++++++++++++++
 arch/arm/boot/dts/stih416-pinctrl.dtsi | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/stih416-b2105.dts b/arch/arm/boot/dts/stih416-b2105.dts
index e518eb0..7acdfdf 100644
--- a/arch/arm/boot/dts/stih416-b2105.dts
+++ b/arch/arm/boot/dts/stih416-b2105.dts
@@ -33,6 +33,20 @@
 			status = "okay";
 		};
 
+		/* FSM */
+		spifsm: spifsm@fe902000{
+		        compatible         = "st,spi-fsm", "simple-bus";
+		        reg                =  <0xfe902000 0x1000>;
+		        reg-names          = "spi-fsm";
+		        pinctrl-0          = <&pinctrl_fsm>;
+
+			st,syscfg	   = <&syscfg_rear>;
+		        st,boot-device-reg = <0x958>;
+		        st,boot-device-spi = <0x1a>;
+
+		        status = "okay";
+		};
+
 		leds {
 			compatible	= "gpio-leds";
 			fp_led {
diff --git a/arch/arm/boot/dts/stih416-pinctrl.dtsi b/arch/arm/boot/dts/stih416-pinctrl.dtsi
index 10bb4df..9a48710 100644
--- a/arch/arm/boot/dts/stih416-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih416-pinctrl.dtsi
@@ -235,6 +235,18 @@
 				};
 			};
 
+			fsm {
+				pinctrl_fsm: fsm {
+					st,pins {
+						spi-fsm-clk     = <&PIO12 2     OUT     ALT1>;
+						spi-fsm-cs      = <&PIO12 3     OUT     ALT1>;
+						spi-fsm-mosi    = <&PIO12 4     OUT     ALT1>;
+						spi-fsm-miso    = <&PIO12 5     IN      ALT1>;
+						spi-fsm-hol     = <&PIO12 6     OUT     ALT1>;
+						spi-fsm-wp      = <&PIO12 7     OUT     ALT1>;
+					};
+				};
+			};
 		};
 
 		pin-controller-rear {
-- 
1.8.3.2

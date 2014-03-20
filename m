Received: from mail-wi0-f172.google.com ([209.85.212.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQZBj-0006bc-Pf
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 09:23:00 +0000
Received: by mail-wi0-f172.google.com with SMTP id hi5so5978603wib.5
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 02:22:34 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com
Subject: [PATCH v6 36/36] ARM: STi: Add support for the FSM Serial Flash
 Controller
Date: Thu, 20 Mar 2014 09:21:08 +0000
Message-Id: <1395307268-12721-37-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
References: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
Cc: dwmw2@infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-mtd@lists.infradead.org, Angus.Clark@st.com
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

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
Acked-by Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih416-pinctrl.dtsi | 13 +++++++++++++
 arch/arm/boot/dts/stih416.dtsi         | 13 +++++++++++++
 arch/arm/boot/dts/stih41x-b2020.dtsi   |  1 +
 arch/arm/boot/dts/stih41x-b2020x.dtsi  | 28 ++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 arch/arm/boot/dts/stih41x-b2020x.dtsi

diff --git a/arch/arm/boot/dts/stih416-pinctrl.dtsi b/arch/arm/boot/dts/stih416-pinctrl.dtsi
index b29ff4b..81df8e7 100644
--- a/arch/arm/boot/dts/stih416-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih416-pinctrl.dtsi
@@ -210,6 +210,19 @@
 					};
 				};
 			};
+
+			fsm {
+				pinctrl_fsm: fsm {
+					st,pins {
+						spi-fsm-clk  = <&PIO12 2 ALT1 OUT>;
+						spi-fsm-cs   = <&PIO12 3 ALT1 OUT>;
+						spi-fsm-mosi = <&PIO12 4 ALT1 OUT>;
+						spi-fsm-miso = <&PIO12 5 ALT1 IN>;
+						spi-fsm-hol  = <&PIO12 6 ALT1 OUT>;
+						spi-fsm-wp   = <&PIO12 7 ALT1 OUT>;
+					};
+				};
+			};
 		};
 
 		pin-controller-rear {
diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
index b7ab47b..1e24b9e 100644
--- a/arch/arm/boot/dts/stih416.dtsi
+++ b/arch/arm/boot/dts/stih416.dtsi
@@ -145,5 +145,18 @@
 
 			status		= "disabled";
 		};
+
+		/* FSM */
+		spifsm: spifsm@fe902000 {
+			compatible	   = "st,spi-fsm";
+			reg		   = <0xfe902000 0x1000>;
+			pinctrl-0	   = <&pinctrl_fsm>;
+
+			st,syscfg	   = <&syscfg_rear>;
+			st,boot-device-reg = <0x958>;
+			st,boot-device-spi = <0x1a>;
+
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/stih41x-b2020.dtsi b/arch/arm/boot/dts/stih41x-b2020.dtsi
index 0ef0a69..01487e0 100644
--- a/arch/arm/boot/dts/stih41x-b2020.dtsi
+++ b/arch/arm/boot/dts/stih41x-b2020.dtsi
@@ -6,6 +6,7 @@
  * it under the terms of the GNU General Public License version 2 as
  * publishhed by the Free Software Foundation.
  */
+#include "stih41x-b2020x.dtsi"
 / {
 	memory{
 		device_type = "memory";
diff --git a/arch/arm/boot/dts/stih41x-b2020x.dtsi b/arch/arm/boot/dts/stih41x-b2020x.dtsi
new file mode 100644
index 0000000..d9af63d
--- /dev/null
+++ b/arch/arm/boot/dts/stih41x-b2020x.dtsi
@@ -0,0 +1,28 @@
+/*
+ * Copyright (C) 2013 STMicroelectronics (R&D) Limited.
+ * Author: Lee Jones <lee.jones@linaro.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * publishhed by the Free Software Foundation.
+ */
+/ {
+	soc {
+		spifsm: spifsm@fe902000 {
+			#address-cells = <1>;
+			#size-cells    = <1>;
+
+			status = "okay";
+
+			partition@0 {
+				label = "Serial Flash 1";
+				reg   = <0x00000000 0x00500000>;
+			};
+
+			partition@500000 {
+				label = "Serial Flash 2";
+				reg   = <0x00500000 0x00b00000>;
+			};
+		};
+	};
+};
-- 
1.8.3.2

Received: from mail-wi0-f174.google.com ([209.85.212.174])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQZB2-0007iY-Qw
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 09:22:17 +0000
Received: by mail-wi0-f174.google.com with SMTP id d1so5977851wiv.7
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 02:21:46 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com
Subject: [PATCH v6 13/36] mtd: st_spi_fsm: Add device-tree binding
 documentation
Date: Thu, 20 Mar 2014 09:20:45 +0000
Message-Id: <1395307268-12721-14-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
References: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
Cc: dwmw2@infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Angus.Clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cc: devicetree@vger.kernel.org
Acked-by Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/mtd/st-fsm.txt | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/st-fsm.txt

diff --git a/Documentation/devicetree/bindings/mtd/st-fsm.txt b/Documentation/devicetree/bindings/mtd/st-fsm.txt
new file mode 100644
index 0000000..c248939
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/st-fsm.txt
@@ -0,0 +1,26 @@
+* ST-Microelectronics SPI FSM Serial (NOR) Flash Controller
+
+Required properties:
+  - compatible : Should be "st,spi-fsm"
+  - reg        : Contains register's location and length.
+  - reg-names  : Should contain the reg names "spi-fsm"
+  - interrupts : The interrupt number
+  - pinctrl-0  : Standard Pinctrl phandle (see: pinctrl/pinctrl-bindings.txt)
+
+Optional properties:
+  - st,syscfg          : Phandle to boot-device system configuration registers
+  - st,boot-device-reg : Address of the aforementioned boot-device register(s)
+  - st,boot-device-spi : Expected boot-device value if booted via this device
+
+Example:
+	spifsm: spifsm@fe902000{
+	        compatible         = "st,spi-fsm";
+	        reg                =  <0xfe902000 0x1000>;
+	        reg-names          = "spi-fsm";
+	        pinctrl-0          = <&pinctrl_fsm>;
+		st,syscfg	   = <&syscfg_rear>;
+	        st,boot-device-reg = <0x958>;
+	        st,boot-device-spi = <0x1a>;
+		status = "okay";
+	};
+
-- 
1.8.3.2

Received: from mail-yk0-f170.google.com ([209.85.160.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0UJg-0000W0-Up
 for linux-mtd@lists.infradead.org; Mon, 15 Dec 2014 11:59:59 +0000
Received: by mail-yk0-f170.google.com with SMTP id q200so4878266ykb.1
 for <linux-mtd@lists.infradead.org>; Mon, 15 Dec 2014 03:59:35 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
Subject: [PATCH v3 03/13] mtd: st_spi_fsm: dt-bindings: Deprecate generic
 compatible string
Date: Mon, 15 Dec 2014 11:59:10 +0000
Message-Id: <1418644760-18773-4-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1418644760-18773-1-git-send-email-lee.jones@linaro.org>
References: <1418644760-18773-1-git-send-email-lee.jones@linaro.org>
Cc: lee.jones@linaro.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver now obtains platform information via DT matching, which requires
a compatible string per platform.  This change introduces the new specific
strings and deprecates the old generic one.

We also take out all of the old, unused properties which are no longer
required.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/mtd/st-fsm.txt | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/st-fsm.txt b/Documentation/devicetree/bindings/mtd/st-fsm.txt
index c248939..4e3a16c 100644
--- a/Documentation/devicetree/bindings/mtd/st-fsm.txt
+++ b/Documentation/devicetree/bindings/mtd/st-fsm.txt
@@ -1,26 +1,20 @@
 * ST-Microelectronics SPI FSM Serial (NOR) Flash Controller
 
 Required properties:
-  - compatible : Should be "st,spi-fsm"
+  - compatible : "st,spi-fsm" is now DEPRECATED
+		 Should be one of;
+		   "st,stid127-spi-fsm"
+		   "st,stih407-spi-fsm"
+		   "st,stih416-spi-fsm"
   - reg        : Contains register's location and length.
-  - reg-names  : Should contain the reg names "spi-fsm"
   - interrupts : The interrupt number
   - pinctrl-0  : Standard Pinctrl phandle (see: pinctrl/pinctrl-bindings.txt)
-
-Optional properties:
-  - st,syscfg          : Phandle to boot-device system configuration registers
-  - st,boot-device-reg : Address of the aforementioned boot-device register(s)
-  - st,boot-device-spi : Expected boot-device value if booted via this device
+  - st,syscfg  : Phandle to boot-device system configuration registers
 
 Example:
 	spifsm: spifsm@fe902000{
-	        compatible         = "st,spi-fsm";
+		compatible         = "st,stih407-spi-fsm";
 	        reg                =  <0xfe902000 0x1000>;
-	        reg-names          = "spi-fsm";
 	        pinctrl-0          = <&pinctrl_fsm>;
 		st,syscfg	   = <&syscfg_rear>;
-	        st,boot-device-reg = <0x958>;
-	        st,boot-device-spi = <0x1a>;
-		status = "okay";
 	};
-
-- 
1.9.1

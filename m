Received: from mail-yk0-f180.google.com ([209.85.160.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0UK2-0000cN-VG
 for linux-mtd@lists.infradead.org; Mon, 15 Dec 2014 12:00:20 +0000
Received: by mail-yk0-f180.google.com with SMTP id 9so4889687ykp.11
 for <linux-mtd@lists.infradead.org>; Mon, 15 Dec 2014 03:59:57 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
Subject: [PATCH v3 13/13] ARM: STi: stih416: Supply EMI clock reference to FSM
 SPI NOR
Date: Mon, 15 Dec 2014 11:59:20 +0000
Message-Id: <1418644760-18773-14-git-send-email-lee.jones@linaro.org>
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

While we're at it we're also adding a new human readable define for the
aforementioned clock.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih416.dtsi           | 2 +-
 include/dt-bindings/clock/stih416-clks.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
index dec546e..663e93b 100644
--- a/arch/arm/boot/dts/stih416.dtsi
+++ b/arch/arm/boot/dts/stih416.dtsi
@@ -217,7 +217,7 @@
 			compatible	   = "st,stih416-spi-fsm";
 			reg		   = <0xfe902000 0x1000>;
 			pinctrl-0	   = <&pinctrl_fsm>;
-
+			clocks		   = <&clk_s_a0_ls CLK_EMISS>;
 			st,syscfg	   = <&syscfg_rear>;
 
 			status = "disabled";
diff --git a/include/dt-bindings/clock/stih416-clks.h b/include/dt-bindings/clock/stih416-clks.h
index f9bdbd1..4a46a47e 100644
--- a/include/dt-bindings/clock/stih416-clks.h
+++ b/include/dt-bindings/clock/stih416-clks.h
@@ -7,6 +7,7 @@
 
 /* CLOCKGEN A0 */
 #define CLK_ICN_REG		0
+#define CLK_EMISS		3
 #define CLK_ETH1_PHY		4
 
 /* CLOCKGEN A1 */
-- 
1.9.1

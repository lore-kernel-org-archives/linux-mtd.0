Received: from mail-yk0-f178.google.com ([209.85.160.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0UK0-0000b5-GC
 for linux-mtd@lists.infradead.org; Mon, 15 Dec 2014 12:00:17 +0000
Received: by mail-yk0-f178.google.com with SMTP id 20so4843028yks.37
 for <linux-mtd@lists.infradead.org>; Mon, 15 Dec 2014 03:59:55 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
Subject: [PATCH v3 12/13] ARM: STi: stih416: Use new platform specific
 compatible string
Date: Mon, 15 Dec 2014 11:59:19 +0000
Message-Id: <1418644760-18773-13-git-send-email-lee.jones@linaro.org>
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

The FSM SPI NOR driver now obtains syscfg particulars using DT match. In
order for this to happen each platform is required to supply their own
specific compatible string.

We're also remove the old, now unused vendor properties from the node.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih416.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
index 84758d7..dec546e 100644
--- a/arch/arm/boot/dts/stih416.dtsi
+++ b/arch/arm/boot/dts/stih416.dtsi
@@ -214,13 +214,11 @@
 
 		/* FSM */
 		spifsm: spifsm@fe902000 {
-			compatible	   = "st,spi-fsm";
+			compatible	   = "st,stih416-spi-fsm";
 			reg		   = <0xfe902000 0x1000>;
 			pinctrl-0	   = <&pinctrl_fsm>;
 
 			st,syscfg	   = <&syscfg_rear>;
-			st,boot-device-reg = <0x958>;
-			st,boot-device-spi = <0x1a>;
 
 			status = "disabled";
 		};
-- 
1.9.1

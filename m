Received: from mail-yk0-f173.google.com ([209.85.160.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOBTt-0004ne-0O
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 19:40:02 +0000
Received: by mail-yk0-f173.google.com with SMTP id 10so3971488ykt.4
 for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2014 12:39:31 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Mike Turquette <mturquette@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 3/6] ARM: mvebu: Add the Core Divider clock to Armada 38x
 SoCs
Date: Thu, 13 Mar 2014 16:38:59 -0300
Message-Id: <1394739542-30017-4-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 sergei.shtylyov@cogentembedded.com, Tawfik Bayouk <tawfik@marvell.com>,
 Andrew Lunn <andrew@lunn.ch>, Seif Mazareeb <seif@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

The Armada 38x SoC family has a clock provider called "Core Divider",
derived from the fixed 2 GHz main PLL clock. This is similar to the
one on A370, A375 and AXP.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 arch/arm/boot/dts/armada-38x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index 38fc3a0..76cc27e 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -337,6 +337,14 @@
 				compatible = "marvell,orion-mdio";
 				reg = <0x72004 0x4>;
 			};
+
+			coredivclk: corediv-clock@e4250 {
+				compatible = "marvell,armada-380-corediv-clock";
+				reg = <0xe4250 0xc>;
+				#clock-cells = <1>;
+				clocks = <&mainpll>;
+				clock-output-names = "nand";
+			};
 		};
 	};
 
-- 
1.9.0

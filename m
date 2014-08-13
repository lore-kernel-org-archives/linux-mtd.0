Received: from mail-ig0-f173.google.com ([209.85.213.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHUby-0001N7-JO
 for linux-mtd@lists.infradead.org; Wed, 13 Aug 2014 09:12:50 +0000
Received: by mail-ig0-f173.google.com with SMTP id h18so9519050igc.6
 for <linux-mtd@lists.infradead.org>; Wed, 13 Aug 2014 02:12:29 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] ARM: sti: Enable BCH NAND for STiH416 B2020-RevE
Date: Wed, 13 Aug 2014 10:12:03 +0100
Message-Id: <1407921127-8590-5-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1407921127-8590-1-git-send-email-lee.jones@linaro.org>
References: <1407921127-8590-1-git-send-email-lee.jones@linaro.org>
Cc: pekon@pek-sem.com, computersforpeace@gmail.com, lee.jones@linaro.org,
 kernel@stlinux.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Also supply the platform specific clocks required by the NAND driver.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih416-b2020e.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/stih416-b2020e.dts b/arch/arm/boot/dts/stih416-b2020e.dts
index ba0fa2c..f4b92d5 100644
--- a/arch/arm/boot/dts/stih416-b2020e.dts
+++ b/arch/arm/boot/dts/stih416-b2020e.dts
@@ -31,5 +31,13 @@
 		ethernet1: dwmac@fef08000 {
 			snps,reset-gpio = <&PIO0 7>;
 		};
+
+		nand@fe901000 {
+			clock-names = "emi", "bch";
+			clocks = <&clk_s_a0_ls CLK_EMISS>,
+				 <&clk_s_a1_ls CLK_NAND_CTRL>;
+
+			status = "okay";
+		};
 	};
 };
-- 
1.9.1

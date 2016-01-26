Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aO1Ye-0002Sg-U9
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 11:13:16 +0000
Received: by mail-lf0-x233.google.com with SMTP id h129so103434943lfh.3
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jan 2016 03:12:52 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 6/6] ARM: realview: fix up PB11MP flash compat strings
Date: Tue, 26 Jan 2016 12:12:05 +0100
Message-Id: <1453806725-4880-7-git-send-email-linus.walleij@linaro.org>
In-Reply-To: <1453806725-4880-1-git-send-email-linus.walleij@linaro.org>
References: <1453806725-4880-1-git-send-email-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The two flash memories in the PB11MPCore have their VPP/WP
lines controlled from the system controller add-on in the MTD
subsystem. "arm,versatile-flash" is the first compatible string
to use to get the right support.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/arm-realview-pb11mp.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm-realview-pb11mp.dts
index da755c9851a7..63d6a051839f 100644
--- a/arch/arm/boot/dts/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm-realview-pb11mp.dts
@@ -230,14 +230,14 @@
 
 	flash0@40000000 {
 		/* 2 * 32MiB NOR Flash memory */
-		compatible = "arm,vexpress-flash", "cfi-flash";
+		compatible = "arm,versatile-flash", "cfi-flash";
 		reg = <0x40000000 0x04000000>;
 		bank-width = <4>;
 	};
 
 	flash1@44000000 {
 		// 2 * 32MiB NOR Flash memory
-		compatible = "arm,vexpress-flash", "cfi-flash";
+		compatible = "arm,versatile-flash", "cfi-flash";
 		reg = <0x44000000 0x04000000>;
 		bank-width = <4>;
 	};
-- 
2.4.3

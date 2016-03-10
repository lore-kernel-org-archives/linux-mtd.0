Received: from mail-ob0-f196.google.com ([209.85.214.196])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aeAS8-00058p-Vn
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 23:57:14 +0000
Received: by mail-ob0-f196.google.com with SMTP id e7so7584368obv.2
 for <linux-mtd@lists.infradead.org>; Thu, 10 Mar 2016 15:56:52 -0800 (PST)
From: Franklin S Cooper Jr <fcooper@ti.com>
To: nsekhar@ti.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 rogerq@ti.com, tony@atomide.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v4 2/7] ARM: dts: am33xx: Fix GPMC dma properties
Date: Thu, 10 Mar 2016 17:56:38 -0600
Message-Id: <1457654203-20856-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1457654203-20856-1-git-send-email-fcooper@ti.com>
References: <1457654203-20856-1-git-send-email-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch updates the GPMC's DT DMA property to reflect the updated eDMA
bindings.

Fixes: b5e509066074 ("ARM: DTS: am33xx: Use the new DT bindings for the eDMA3")

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 4 changes:
Split in its own commit. Uses correct syntax for Fixes

 arch/arm/boot/dts/am33xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 1fafaad..97471d6 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -860,7 +860,7 @@
 			ti,no-idle-on-init;
 			reg = <0x50000000 0x2000>;
 			interrupts = <100>;
-			dmas = <&edma 52>;
+			dmas = <&edma 52 0>;
 			dma-names = "rxtx";
 			gpmc,num-cs = <7>;
 			gpmc,num-waitpins = <2>;
-- 
2.7.0

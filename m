Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3NIw-0000XD-UF
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2015 11:39:25 +0000
Received: by wibut5 with SMTP id ut5so15915707wib.1
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jun 2015 04:39:00 -0700 (PDT)
MIME-Version: 1.0
From: Roy Spliet <r.spliet@ultimaker.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linux MTD <linux-mtd@lists.infradead.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Linux-sunxi <linux-sunxi@googlegroups.com>
Subject: [RFC 2/2] dts: Add Sun7i NAND DMA definitions
Date: Fri, 12 Jun 2015 13:38:49 +0200
Message-Id: <1434109129-28183-3-git-send-email-r.spliet@ultimaker.com>
In-Reply-To: <1434109129-28183-1-git-send-email-r.spliet@ultimaker.com>
References: <1434109129-28183-1-git-send-email-r.spliet@ultimaker.com>
Content-Type: text/plain; charset=US-ASCII
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Roy Spliet <r.spliet@ultimaker.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 arch/arm/boot/dts/sun7i-a20.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 428bdfa..f6eb401 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -577,6 +577,8 @@
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ahb_gates 13>, <&nand_clk>;
 			clock-names = "ahb", "mod";
+			dmas = <&dma SUN4I_DMA_DEDICATED 3>;
+			dma-names = "rx-tx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.4.2


-- 


IMAGINE IT >> MAKE IT

Meet us online at Twitter <http://twitter.com/ultimaker>, Facebook 
<http://facebook.com/ultimaker>, Google+ <http://google.com/+Ultimaker>

www.ultimaker.com

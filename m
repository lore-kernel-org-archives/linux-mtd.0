Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEbjS-0006fw-Qe
 for linux-mtd@lists.infradead.org; Tue, 05 Aug 2014 10:12:42 +0000
From: Roger Quadros <rogerq@ti.com>
To: <computersforpeace@gmail.com>, <tony@atomide.com>
Subject: [PATCH 3/3] ARM: dts: omap3430-sdp: Revert to using software ECC for
 NAND
Date: Tue, 5 Aug 2014 13:11:22 +0300
Message-ID: <1407233482-11642-4-git-send-email-rogerq@ti.com>
In-Reply-To: <1407233482-11642-1-git-send-email-rogerq@ti.com>
References: <1407233482-11642-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, jg1.han@samsung.com,
 linux-kernel@vger.kernel.org, balbi@ti.com, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, pekon.gupta@gmail.com,
 linux-omap@vger.kernel.org, dwmw2@infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For v3.14 and prior, 1-bit Hamming code ECC via software was used
for NAND on this board.
Commit c06c52701695 in v3.15 changed the behaviour
to use 1-bit Hamming code via Hardware using a different ECC layout
i.e. (ROM code layout) than what is used by software ECC.

This ECC layout change causes NAND filesystems created in v3.14
and prior to be unusable in v3.15 and later. So revert back to
using software ECC scheme.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 arch/arm/boot/dts/omap3430-sdp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap3430-sdp.dts b/arch/arm/boot/dts/omap3430-sdp.dts
index 02f69f4..9bad94e 100644
--- a/arch/arm/boot/dts/omap3430-sdp.dts
+++ b/arch/arm/boot/dts/omap3430-sdp.dts
@@ -107,7 +107,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <1 0 0x08000000>;
-		ti,nand-ecc-opt = "ham1";
+		ti,nand-ecc-opt = "sw";
 		nand-bus-width = <8>;
 		gpmc,cs-on-ns = <0>;
 		gpmc,cs-rd-off-ns = <36>;
-- 
1.8.3.2

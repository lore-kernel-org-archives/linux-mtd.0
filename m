Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uy6r6-0002lr-13
 for linux-mtd@lists.infradead.org; Sat, 13 Jul 2013 20:55:50 +0000
From: Pekon Gupta <pekon@ti.com>
To: <dedekind1@gmail.com>, <dwmw2@infradead.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <mugunthanvnm@ti.com>
Subject: [PATCH v5 4/4] ARM: dts: AM33xx: updated default ECC scheme in
 nand-ecc-opt
Date: Sun, 14 Jul 2013 02:24:51 +0530
Message-ID: <1373748891-7779-5-git-send-email-pekon@ti.com>
In-Reply-To: <1373748891-7779-1-git-send-email-pekon@ti.com>
References: <1373748891-7779-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: tony@atomide.com, devicetree-discuss@lists.ozlabs.org,
 avinashphilipk@gmail.com, balbi@ti.com, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, benoit.cousson@linaro.org,
 linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DT property values for OMAP based gpmc-nand have been updated
to match changes in commit:
	6faf096 ARM: OMAP2+: cleaned-up DT support of various ECC schemes
Refer: Documentation/devicetree/bindings/mtd/gpmc-nand.txt

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 arch/arm/boot/dts/am335x-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index 3aee1a4..7077a2f 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -239,7 +239,7 @@
 			nand@0,0 {
 				reg = <0 0 0>; /* CS0, offset 0 */
 				nand-bus-width = <8>;
-				ti,nand-ecc-opt = "bch8";
+				ti,nand-ecc-opt = "bch8_code_hw";
 				gpmc,device-nand = "true";
 				gpmc,device-width = <1>;
 				gpmc,sync-clk-ps = <0>;
-- 
1.8.1

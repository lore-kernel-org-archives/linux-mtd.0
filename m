Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtyqL-0005YF-Us
 for linux-mtd@lists.infradead.org; Tue, 02 Jul 2013 11:33:59 +0000
From: Pekon Gupta <pekon@ti.com>
To: <tony@atomide.com>, <artem.bityutskiy@linux.intel.com>,
 <benoit.cousson@linaro.org>, <olof@lixom.net>
Subject: [PATCH v4 4/4] ARM: dts: AM33xx: updated default ECC scheme in
 nand-ecc-opt
Date: Tue, 2 Jul 2013 17:02:37 +0530
Message-ID: <1372764757-29511-5-git-send-email-pekon@ti.com>
In-Reply-To: <1372764757-29511-1-git-send-email-pekon@ti.com>
References: <1372764757-29511-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: sfr@canb.auug.org.au, arnd@arndb.de, avinashphilipk@gmail.com,
 devicetree-discuss@lists.ozlabs.org, jp.francois@cynove.com, balbi@ti.com,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
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
index c71bb77..cc50fb8 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -135,7 +135,7 @@
 			nand@0,0 {
 				reg = <0 0 0>; /* CS0, offset 0 */
 				nand-bus-width = <8>;
-				ti,nand-ecc-opt = "bch8";
+				ti,nand-ecc-opt = "bch8_code_hw";
 				gpmc,device-width = <1>;
 				gpmc,sync-clk-ps = <0>;
 				gpmc,cs-on-ns = <0>;
-- 
1.8.1

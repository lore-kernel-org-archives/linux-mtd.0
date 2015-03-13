From: Stefan Agner <stefan@agner.ch>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Subject: [PATCH v3 4/6] ARM: vf610: enable NAND Flash Controller
Date: Fri, 13 Mar 2015 10:38:56 +0100
Message-Id: <1426239538-11529-5-git-send-email-stefan@agner.ch>
In-Reply-To: <1426239538-11529-1-git-send-email-stefan@agner.ch>
References: <1426239538-11529-1-git-send-email-stefan@agner.ch>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com,
 aaron@tastycactus.com, marb@ixxat.de, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, galak@codeaurora.org,
 shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org,
 bpringlemeir@nbsps.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enable the NAND Flash Controller driver which is part of the Vybrid
SoC by default.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/mach-imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index c8dffce..182e30e 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -635,6 +635,7 @@ config SOC_VF610
 	select ARM_GIC
 	select PINCTRL_VF610
 	select PL310_ERRATA_769419 if CACHE_L2X0
+	select HAVE_NAND_VF610_NFC
 
 	help
 	  This enable support for Freescale Vybrid VF610 processor.
-- 
2.3.1

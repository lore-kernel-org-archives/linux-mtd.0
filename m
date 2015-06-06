From: Stefan Agner <stefan@agner.ch>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Subject: [PATCH v5 4/6] ARM: vf610: enable NAND Flash Controller
Date: Sat,  6 Jun 2015 11:53:34 +0200
Message-Id: <1433584416-29607-5-git-send-email-stefan@agner.ch>
In-Reply-To: <1433584416-29607-1-git-send-email-stefan@agner.ch>
References: <1433584416-29607-1-git-send-email-stefan@agner.ch>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com,
 aaron@tastycactus.com, marb@ixxat.de, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, bpringlemeir@gmail.com,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 sebastian@breakpoint.cc, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 galak@codeaurora.org, shawn.guo@linaro.org, devicetree@vger.kernel.org
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
index 3a3d3e9..9358135 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -589,6 +589,7 @@ config SOC_VF610
 	select PINCTRL_VF610
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select SMP_ON_UP if SMP
+	select HAVE_NAND_VF610_NFC
 
 	help
 	  This enables support for Freescale Vybrid VF610 processor.
-- 
2.4.2

From: Richard Zhao <richard.zhao@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: gpmi-nand: fix build error when MXS_DMA is not configured
Date: Thu, 26 Jul 2012 10:01:12 +0800
Message-ID: <1343268072-20732-1-git-send-email-richard.zhao@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, b32955@freescale.com,
 Richard Zhao <richard.zhao@freescale.com>, kernel@pengutronix.de,
 shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix below build error:

drivers/built-in.o: In function `gpmi_dma_filter':
clk-fixed-factor.c:(.text+0xab170): undefined reference to `mxs_dma_is_apbh'
make: *** [vmlinux] Error 1

Signed-off-by: Richard Zhao <richard.zhao@freescale.com>
---
 drivers/mtd/nand/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 31bb7e5..d097386 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -481,6 +481,7 @@ config MTD_NAND_NANDSIM
 config MTD_NAND_GPMI_NAND
         bool "GPMI NAND Flash Controller driver"
         depends on MTD_NAND && (SOC_IMX23 || SOC_IMX28 || SOC_IMX6Q)
+	depends on MXS_DMA
         help
 	 Enables NAND Flash support for IMX23 or IMX28.
 	 The GPMI controller is very powerful, with the help of BCH
-- 
1.7.9.5

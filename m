From: Brian Norris <computersforpeace@gmail.com>
To: Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 01/12] ARM: imx/mxs defconfigs: add MTD_SPI_NOR (new
 dependency for M25P80)
Date: Wed, 30 Apr 2014 23:26:36 -0700
Message-Id: <1398925607-7482-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1398925607-7482-1-git-send-email-computersforpeace@gmail.com>
References: <1398925607-7482-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 Shawn Guo <shawn.guo@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These defconfigs contain the CONFIG_M25P80 symbol, which is now
dependent on the MTD_SPI_NOR symbol. Add CONFIG_MTD_SPI_NOR to satisfy
the new dependency.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Shawn Guo <shawn.guo@freescale.com>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Marek Vasut <marex@denx.de>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 arch/arm/configs/mxs_defconfig       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 09e974392fa1..c098195e9bd3 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -89,6 +89,7 @@ CONFIG_MTD_SST25L=y
 CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_GPMI_NAND=y
 CONFIG_MTD_NAND_MXC=y
+CONFIG_MTD_SPI_NOR=y
 CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 6150108e15de..eac87f4fae07 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -55,6 +55,7 @@ CONFIG_MTD_M25P80=y
 CONFIG_MTD_SST25L=y
 CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_GPMI_NAND=y
+CONFIG_MTD_SPI_NOR=y
 CONFIG_MTD_UBI=y
 # CONFIG_BLK_DEV is not set
 CONFIG_EEPROM_AT24=y
-- 
1.8.3.2

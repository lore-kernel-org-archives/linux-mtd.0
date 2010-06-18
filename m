MIME-Version: 1.0
Date: Fri, 18 Jun 2010 13:34:27 +0800
Message-ID: <AANLkTinxMQjZIG4G1d9WVOiUX8-zHjTuTc1eRuInDRGW@mail.gmail.com>
Subject: [PATCH 08/25] mmp: add nand support to pxa168
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <david.woodhouse@intel.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Eric Miao <eric.y.miao@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 55adf11cb4ba8ba0b88148c9bce0cc08f94b97bd Mon Sep 17 00:00:00 2001
From: Lei Wen <leiwen@marvell.com>
Date: Mon, 31 May 2010 14:57:49 +0800
Subject: [PATCH 08/25] mmp: add nand support to pxa168

Signed-off-by: Lei Wen <leiwen@marvell.com>
---
 arch/arm/configs/pxa168_defconfig |    9 ++++++++-
 drivers/mtd/nand/Kconfig          |    2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/pxa168_defconfig
b/arch/arm/configs/pxa168_defconfig
index 113511f..a01ea99 100644
--- a/arch/arm/configs/pxa168_defconfig
+++ b/arch/arm/configs/pxa168_defconfig
@@ -438,7 +438,14 @@ CONFIG_EXTRA_FIRMWARE=""
 # CONFIG_DEBUG_DEVRES is not set
 # CONFIG_SYS_HYPERVISOR is not set
 # CONFIG_CONNECTOR is not set
-# CONFIG_MTD is not set
+CONFIG_MTD=y
+CONFIG_MTD_PARTITIONS=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_PXA3xx=y
 # CONFIG_PARPORT is not set
 # CONFIG_BLK_DEV is not set
 # CONFIG_MISC_DEVICES is not set
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 9a35d92..0d29b5d 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -394,7 +394,7 @@ endchoice

 config MTD_NAND_PXA3xx
 	tristate "Support for NAND flash devices on PXA3xx"
-	depends on MTD_NAND && (PXA3xx || ARCH_MMP)
+	depends on MTD_NAND && PLAT_PXA
 	help
 	  This enables the driver for the NAND flash device found on
 	  PXA3xx processors
-- 
1.7.0.4

MIME-Version: 1.0
Date: Wed, 28 Jul 2010 13:57:02 +0800
Message-ID: <AANLkTikwBAjZ46Ft4XSdWUVFrMp5ZVc8Yf=1B5AZ61Ec@mail.gmail.com>
Subject: [PATCH 11/29] mmp: add nand support to pxa168
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	David Woodhouse <david.woodhouse@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
	Lei Wen <leiwen@marvell.com>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 6cdf21df878e7a2d815fc363cc2598072b8cc61f Mon Sep 17 00:00:00 2001
From: Lei Wen <leiwen@marvell.com>
Date: Mon, 31 May 2010 14:57:49 +0800
Subject: [PATCH 11/29] mmp: add nand support to pxa168

Signed-off-by: Lei Wen <leiwen@marvell.com>
---
 arch/arm/configs/pxa168_defconfig |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

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
-- 
1.7.0.4

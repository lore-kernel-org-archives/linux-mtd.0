From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH v7 3/3] MTD : add GPMI-NFC driver in the config and Makefile
Date: Wed, 29 Jun 2011 16:24:38 +0800
Message-ID: <1309335878-16678-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1309335878-16678-1-git-send-email-b32955@freescale.com>
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: w.sang@pengutronix.de, thierry.nolf.barco@gmail.com,
	Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

add the GPMI-NFC driver in the relevant Kconfig and Makefile in the MTD.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/Kconfig           |   11 +++++++++++
 drivers/mtd/nand/Makefile          |    1 +
 drivers/mtd/nand/gpmi-nfc/Makefile |    3 +++
 3 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/nand/gpmi-nfc/Makefile

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 4c34252..d0076f9 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -423,6 +423,17 @@ config MTD_NAND_NANDSIM
 	  The simulator may simulate various NAND flash chips for the
 	  MTD nand layer.
 
+config MTD_NAND_GPMI_NFC
+        bool "GPMI NAND Flash Controller driver"
+        depends on MTD_NAND && (SOC_IMX23 || SOC_IMX28)
+	select MTD_PARTITIONS
+	select MTD_CMDLINE_PARTS
+        help
+	 Enables NAND Flash support for IMX23 or IMX28.
+	 The GPMI controller is very powerful, with the help of BCH
+	 module, it can do the hardware ECC. The GPMI supports several
+	 NAND flashs at the same time.
+
 config MTD_NAND_PLATFORM
 	tristate "Support for generic platform NAND driver"
 	help
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 5745d83..fd33dbf 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -49,5 +49,6 @@ obj-$(CONFIG_MTD_NAND_BCM_UMI)		+= bcm_umi_nand.o nand_bcm_umi.o
 obj-$(CONFIG_MTD_NAND_MPC5121_NFC)	+= mpc5121_nfc.o
 obj-$(CONFIG_MTD_NAND_RICOH)		+= r852.o
 obj-$(CONFIG_MTD_NAND_JZ4740)		+= jz4740_nand.o
+obj-$(CONFIG_MTD_NAND_GPMI_NFC)		+= gpmi-nfc/
 
 nand-objs := nand_base.o nand_bbt.o
diff --git a/drivers/mtd/nand/gpmi-nfc/Makefile b/drivers/mtd/nand/gpmi-nfc/Makefile
new file mode 100644
index 0000000..918fb52
--- /dev/null
+++ b/drivers/mtd/nand/gpmi-nfc/Makefile
@@ -0,0 +1,3 @@
+obj-$(CONFIG_MTD_NAND_GPMI_NFC) += gpmi_nfc.o
+gpmi_nfc-objs += gpmi-nfc.o
+gpmi_nfc-objs += hal-mxs.o
-- 
1.7.0.4

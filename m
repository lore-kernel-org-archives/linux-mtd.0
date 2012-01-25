Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rq7Hw-0006Fk-8w
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2012 18:09:41 +0000
From: Richard Weinberger <richard@nod.at>
To: dwmw2@infradead.org
Subject: [PATCH] MTD: Refine HAS_IOMEM dependency
Date: Wed, 25 Jan 2012 18:21:42 +0100
Message-Id: <1327512102-22447-1-git-send-email-richard@nod.at>
Cc: artem.bityutskiy@linux.intel.com, kyungmin.park@samsung.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Making the entire mtd subsystem depend on HAS_IOMEM is a bit overkill.
HAS_IOMEM is only needed for real devices drivers.
nandsim and friends are perfectly usable on systems without IO memory.

I'm my case I'm using nandsim on UML to do some UBI and JFFS2 development.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/Kconfig         |    1 -
 drivers/mtd/devices/Kconfig |    1 +
 drivers/mtd/maps/Kconfig    |    1 +
 drivers/mtd/nand/Kconfig    |    2 ++
 drivers/mtd/onenand/Kconfig |    1 +
 5 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 1be6218..bfbd62c 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -1,6 +1,5 @@
 menuconfig MTD
 	tristate "Memory Technology Device (MTD) support"
-	depends on HAS_IOMEM
 	help
 	  Memory Technology Devices are flash, RAM and similar chips, often
 	  used for solid state file systems on embedded devices. This option
diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 37b05c3..8d3dac4 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -1,5 +1,6 @@
 menu "Self-contained MTD device drivers"
 	depends on MTD!=n
+	depends on HAS_IOMEM
 
 config MTD_PMC551
 	tristate "Ramix PMC551 PCI Mezzanine RAM card support"
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 6c5c431..8af67cf 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -1,5 +1,6 @@
 menu "Mapping drivers for chip access"
 	depends on MTD!=n
+	depends on HAS_IOMEM
 
 config MTD_COMPLEX_MAPPINGS
 	bool "Support non-linear mappings of flash chips"
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 31b034b..80de7b3 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -246,6 +246,7 @@ config MTD_NAND_BCM_UMI_HWCS
 config MTD_NAND_DISKONCHIP
 	tristate "DiskOnChip 2000, Millennium and Millennium Plus (NAND reimplementation) (EXPERIMENTAL)"
 	depends on EXPERIMENTAL
+	depends on HAS_IOMEM
 	select REED_SOLOMON
 	select REED_SOLOMON_DEC16
 	help
@@ -431,6 +432,7 @@ config MTD_NAND_GPMI_NAND
 
 config MTD_NAND_PLATFORM
 	tristate "Support for generic platform NAND driver"
+	depends on HAS_IOMEM
 	help
 	  This implements a generic NAND driver for on-SOC platform
 	  devices. You will need to provide platform-specific functions
diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index 772ad29..91467bb 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -1,6 +1,7 @@
 menuconfig MTD_ONENAND
 	tristate "OneNAND Device Support"
 	depends on MTD
+	depends on HAS_IOMEM
 	help
 	  This enables support for accessing all type of OneNAND flash
 	  devices. For further information see
-- 
1.7.7

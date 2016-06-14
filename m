Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCmkn-0000y4-U9
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 11:43:34 +0000
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Lee Jones <lee.jones@linaro.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake SoC
Date: Tue, 14 Jun 2016 14:43:09 +0300
Message-Id: <1465904589-141386-4-git-send-email-mika.westerberg@linux.intel.com>
In-Reply-To: <1465904589-141386-1-git-send-email-mika.westerberg@linux.intel.com>
References: <1465904589-141386-1-git-send-email-mika.westerberg@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Intel Apollo Lake SoC exposes serial SPI flash through the LPC device. The
SPI flash host controller is not discoverable through PCI config cycles
because P2SB (function 0 of the device 13) is hidden by the BIOS. We unhide
the device briefly in order to read BAR 0 of the SPI host controller.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mfd/lpc_ich.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 39b7731d769a..d7f6d6728975 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -56,6 +56,7 @@
  *	document number TBD : Wildcat Point-LP
  *	document number TBD : 9 Series
  *	document number TBD : Lewisburg
+ *	document number TBD : Apollo Lake SoC
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -237,6 +238,7 @@ enum lpc_chipsets {
 	LPC_BRASWELL,	/* Braswell SoC */
 	LPC_LEWISBURG,	/* Lewisburg */
 	LPC_9S,		/* 9 Series */
+	LPC_APL,	/* Apollo Lake SoC */
 };
 
 static struct lpc_ich_info lpc_chipset_info[] = {
@@ -557,6 +559,10 @@ static struct lpc_ich_info lpc_chipset_info[] = {
 		.name = "9 Series",
 		.iTCO_version = 2,
 	},
+	[LPC_APL] = {
+		.name = "Apollo Lake SoC",
+		.spi_type = INTEL_SPI_BXT,
+	},
 };
 
 /*
@@ -705,6 +711,7 @@ static const struct pci_device_id lpc_ich_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x3b14), LPC_3420},
 	{ PCI_VDEVICE(INTEL, 0x3b16), LPC_3450},
 	{ PCI_VDEVICE(INTEL, 0x5031), LPC_EP80579},
+	{ PCI_VDEVICE(INTEL, 0x5ae8), LPC_APL},
 	{ PCI_VDEVICE(INTEL, 0x8c40), LPC_LPT},
 	{ PCI_VDEVICE(INTEL, 0x8c41), LPC_LPT},
 	{ PCI_VDEVICE(INTEL, 0x8c42), LPC_LPT},
@@ -1129,6 +1136,36 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 		}
 		break;
 
+	case INTEL_SPI_BXT: {
+		unsigned int p2sb = PCI_DEVFN(13, 0);
+		unsigned int spi = PCI_DEVFN(13, 2);
+		struct pci_bus *bus = dev->bus;
+
+		/*
+		 * The P2SB is hidden by BIOS and we need to unhide it in
+		 * order to read BAR of the SPI flash device. Once that is
+		 * done we hide it again.
+		 */
+		pci_bus_write_config_byte(bus, p2sb, 0xe1, 0x0);
+		pci_bus_read_config_dword(bus, spi, PCI_BASE_ADDRESS_0,
+					  &spi_base);
+		if (spi_base != ~0) {
+			res->start = spi_base & 0xfffffff0;
+			res->end = res->start + SZ_4K - 1;
+
+			pci_bus_read_config_dword(bus, spi, BCR, &bcr);
+			if (!(bcr & BCR_WPD)) {
+				bcr |= BCR_WPD;
+				pci_bus_write_config_dword(bus, spi, BCR, bcr);
+				pci_bus_read_config_dword(bus, spi, BCR, &bcr);
+			}
+			info->writeable = !!(bcr & BCR_WPD);
+		}
+
+		pci_bus_write_config_byte(dev->bus, p2sb, 0xe1, 0x1);
+		break;
+	}
+
 	default:
 		return -EINVAL;
 	}
-- 
2.8.1

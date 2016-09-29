Received: from smtp1.de.adit-jv.com ([62.225.105.245])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpbFp-0002vC-91
 for linux-mtd@lists.infradead.org; Thu, 29 Sep 2016 13:20:05 +0000
From: "Kraemer, Matthias (Ferchau; ADITG/SW1)" <mkraemer@de.adit-jv.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Lee Jones <lee.jones@linaro.org>, Peter Tyser
 <ptyser@xes-inc.com>, "key.seong.lim@intel.com" <key.seong.lim@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake SoC
Date: Thu, 29 Sep 2016 13:19:30 +0000
Message-ID: <B0A28CDC26EEC74CBBA518A6F0B2DE9E66ECD04F@HI2EXCH01.adit-jv.com>
References: <1471245044-12767-1-git-send-email-mika.westerberg@linux.intel.com>
 <1471245044-12767-4-git-send-email-mika.westerberg@linux.intel.com>
In-Reply-To: <1471245044-12767-4-git-send-email-mika.westerberg@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Mika,

In line 1239 you specify "struct pci_bus *bus =3D dev->bus;"
}, @@ -1122,6 +1131,36 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 		}
 		break;
=20
+	case INTEL_SPI_BXT: {
+		unsigned int p2sb =3D PCI_DEVFN(13, 0);
+		unsigned int spi =3D PCI_DEVFN(13, 2);
+		struct pci_bus *bus =3D dev->bus;

but in line 1262 you are using dev->bus again.=20
+
+		pci_bus_write_config_byte(dev->bus, p2sb, 0xe1, 0x1);

Sure this is not a runtime issue, but it would be nice to keep the coding-s=
tyle consistent.=20
We could just use dev->bus for BXT SOCs, like the remaining parts of this d=
river do.=20

Kind regards
Matthias Kraemer

-----Original Message-----
From: linux-kernel-owner@vger.kernel.org [mailto:linux-kernel-owner@vger.ke=
rnel.org] On Behalf Of Mika Westerberg
Sent: Montag, 15. August 2016 09:11
To: linux-mtd@lists.infradead.org
Cc: Brian Norris; David Woodhouse; Lee Jones; Peter Tyser; key.seong.lim@in=
tel.com; Mika Westerberg; linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake SoC

Intel Apollo Lake SoC exposes serial SPI flash through the LPC device. The =
SPI flash host controller is not discoverable through PCI config cycles bec=
ause P2SB (function 0 of the device 13) is hidden by the BIOS. We unhide th=
e device briefly in order to read BAR 0 of the SPI host controller.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mfd/lpc_ich.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c index 56a0e98a5f=
89..b1013b3f4dee 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -56,6 +56,7 @@
  *	document number TBD : Wildcat Point-LP
  *	document number TBD : 9 Series
  *	document number TBD : Lewisburg
+ *	document number TBD : Apollo Lake SoC
  */
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt @@ -92,6 +93,8 @@
 #define BCR			0xdc
 #define BCR_WPD			BIT(0)
=20
+#define SPIBASE_APL_SZ		4096
+
 #define GPIOBASE_ICH0		0x58
 #define GPIOCTRL_ICH0		0x5C
 #define GPIOBASE_ICH6		0x48
@@ -239,6 +242,7 @@ enum lpc_chipsets {
 	LPC_BRASWELL,	/* Braswell SoC */
 	LPC_LEWISBURG,	/* Lewisburg */
 	LPC_9S,		/* 9 Series */
+	LPC_APL,	/* Apollo Lake SoC */
 };
=20
 static struct lpc_ich_info lpc_chipset_info[] =3D { @@ -559,6 +563,10 @@ s=
tatic struct lpc_ich_info lpc_chipset_info[] =3D {
 		.name =3D "9 Series",
 		.iTCO_version =3D 2,
 	},
+	[LPC_APL] =3D {
+		.name =3D "Apollo Lake SoC",
+		.spi_type =3D INTEL_SPI_BXT,
+	},
 };
=20
 /*
@@ -707,6 +715,7 @@ static const struct pci_device_id lpc_ich_ids[] =3D {
 	{ PCI_VDEVICE(INTEL, 0x3b14), LPC_3420},
 	{ PCI_VDEVICE(INTEL, 0x3b16), LPC_3450},
 	{ PCI_VDEVICE(INTEL, 0x5031), LPC_EP80579},
+	{ PCI_VDEVICE(INTEL, 0x5ae8), LPC_APL},
 	{ PCI_VDEVICE(INTEL, 0x8c40), LPC_LPT},
 	{ PCI_VDEVICE(INTEL, 0x8c41), LPC_LPT},
 	{ PCI_VDEVICE(INTEL, 0x8c42), LPC_LPT}, @@ -1122,6 +1131,36 @@ static int=
 lpc_ich_init_spi(struct pci_dev *dev)
 		}
 		break;
=20
+	case INTEL_SPI_BXT: {
+		unsigned int p2sb =3D PCI_DEVFN(13, 0);
+		unsigned int spi =3D PCI_DEVFN(13, 2);
+		struct pci_bus *bus =3D dev->bus;
+
+		/*
+		 * The P2SB is hidden by BIOS and we need to unhide it in
+		 * order to read BAR of the SPI flash device. Once that is
+		 * done we hide it again.
+		 */
+		pci_bus_write_config_byte(bus, p2sb, 0xe1, 0x0);
+		pci_bus_read_config_dword(bus, spi, PCI_BASE_ADDRESS_0,
+					  &spi_base);
+		if (spi_base !=3D ~0) {
+			res->start =3D spi_base & 0xfffffff0;
+			res->end =3D res->start + SPIBASE_APL_SZ - 1;
+
+			pci_bus_read_config_dword(bus, spi, BCR, &bcr);
+			if (!(bcr & BCR_WPD)) {
+				bcr |=3D BCR_WPD;
+				pci_bus_write_config_dword(bus, spi, BCR, bcr);
+				pci_bus_read_config_dword(bus, spi, BCR, &bcr);
+			}
+			info->writeable =3D !!(bcr & BCR_WPD);
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

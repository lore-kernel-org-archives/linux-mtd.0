Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bTG2N-0006SH-ON
 for linux-mtd@lists.infradead.org; Fri, 29 Jul 2016 22:13:48 +0000
Received: by mail-pa0-x230.google.com with SMTP id ks6so34715532pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jul 2016 15:13:27 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: broonie@kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, f.fainelli@gmail.com
Cc: bcm-kernel-feedback-list@broadcom.com, vikram.prakash@broadcom.com,
 andy.fung@broadcom.com, jon.mason@broadcom.com, jchandra@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v5 0/8]  Broadcom stb, nsp, ns2, cygnus QSPI driver
Date: Fri, 29 Jul 2016 18:13:05 -0400
Message-Id: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is V5 changes for common spi driver for the brcmstb, nsp, ns2, cygnus
SoCs. Changes include driver for  standard MSPI and accelerated BSPI blocks.
The Brodcom STB uses l2-intc where as the SoC specific interrupt handling
code has been separated in a new  driver. In case of NS and NS2 SoCs it does
not have a dedicated l2 controller and the interrupts are specific to the 
spi core. The drivers are organized in the follwoing way:
 
 drivers/spi/spi-bcm-qspi.c      - Common MSPI, BSPI driver

 drivers/spi/spi-bcm-qspi.h      - Common header 

 drivers/spi/spi-brcmstb-qspi.c  - SoC specific wth brcm,spi-brcmstb-qspi 
                                   compatibility, does not have anything 
                                   specific for stb SoC

 drivers/spi/spi-nsp-qspi.c      - Implements the interrupt hooks used by 
                                   the common driver with "brcm,spi-nsp-qspi"
                                   compatibility
Changes in V5:
 - Added additional description in the binding documentation non MSPI and BSPI SoC IP
 - Split commits for MSPI spi driver and accelarated BSPI driver used for accelerated
   flash reads
 - Removed any parsing of transfer structures for commands
 - Other code cleanup for readability
 - Kept the interrupt handling code in separate driver, since hardware abstraction and l2
   controller driver in software do not exisit certain SoCs

Kamal Dasu (8):
  Documentation: dt: spi: Add BRCMSTB SoC bindings
  spi: bcm-qspi: Add Broadcom MSPI driver
  spi: bcm-qspi: Add BSPI spi-nor flash controller driver
  mtd: m25p80: Let m25p80_read() fallback to spi transfer
  Documentation: dt: spi: Add Broadcom NSP, NS2 SoC bindings
  arm: dts: Add bcm-nsp and bcm958625k support
  arm64: dts: Add ns2 SoC support
  spi: nsp-qspi: Add Broadcom NSP, NS2, Cygnus SoC support

 .../devicetree/bindings/spi/brcm,spi-bcm-qspi.txt  |  235 ++++
 arch/arm/boot/dts/bcm-nsp.dtsi                     |   33 +-
 arch/arm/boot/dts/bcm958625k.dts                   |   34 +
 arch/arm64/boot/dts/broadcom/ns2-svk.dts           |   34 +-
 arch/arm64/boot/dts/broadcom/ns2.dtsi              |   19 +
 drivers/mtd/devices/m25p80.c                       |    7 +-
 drivers/spi/Kconfig                                |   10 +
 drivers/spi/Makefile                               |    1 +
 drivers/spi/spi-bcm-qspi.c                         | 1440 ++++++++++++++++++++
 drivers/spi/spi-bcm-qspi.h                         |  112 ++
 drivers/spi/spi-brcmstb-qspi.c                     |   53 +
 drivers/spi/spi-nsp-qspi.c                         |  158 +++
 12 files changed, 2126 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi.txt
 create mode 100644 drivers/spi/spi-bcm-qspi.c
 create mode 100644 drivers/spi/spi-bcm-qspi.h
 create mode 100644 drivers/spi/spi-brcmstb-qspi.c
 create mode 100644 drivers/spi/spi-nsp-qspi.c

-- 
1.9.1

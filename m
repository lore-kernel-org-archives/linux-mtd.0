Received: from mail-bl2nam02on0614.outbound.protection.outlook.com
 ([2a01:111:f400:fe46::614]
 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezLj6-0006KH-GD
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 12:23:23 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <cyrille.pitchen@wedev4u.fr>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>
CC: <linux-mtd@lists.infradead.org>, Naga Sureshkumar Relli
 <nagasure@xilinx.com>
Subject: [RFC PATCH 0/5] RFC for Zynq QSPI
Date: Fri, 23 Mar 2018 17:51:57 +0530
Message-ID: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Xilinx Zynq uses a QSPI controller that is based on the Cadence SPI IP.
This controller implements all the functionality required to support
Quad SPI NOR flash devices.
This driver along with the MTD layer is used to support flash devices.

This series is for the following purposes:
- RFC of the Quad SPI driver.
- We currently use a custom MTD layer and would like to get inputs on
  dual stacked/dual parallel handling (described below).

The flash device(s) can be connected in the three configurations:
1. Single - One flash device with 1 CS, 1 Clock and 4 IO lines.
2. Dual Parallel - Two flash devices connected with common CS and
   separate IO lines (resulting in 8 IO lines).
   In this configuration, the controller
   a) Duplicates commands, address etc. sent on both sets of 4 IO lines.
   b) Stripes data both transmitted and received i.e.
      4 bits of data is sent to the first flash and the other 4 bits
      to the second flash. Similarly read data is also consolidated.
   Due to this, TX and RX data handling in the driver need special
   handling for parallel mode.
3. Dual Stacked - Two flash devices connected with separate CS and
   4 common IO lines. This is largely similar to single, except for
   the slave selection logic.
The above configuration is conveyed to the QSPI driver through a
devicetree property.

The QSPI driver differs from the existing Cadence SPI driver in
the following respects majorly:
1. TX and RX handling: Different TX registers are used to write into
   the TX FIFO. TXD0, TXD1, TXD2 and TXD3 are used write 4, 1, 2 and 3
   bytes respectively. Depending on the TXD register used, the received
   bytes also need to be handled separately.
2. Depending on the configuration in which flash devices are connected
   (single, parallel or stacked), QSPI controller configuration registers
   need to be modified.
3. There is no support for extended slave select in QSPI, as opposed to
   SPI. In case of stacked configuration, the slave select field remains
   the same and a different configuration bit is used to select between
   the two flash devices.
4. Handling of dual parallel configuration.

MTD layer:
The Xilinx Zynq MTD layer by far makes use of the mainline version with
some differences. The primary flash families supported are
Spansion, Winbond and Micron.
- Probe:
  - In dual configurations, both flash devices are recognized as one
    continuous memory. (ID is read only from one flash and it is a 
    pre-stated assumption that both flash devices have the same flash
    make and size.)
- Addressing:
  a) In dual stacked mode, the address passed to the MTD layer can be
     between 0x0 to 2*(one flash size). Hence the MTD layer has to recognize
     whether the address belongs to the first flash or the second flash
     subtract the offset and indicate the same to the QSPI driver.
  b) In dual stacked mode too the address can range between
     0 to 2*(one flash size). But, when an 8 bit word is written,
     4 bits are written to the first and 4 bits are written to the
     second flash. Hence the address sent is always halved and checks
     are in place for even address and even length.
- 4 byte addressing is not supported and hence bank selection logic is used
  along with the addressing system described above.
- Flash register read/writes, for example, lock/unlock, quad enable etc.
  are handled differently in dual stacked and parallel modes.

This is tested with current master branch of Linux.
To make Zynq QSPI work, we need to tweak spi-nor.c.
I agree that changing the spi-nor layer apis, doesn't look good but
i didn't find a way to do the same.
So please suggest a way to handle Zynq QSPI controller in dual parallel and 
stacked modes.
we can move the spi/spi-zynq-qspi.c to spi-nor/ but even in that case
also changes are needed in spi-nor.c.
What ever the changes we do to make Zynq QSPI work, will applicable for 
Xilinx ZynqMP SOC QSPI controller(spi-zynqmp-qspi.c) as well.
I am happy to do the changes suggested, so that we will have a solution
for Xilinx Zynq and ZynqMP SOC QSPI controllers.

Naga Sureshkumar Relli (5):
  spi: Add support for Zynq qspi controller
  mtd: spi-nor: Add support for Zynq QSPI controller
  mtd: spi-nor: Add Dual Parallel and Stacked support for Zynq QSPI
  spi: Add PM Support for Zynq QSPI controller
  devicetree: Add devicetree bindings documentation for Zynq QSPI

 .../devicetree/bindings/spi/spi-zynq-qspi.txt      |  26 +
 drivers/mtd/spi-nor/spi-nor.c                      | 425 ++++++++++-
 drivers/spi/Kconfig                                |  15 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-zynq-qspi.c                        | 827 +++++++++++++++++++++
 include/linux/mtd/spi-nor.h                        |  15 +-
 include/linux/spi/spi.h                            |   5 +-
 7 files changed, 1276 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt
 create mode 100644 drivers/spi/spi-zynq-qspi.c

-- 
2.7.4

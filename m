Received: from mail-am5eur03on061e.outbound.protection.outlook.com
 ([2a01:111:f400:fe08::61e]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3fKV-00063L-DR
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 10:07:49 +0000
From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 marek.vasut@gmail.com, frieder.schrempf@exceet.de, suresh.gupta@nxp.com,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [RFC PATCH 0/4] mtd: spi-nor: Add NXP FlexSPI driver
Date: Wed,  4 Apr 2018 15:36:07 +0530
Message-Id: <1522836371-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

Add NXP FlexSPI driver

NXP uses FlexSPI controller.
The FlexSPI(Flex Serial Peripheral controller) acts as an interface
to external serial flash devices, maximum 4, each with upto 8 bidirectional
data lines.

(1) The FlexSPI controller is driven by the LUT(Look-up Table) registers.
 The LUT registers are a look-up-table for sequences of instructions.
 A valid sequence consists of four LUT registers.

(2) The definition of the LUT register shows below:
 ---------------------------------------------------
 | INSTR1 | PAD1 | OPRND1 | INSTR0 | PAD0 | OPRND0 |
 ---------------------------------------------------

 There are several types of INSTRx, such as:
 CMD     : the SPI NOR command.
 ADDR    : the address for the SPI NOR command.
 DUMMY   : the dummy cycles needed by the SPI NOR command.
 ....

 There are several types of PADx, such as:
 PAD1    : use single I/O line.
 PAD2    : use dual I/O lines.
 PAD4    : use quad I/O lines.
 PAD8    : use octal I/O lines.
 ....

(3) LUTs are being created at run-time based on the commands passed from
 the spi-nor framework.

(4) Mode [single, dual, quad or octal] bit information derived from device
 tree by parsing spi-rx-bus-width and spi-tx-bus-width property.

(5) Tested this driver with the mtd_debug utility on NXP LX2160
 emulator platform.

This series added below patches:
- Added entry for mt35xu512aba NOR flash in spi_nor_ids table
- Add flags for Octal I/O data transfer in spi/spi.h
- Add binding file for NXP FlexSPI driver
- Add NXP FlexSPI driver in mtd interface

Yogesh Gaur (4):
  mtd: spi-nor: Add entry for mt35xu512aba flash
  spi: add flags for octal I/O data transfer
  dt-bindings: Add binding file for NXP FlexSPI driver
  mtd: spi-nor: Add NXP FlexSPI driver

 .../devicetree/bindings/mtd/nxp-flexspi.txt        |   40 +
 MAINTAINERS                                        |    7 +
 drivers/mtd/spi-nor/Kconfig                        |    7 +
 drivers/mtd/spi-nor/Makefile                       |    1 +
 drivers/mtd/spi-nor/nxp-flexspi.c                  | 1508 ++++++++++++++++++++
 drivers/mtd/spi-nor/spi-nor.c                      |    7 +-
 include/linux/mtd/cfi.h                            |    1 +
 include/linux/mtd/spi-nor.h                        |    1 +
 include/linux/spi/spi.h                            |    2 +
 9 files changed, 1573 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/nxp-flexspi.txt
 create mode 100644 drivers/mtd/spi-nor/nxp-flexspi.c

-- 
1.9.1

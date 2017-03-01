Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cizpY-0002Na-Nx
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 08:41:59 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v2 0/6] Introduction to SPI NAND framework
Date: Wed, 1 Mar 2017 16:52:04 +0800
Message-ID: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
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

First of all, thanks for Boris's valuable comments on v1.

This series introductes a SPI NAND framework.
SPI NAND is a new NAND family device with SPI protocol as
its interface. And its command set is totally different
with parallel NAND.

Our first attempt was more than 2 years ago[1]. At that
time, I didn't make BBT shareable and there were too many
duplicate code with parallel NAND, so that serie stoped.
But the discussion never stops. Now Boris has a plan to
make a generic NAND framework which can be shared with
both parallel and SPI NAND. Now the first step of the
new generic NAND framework is finished. And it is waiting
for a user. After discussion with Boris. We both think it's
time to rebuild SPI NAND framework based on the new NAND
framework and send out for reviewing.

This series is based on Boris's nand/generic branch[2], which
is on 4.9-rc1. In this serie, BBT code is totally shared.
Of course SPI NAND can share more code with parallel, this
requires to put more in new NAND core (now only BBT included).
I'd like to send this serie out first, then we can decide
which part should be in new NAND core.

This series only supports basic SPI NAND features and uses
generic spi controller for data transfer, on-die ECC for data
correction. Support advanced features and specific SPI NAND
controller with hardware ECC is the next step.

This series is tested on Xilinx Zedboard with Micron
MT29F2G01ABAGDSF SPI NAND chip.


[1]http://lists.infradead.org/pipermail/linux-mtd/2015-January/057223.html
[2]https://github.com/bbrezillon/linux-0day/tree/nand/generic

Changes since v1:
- replace "spi_nand" with "spinand".
- rename spi nand related structs for better understanding.
- introduce spi nand controller, manufacturer and ecc_engine struct.
- add spi nand manufacturer initialization function refer to Boris's manuf-init branch.
- remove NAND_SKIP_BBTSCAN from series. Add it later when enabling HW ECC.
- reorganize series according to Boris's suggestion.

Peter Pan (6):
  nand: spi: Add init/release function
  nand: spi: add basic operations support
  nand: spi: Add bad block support
  nand: spi: Add BBT support
  nand: spi: add Micron spi nand support
  nand: spi: Add generic SPI controller support

 drivers/mtd/nand/Kconfig                 |    1 +
 drivers/mtd/nand/Makefile                |    1 +
 drivers/mtd/nand/spi/Kconfig             |    7 +
 drivers/mtd/nand/spi/Makefile            |    4 +
 drivers/mtd/nand/spi/chips/Kconfig       |    5 +
 drivers/mtd/nand/spi/chips/Makefile      |    1 +
 drivers/mtd/nand/spi/chips/generic_spi.c |  158 +++
 drivers/mtd/nand/spi/spinand_base.c      | 1630 ++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/spinand_ids.c       |   34 +
 drivers/mtd/nand/spi/spinand_micron.c    |  133 +++
 include/linux/mtd/spinand.h              |  317 ++++++
 11 files changed, 2291 insertions(+)
 create mode 100644 drivers/mtd/nand/spi/Kconfig
 create mode 100644 drivers/mtd/nand/spi/Makefile
 create mode 100644 drivers/mtd/nand/spi/chips/Kconfig
 create mode 100644 drivers/mtd/nand/spi/chips/Makefile
 create mode 100644 drivers/mtd/nand/spi/chips/generic_spi.c
 create mode 100644 drivers/mtd/nand/spi/spinand_base.c
 create mode 100644 drivers/mtd/nand/spi/spinand_ids.c
 create mode 100644 drivers/mtd/nand/spi/spinand_micron.c
 create mode 100644 include/linux/mtd/spinand.h

-- 
1.9.1

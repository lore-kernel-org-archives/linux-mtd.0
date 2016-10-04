Received: from exsmtp01.microchip.com ([198.175.253.37]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brShw-0000Gw-6K
 for linux-mtd@lists.infradead.org; Tue, 04 Oct 2016 16:36:45 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH 0/9] mtd: spi-nor: parse SFDP tables to setup (Q)SPI memories
Date: Tue, 4 Oct 2016 18:37:02 +0200
Message-ID: <cover.1475597385.git.cyrille.pitchen@atmel.com>
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

Hi all,

This series extends support of SPI protocols to new protocols such as
SPI x-2-2 and SPI x-4-4. Also spi_nor_scan() tries now to select the right
op codes, timing parameters (number of mode and dummy cycles) and erase
sector size by parsing the Serial Flash Discoverable Parameter (SFDP)
tables, when available, as defined in the JEDEC JESD216 specifications.

When SFDP tables are not available, legacy settings are still used for
backward compatibility (SPI and earlier QSPI memories).

Support of SPI memories >128Mbits is also improved by using the 4byte
address instruction set, when available. Using those dedicated op codes
is stateless as opposed to enter the 4byte address mode, hence a better
compatibility with some boot loaders which expect to use 3byte address
op codes.


This series was tested on a Atmel sama5d2 xplained board with the
atmel-qspi.c driver. Except for SST memories, the SPI bus clock was set
to 83MHz. The config MTD_SPI_NOR_USE_4K_SECTORS was selected.

For my tests, I used some shell scripts using mtd_debug and sha1sum to
check the data integrity.

e.g:
#!/bin/sh

mtd_debug erase /dev/mtd5 0 0x780000
mtd_debug write /dev/mtd5 0 7674703 sama5d4_doc11238.pdf
mtd_debug read /dev/mtd5 0 7674703 sam5d4_tmp.pdf

sha1sum sama5d4_doc11238.pdf sam5d4_tmp.pdf


The series was tested with the following QSPI memories:

Spansion/Cypress:
- s25fl127s	OK
- s25fl512s	OK
- s25fl164k	OK

Micron:
- n25q128a	OK

Macronix:
- mx25l6433f	OK
- mx25l6473f	OK
- mx25l12835f	OK
- mx25l12845g	OK
- mx25l12873g	OK
- mx25l25645g	OK
- mx25l25673g	OK
- mx25l51245g	OK
- mx66l1g45g	OK (1)

SST:
- sst26vf016b	OK (2)
- sst26vf032b	OK (2)
- sst26vf064b	OK (2)

(1): requires patch 8
(2): requires patch 9, the SPI bus clock frequency was decreased down to 55.3MHz


Best regards,

Cyrille

Depending on the actual memory size, I may have used other partitions
(/dev/mtd4) and input file size (2880044 and 320044 bytes).

Cyrille Pitchen (9):
  mtd: spi-nor: improve macronix_quad_enable()
  mtd: spi-nor: add an alternative method to support memory >16MiB
  mtd: spi-nor: add support of SPI protocols like SPI 1-2-2 and SPI
    1-4-4
  mtd: spi-nor: remove unused set_quad_mode() function
  mtd: m25p80: add support of dual and quad spi protocols to all
    commands
  mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables
  mtd: spi-nor: parse SFDP 4-byte Address Instruction Table
  mtd: spi-nor: add support to Macronix mx66l1g45g
  mtd: spi-nor: add support to SST sst26* QSPI memories

 drivers/mtd/devices/m25p80.c            |  204 +++++--
 drivers/mtd/devices/serial_flash_cmds.h |    7 -
 drivers/mtd/devices/st_spi_fsm.c        |   28 +-
 drivers/mtd/spi-nor/atmel-quadspi.c     |   83 ++-
 drivers/mtd/spi-nor/cadence-quadspi.c   |    8 +-
 drivers/mtd/spi-nor/fsl-quadspi.c       |    8 +-
 drivers/mtd/spi-nor/hisi-sfc.c          |    8 +-
 drivers/mtd/spi-nor/mtk-quadspi.c       |   16 +-
 drivers/mtd/spi-nor/nxp-spifi.c         |   21 +-
 drivers/mtd/spi-nor/spi-nor.c           | 1013 ++++++++++++++++++++++++++++---
 include/linux/mtd/spi-nor.h             |  165 ++++-
 11 files changed, 1337 insertions(+), 224 deletions(-)

-- 
2.7.4

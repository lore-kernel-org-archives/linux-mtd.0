Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byiCb-0000XD-Ua
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 16:34:24 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <richard@nod.at>, <linux-kernel@vger.kernel.org>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 0/9] mtd: spi-nor: parse SFDP tables to setup (Q)SPI
 memories
Date: Mon, 24 Oct 2016 18:34:37 +0200
Message-ID: <cover.1477325128.git.cyrille.pitchen@atmel.com>
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
mtd_debug read /dev/mtd5 0 7674703 sama5d4_tmp.pdf

sha1sum sama5d4_doc11238.pdf sama5d4_tmp.pdf


Depending on the actual memory size, I may have used other partitions
(/dev/mtd4) and input file size (2880044 and 320044 bytes).


The series was tested with the following QSPI memories:

Spansion/Cypress:
- s25fl127s	OK
- s25fl512s	OK
- s25fl164k	OK

Micron:
- n25q128a	OK
- n25q512	OK
- n25q01g	OK

Macronix:
- mx25v1635f	OK
- mx25l3235f	OK
- mx25l3273f	OK
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

ChangeLog:

v2 -> v3
- tested with new samples: Micron n25q512, n25q01g and Macronix
  mx25v1635f, mx25l3235f, mx25l3273f.
- add "Reviewed-by: Jagan Teki <jagan@openedev.com>" on patch 1.
- add "Tested-by: Vignesh R <vigneshr@ti.com>" on patch 2.
- fix some checkpatch warnings.
- add call of spi_nor_wait_till_ready() in spansion_new_quad_enable() 
  and sr2_bit7_quad_enable(), as suggested by Joel Esponde on patch 6.
- test JESD216 rev A (minor 5) instead of rev B (minor 6) with the return
  code of spi_nor_parse_sfdp() from spi_nor_init_params() on patch 6.
  The seven additional DWORDs of the Basic Flash Parameter Table were
  introduced in rev A, not rev B, so the 15th DWORD was already available
  in rev A. The 15th DWORD provides us with the Quad Enable Requirements
  (QER) bits.
  Basic Flash Parameter Table size:
  + JESD216 :  9 DWORDS
  + JESD216A: 16 DWORDS
  + JESD216B: 16 DWORDS

v1 -> v2
- fix patch 3 to resolve compiler errors on hisi-sfc.c and cadence-quadspi.c
  drivers


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

 drivers/mtd/devices/m25p80.c            |  204 ++++--
 drivers/mtd/devices/serial_flash_cmds.h |    7 -
 drivers/mtd/devices/st_spi_fsm.c        |   28 +-
 drivers/mtd/spi-nor/atmel-quadspi.c     |   83 ++-
 drivers/mtd/spi-nor/cadence-quadspi.c   |   18 +-
 drivers/mtd/spi-nor/fsl-quadspi.c       |    8 +-
 drivers/mtd/spi-nor/hisi-sfc.c          |   32 +-
 drivers/mtd/spi-nor/mtk-quadspi.c       |   16 +-
 drivers/mtd/spi-nor/nxp-spifi.c         |   21 +-
 drivers/mtd/spi-nor/spi-nor.c           | 1026 ++++++++++++++++++++++++++++---
 include/linux/mtd/spi-nor.h             |  165 ++++-
 11 files changed, 1372 insertions(+), 236 deletions(-)

-- 
2.7.4

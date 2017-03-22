Received: from 9.mo177.mail-out.ovh.net ([46.105.72.238])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqpm3-0005o3-7M
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 23:34:41 +0000
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id A133843617
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 00:34:11 +0100 (CET)
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: marek.vasut@gmail.com, linux-mtd@lists.infradead.org, jartur@cadence.com,
 kdasu.kdev@gmail.com, mar.krzeminski@gmail.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v5 0/6] mtd: spi-nor: parse SFDP tables to setup (Q)SPI
 memories
Date: Thu, 23 Mar 2017 00:33:50 +0100
Message-Id: <cover.1490220411.git.cyrille.pitchen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

based on git-hub/spi-nor and likely applicable on linux-next within the
next few days.


This new series of patchs aims to upgrade to spi-nor framework. We need to
take into account latest SPI memories which cannot be handled correctly by
the current implementation.

For instance, SPI NOR memories like Spansion S25FS512S or Macronix
MX25U4035 support only the Fast Read 1-4-4 (EBh) command but not the
Fast Read 1-1-4 (6Bh) command. However the current spi-nor framework
supports only Fast Read 1-1-4 (6Bh).

Also the Spansion S25FS512S memory (and others) may use a non-uniform
sector erase map, whereas the spi-nor framework assumes that a single
sector erase size and opcode can be used anywhere inside the data array.
This assumption is no longer valid.

Then parsing SFDP tables is an attempt to solve many of those issues by
discovering dynamically most of the parameters and settings of the SPI NOR
memory:
- the flash size
- the page size for Page Program commands
- the supported Fast Read commands with the associated opcodes and number
  of mode/wait-state (dummy) cycles.
- the supported Sector/Block Erase commands with the associated opcodes
  and sizes.
- the erase sector map (for non-uniform memory).


Besides, most QSPI controllers from the different vendors are capable to
support the SPI 1-2-2 and 1-4-4 protocols but the spi-nor framework was
not ready to use them. This series also fixes this issue and computes the
best match between the hardware capabilies of both the SPI memory and the
SPI controler (master) to select the right opcodes and dummy cycles for
Fast Read and Page Program operations.

The new 'struct spi_nor_hwcaps' uses a bitmask to describe all the
supported hardware capabilies and makes the difference between Fast Read
and Page Program operations and also between the different SPI protocols
(SPI 1-1-2 vs SPI 1-2-2 or SPI 1-1-4 vs SPI 1-4-4).


IMHO, the first 3 patches of this series are ready to be merged into the
github/spi-nor tree. Marek, do you agree with that?

Artur, patch 1 introduces some basic support to Octal SPI to help you with
your series. About the op code values, I would like to wait for some JEDEC
specification to provide the reference values or at least the datasheets
of different vendors to guess the actual standard. For now, IMHO, only one
manufacturer is not enough.

Kamal, if you don't mind I've put your Signed-off-by in patch 3 since the
original patch is from you so I wanted to give you the credits :)
I've just fixed some issue: in the original version, set4_byte() was
called from spi_nor_init() even if (nor->addr_width == 3).
I hope it will help you with the suspend/resume series.


The 3 last patches are RFC and are provided so it's more easy for
reviewers to understand the direction I would like to follow to upgrade
the spi-nor framework.

Marcin, I haven't finished yet another 7th patch to parse the sector erase
map table from SFDP so for now patch 4 is almost useless. Besides I only
tested it with uniform memories to avoid regressions. I may need your help
to test it with non-uniform memories, if you don't mind :)


Best regards,

Cyrille


ChangeLog:

v4 -> v5
- rework the whole series.
- introduce support for Octo SPI protocols.
- introduce support for Double Transfer Rate (DTR) protocols.
- introduce support for memories with non-uniform sector erase sizes.

v3 -> v4
- replace dev_info() by dev_dbg() in patch 1.
- split former patch 2 into 2 patches:
  + new patch 2 deals with the rename of SPINOR_OP_READ4_* macros
  + new patch 3 deals with the alternative methode to support memory
> 16MiB
- add comment in patch 3 to describe the dichotomic search performed by
  spi_nor_convert_opcode().
- change return type from int to void for m25p80_proto2nbits() in patch 6.
- remove former patches 8 & 9 from the v2 series: the support of the
  Macronix mx66l1g45g memory will be sent in a separated patch.

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


Cyrille Pitchen (6):
  mtd: spi-nor: introduce more SPI protocols and the Dual Transfer Mode
  mtd: m25p80: add support of SPI 1-2-2 and 1-4-4 protocols
  mtd: spi-nor: add spi_nor_init() function
  mtd: spi-nor: add support to non-uniform SPI NOR flash memories
  mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables
  mtd: spi-nor: parse SFDP 4-byte Address Instruction Table

 drivers/mtd/devices/m25p80.c          |  130 ++-
 drivers/mtd/spi-nor/aspeed-smc.c      |   23 +-
 drivers/mtd/spi-nor/atmel-quadspi.c   |   80 +-
 drivers/mtd/spi-nor/cadence-quadspi.c |   18 +-
 drivers/mtd/spi-nor/fsl-quadspi.c     |    8 +-
 drivers/mtd/spi-nor/hisi-sfc.c        |   31 +-
 drivers/mtd/spi-nor/intel-spi.c       |    7 +-
 drivers/mtd/spi-nor/mtk-quadspi.c     |   16 +-
 drivers/mtd/spi-nor/nxp-spifi.c       |   22 +-
 drivers/mtd/spi-nor/spi-nor.c         | 1722 +++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h           |  228 ++++-
 11 files changed, 1983 insertions(+), 302 deletions(-)

-- 
2.9.3

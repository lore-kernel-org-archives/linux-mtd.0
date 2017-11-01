Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9uzh-0000Ag-GA
 for linux-mtd@lists.infradead.org; Wed, 01 Nov 2017 15:31:58 +0000
To: Richard Weinberger <richard@nod.at>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Linux MTD Development List <linux-mtd@lists.infradead.org>,
 Shawn Guo <shawnguo@kernel.org>, Mark Brown <broonie@kernel.org>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Arnd Bergmann <arnd@arndb.de>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [GIT PULL] mtd: spi-nor: Changes for 4.15
Message-ID: <b93b03df-2ab9-0c1a-dce1-461deba6fed0@wedev4u.fr>
Date: Wed, 1 Nov 2017 16:31:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

this is the spi-nor pull request for 4.15.

Please note that a small conflict has been reported by Mark Brown on
linux-next between the spi-nor and imx-mxs trees concerning the
Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt file.

More details can be found here:
https://lkml.org/lkml/2017/11/1/255

Best regards,

Cyrille

The following changes since commit 8a5776a5f49812d29fe4b2d0a2d71675c3facf3f:

  Linux 4.14-rc4 (2017-10-08 20:53:29 -0700)

are available in the git repository at:

  git://git.infradead.org/l2-mtd.git tags/spi-nor/for-4.15

for you to fetch changes up to ec0a9f62b393ed0c5bb9185a8efebb0ad00b7d0d:

  mtd: intel-spi: Add Intel Lewisburg PCH SPI super SKU PCI ID (2017-10-30 11:51:18 +0100)

----------------------------------------------------------------
This pull-request contains the following notable changes:

Core changes:
* Introduce system power management support.
* New mechanism to select the proper .quad_enable() hook by JEDEC ID,
  when needed, instead of only by manufacturer ID.
* Add support to new memory parts from Gigadevice, Winbond, Macronix and
  Everspin.

Driver changes:
* Maintainance for Cadence, Intel, Mediatek and STM32 drivers.

----------------------------------------------------------------
Andy Yan (2):
      mtd: spi-nor: add a quad_enable callback in struct flash_info
      mtd: spi-nor: add support for GD25Q256

Bin Meng (11):
      spi-nor: intel-spi: Fix number of protected range registers for BYT/LPT
      spi-nor: intel-spi: Remove useless 'buf' parameter in the HW/SW cycle
      spi-nor: intel-spi: Fix broken software sequencing codes
      spi-nor: intel-spi: Check transfer length in the HW/SW cycle
      spi-nor: intel-spi: Use SW sequencer for BYT/LPT
      spi-nor: intel-spi: Remove 'Atomic Cycle Sequence' in intel_spi_write()
      spi-nor: intel-spi: Don't assume OPMENU0/1 to be programmed by BIOS
      spi-nor: intel-spi: Remove the unnecessary HSFSTS register RW
      spi-nor: intel-spi: Rename swseq to swseq_reg in 'struct intel_spi'
      spi-nor: intel-spi: Fall back to use SW sequencer to erase
      spi-nor: intel-spi: Remove EXPERT dependency

Geert Uytterhoeven (1):
      mtd: spi-nor: stm32-quadspi: Fix uninitialized error return code

Guochun Mao (2):
      dt-bindings: mtd: add new compatible strings and improve description
      mtd: mtk-nor: add suspend/resume support

Kamal Dasu (2):
      mtd: spi-nor: add spi_nor_init() function
      mtd: spi-nor: Add spi-nor mtd resume handler

Klaus Goger (1):
      mtd: spi-nor: add support for Gigadevice GD25LQ32

Kuppuswamy Sathyanarayanan (1):
      mtd: intel-spi: Add Intel Lewisburg PCH SPI super SKU PCI ID

Ludovic Barre (2):
      mtd: spi-nor: stm32-quadspi: change license text
      mtd: spi-nor: stm32-quadspi: fix prefetching outside fsize

Mika Westerberg (2):
      mtd: spi-nor: intel-spi: Add support for Intel Lewisburg SPI serial flash
      mtd: spi-nor: intel-spi: Add support for Intel Cedar Fork SPI serial flash

Neil Armstrong (1):
      mtd: spi-nor: Add support for Winbond w25q16dw

Philipp Puschmann (1):
      mtd: spi-nor: Add support for mr25h128

Richard Weinberger (1):
      mtd: spi-nor: Kill check with no effect

Roman Yeryomin (1):
      mtd: spi-nor: enable 4B opcodes for mx66l51235l

Thor Thayer (1):
      mtd: spi-nor: Allow Cadence QSPI support for ARM64

Vignesh R (6):
      mtd: spi-nor: cadence-quadspi: Add TI 66AK2G SoC specific compatible
      mtd: spi-nor: cadence-quadspi: add a delay in write sequence
      mtd: spi-nor: cadence-quadspi: Add new binding to enable loop-back circuit
      mtd: spi-nor: cadence-quadspi: Add support to enable loop-back clock circuit
      mtd: spi-nor: cadence-quadspi: Fix error path in probe
      mtd: spi-nor: cadence-quadspi: Add runtime PM support

 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt |   7 ++++-
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt   |   1 +
 Documentation/devicetree/bindings/mtd/mtk-quadspi.txt     |  15 ++++++-----
 drivers/mtd/devices/m25p80.c                              |   1 +
 drivers/mtd/spi-nor/Kconfig                               |   6 ++---
 drivers/mtd/spi-nor/cadence-quadspi.c                     |  55 +++++++++++++++++++++++++++++++++-----
 drivers/mtd/spi-nor/intel-spi-pci.c                       |   3 +++
 drivers/mtd/spi-nor/intel-spi.c                           | 209 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------
 drivers/mtd/spi-nor/mtk-quadspi.c                         |  70 ++++++++++++++++++++++++++++++++++++++++---------
 drivers/mtd/spi-nor/spi-nor.c                             | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------
 drivers/mtd/spi-nor/stm32-quadspi.c                       |  35 ++++++++++++++++++++-----
 include/linux/mtd/spi-nor.h                               |  10 +++++++
 12 files changed, 404 insertions(+), 113 deletions(-)

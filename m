Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dPCqZ-0005Oa-4L
 for linux-mtd@lists.infradead.org; Sun, 25 Jun 2017 19:05:25 +0000
Date: Sun, 25 Jun 2017 21:04:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [PULL] mtd: nand: Changes for 4.13
Message-ID: <20170625210459.6d360960@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here's my PR for 4.13.

As usual, let me know if you see any problem.

Thanks,

Boris

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  ssh://git.infradead.org/srv/git/l2-mtd.git tags/nand/for-4.13

for you to fetch changes up to edfee3619c4955be38d414f25bd4f6c5c1b029ba:

  mtd: nand: mtk: add ->setup_data_interface() hook (2017-06-25 16:54:03 +0200)

----------------------------------------------------------------
This pull request contains the following core changes:

* addition of on-ecc support to Micron driver
* addition of helpers to help drivers choose most appropriate ECC
  settings
* deletion of dead-code (cached programming and ->errstat() hook)
* make sure drivers that do not support the SET/GET FEATURES command
  return ENOTSUPP use a dummy ->set/get_features implementation
  returning -ENOTSUPP (required for Micron on-die ECC)
* change the semantic of ecc->write_page() for drivers setting the
  NAND_ECC_CUSTOM_PAGE_ACCESS flag
* support exiting 'GET STATUS' command in default ->cmdfunc()
  implementations
* change the prototype of ->setup_data_interface()

A bunch of driver related changes:

* various cleanup, fixes and improvements of the MTK driver
* OMAP DT bindings fixes
* support for ->setup_data_interface() in the fsmc driver
* support for imx7 in the gpmi driver
* finalization of the denali driver rework (thanks to Masahiro for the
  work he's done on this driver)
* fix "bitflips in erased pages" handling in the ifc driver
* addition of PM ops and dynamic timing configuration to the atmel
  driver

And as usual we also have a few minor cleanup/fixes/improvements
patches across the subsystem.

----------------------------------------------------------------
Alexander Couzens (1):
      mtd: nand: davinci: set ECC algorithm explicitly for HW based ECC

Alexandre Belloni (1):
      mtd: nand: atmel: drop unused include

Arnd Bergmann (1):
      mtd: nand: atmel: mark resume function __maybe_unused

Arvind Yadav (1):
      mtd: nand: orion: Handle return value of clk_prepare_enable

Boris Brezillon (15):
      mtd: nand: jz4780: Use mtd_set_ooblayout() to set the ooblayout
      mtd: nand: Make sure drivers not supporting SET/GET_FEATURES return -ENOTSUPP
      mtd: nand: gpmi: Fix gpmi_nand_init() error path
      mtd: nand: gpmi: Kill gpmi_nand_exit()
      mtd: nand: Pass the CS line to ->setup_data_interface()
      mtd: nand: atmel: Add ->setup_data_interface() hooks
      mtd: nand: atmel: Add PM ops
      mtd: nand: Drop unused cached programming support
      mtd: nand: Drop the ->errstat() hook
      mtd: nand: sunxi: Actually use DMA for subpage reads
      mtd: nand: sunxi: Remove unneeded ->cmdfunc(NAND_CMD_READ0, 0, page)
      mtd: nand: tango: Fix incorrect use of SEQIN command
      mtd: nand: Wait for PAGEPROG to finish in drivers setting NAND_ECC_CUSTOM_PAGE_ACCESS
      mtd: nand: Support 'EXIT GET STATUS' command in nand_command[_lp]()
      mtd: nand: fsl_ifc: fix handing of bit flips in erased pages

Ezequiel Garcia (2):
      mtd: nand: Add Hisilicon machine dependency
      mtd: nand: Add Mediatek machine dependency

Masahiro Yamada (25):
      mtd: nand: check ecc->total sanity in nand_scan_tail
      mtd: nand: denali_dt: clean up resource ioremap
      mtd: nand: denali: use BIT() and GENMASK() for register macros
      mtd: nand: add generic helpers to check, match, maximize ECC settings
      mtd: nand: add a shorthand to generate nand_ecc_caps structure
      mtd: nand: denali: avoid hard-coding ECC step, strength, bytes
      mtd: nand: denali: remove Toshiba and Hynix specific fixup code
      mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants
      mtd: nand: denali: set NAND_ECC_CUSTOM_PAGE_ACCESS
      mtd: nand: denali: remove unneeded find_valid_banks()
      mtd: nand: denali: handle timing parameters by setup_data_interface()
      mtd: nand: denali: rework interrupt handling
      mtd: nand: denali: switch over to cmd_ctrl instead of cmdfunc
      mtd: nand: denali: fix bank reset function to detect the number of chips
      mtd: nand: denali: use interrupt instead of polling for bank reset
      mtd: nand: denali: propagate page to helpers via function argument
      mtd: nand: denali: merge struct nand_buf into struct denali_nand_info
      mtd: nand: denali: use flag instead of register macro for direction
      mtd: nand: denali: fix raw and oob accessors for syndrome page layout
      mtd: nand: denali: support hardware-assisted erased page detection
      mtd: nand: denali: skip driver internal bounce buffer when possible
      mtd: nand: denali: use non-managed kmalloc() for DMA buffer
      mtd: nand: denali: enable bad block table scan
      mtd: nand: denali: avoid magic numbers and rename for clarification
      MAINTAINERS: add entry for Denali NAND controller driver

Matthias Lange (2):
      mtd: nand: gpmi: Fix typo in data structure name
      mtd: nand: gpmi: fix typo in comment

Pavel Machek (1):
      mtd: nand: Optimize checking of erased buffers

Prabhakar Kushwaha (1):
      mtd: nand: ifc: Initialize SRAM for all version >= 1.0

Stefan Agner (3):
      mtd: nand: gpmi: unify clock handling
      mtd: nand: gpmi: add i.MX 7 SoC support
      mtd: gpmi: document current clock requirements

Thomas Petazzoni (8):
      mtd: nand: fsmc: reduce number of arguments of fsmc_nand_setup()
      mtd: nand: fsmc: add support for SDR timings
      mtd: nand: fsmc: remove default timings
      dt-bindings: mtd: document new "on-die" nand-ecc-mode
      mtd: nand: add core support for on-die ECC
      mtd: nand: export nand_{read,write}_page_raw()
      mtd: nand: add support for Micron on-die ECC
      mtd: nand: fsmc_nand: handle on-die ECC case

Tom Rini (2):
      dt-bindings: mtd: elm: Correct compatible string requirement
      dt-bindings: gpmc: Correct location of generic gpmc binding

Xiaolei Li (9):
      mtd: nand: mediatek: update DT bindings
      mtd: nand: mediatek: refine register NFI_PAGEFMT setting
      mtd: nand: mediatek: add support for different MTK NAND FLASH Controller IP
      mtd: nand: mediatek: add support for MT2712 NAND FLASH Controller
      mtd: nand: mtk: fix incorrect register setting order about ecc irq
      mtd: nand: mtk: disable ecc irq when writing page with hwecc
      mtd: nand: mtk: remove unneeded mtk_nfc_hw_init from mtk_nfc_resume
      mtd: nand: mtk: remove unneeded mtk_ecc_hw_init from mtk_ecc_resume
      mtd: nand: mtk: add ->setup_data_interface() hook

 .../devicetree/bindings/mtd/denali-nand.txt        |   13 +
 Documentation/devicetree/bindings/mtd/elm.txt      |    2 +-
 .../devicetree/bindings/mtd/gpmc-nand.txt          |    2 +-
 Documentation/devicetree/bindings/mtd/gpmc-nor.txt |    4 +-
 .../devicetree/bindings/mtd/gpmc-onenand.txt       |    2 +-
 .../devicetree/bindings/mtd/gpmi-nand.txt          |   14 +-
 Documentation/devicetree/bindings/mtd/mtk-nand.txt |    5 +-
 Documentation/devicetree/bindings/mtd/nand.txt     |    2 +-
 Documentation/devicetree/bindings/net/gpmc-eth.txt |    4 +-
 MAINTAINERS                                        |    6 +
 drivers/mtd/nand/Kconfig                           |    3 +
 drivers/mtd/nand/atmel/nand-controller.c           |  354 +++-
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c       |    2 +
 drivers/mtd/nand/cafe_nand.c                       |    2 +
 drivers/mtd/nand/davinci_nand.c                    |    3 +
 drivers/mtd/nand/denali.c                          | 1831 +++++++++-----------
 drivers/mtd/nand/denali.h                          |  315 ++--
 drivers/mtd/nand/denali_dt.c                       |   53 +-
 drivers/mtd/nand/denali_pci.c                      |   26 +-
 drivers/mtd/nand/docg4.c                           |    2 +
 drivers/mtd/nand/fsl_elbc_nand.c                   |    2 +
 drivers/mtd/nand/fsl_ifc_nand.c                    |   81 +-
 drivers/mtd/nand/fsmc_nand.c                       |  122 +-
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c              |    6 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |   75 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |   13 +-
 drivers/mtd/nand/hisi504_nand.c                    |    2 +
 drivers/mtd/nand/jz4780_nand.c                     |    2 +-
 drivers/mtd/nand/mpc5121_nfc.c                     |    2 +
 drivers/mtd/nand/mtk_ecc.c                         |  226 +--
 drivers/mtd/nand/mtk_ecc.h                         |    2 +-
 drivers/mtd/nand/mtk_nand.c                        |  279 +--
 drivers/mtd/nand/mxc_nand.c                        |   12 +-
 drivers/mtd/nand/nand_base.c                       |  349 +++-
 drivers/mtd/nand/nand_micron.c                     |  222 +++
 drivers/mtd/nand/orion_nand.c                      |    6 +-
 drivers/mtd/nand/pxa3xx_nand.c                     |    2 +
 drivers/mtd/nand/qcom_nandc.c                      |    2 +
 drivers/mtd/nand/s3c2410.c                         |    5 +-
 drivers/mtd/nand/sh_flctl.c                        |    2 +
 drivers/mtd/nand/sunxi_nand.c                      |    9 +-
 drivers/mtd/nand/tango_nand.c                      |   22 +-
 drivers/mtd/nand/vf610_nfc.c                       |    2 +
 drivers/staging/mt29f_spinand/mt29f_spinand.c      |    2 +
 include/linux/mtd/nand.h                           |   80 +-
 45 files changed, 2544 insertions(+), 1628 deletions(-)

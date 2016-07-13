Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNF2V-00016R-JR
 for linux-mtd@lists.infradead.org; Wed, 13 Jul 2016 07:57:04 +0000
Date: Wed, 13 Jul 2016 09:56:40 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PULL v2] mtd: nand: Changes for 4.8
Message-ID: <20160713095640.34bb9f1a@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Here is the 2nd version of my first PR for 4.8. I removed the duplicate
SoB tag on one of my patch, and the static specifier in "mtd: brcmnand:
Detect sticky ucorr ecc error on dma reads"

Let me know if you find something wrong in this v2.

Thanks,

Boris

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git@github.com:linux-nand/linux.git tags/nand/for-4.8

for you to fetch changes up to 8490c03bd9d40ce71d9b67dcf93e73788ba0516d:

  mtd: nand: jz4780: Update MODULE_AUTHOR email address (2016-07-11 08:40:1=
9 +0200)

----------------------------------------------------------------
This pull request contains only one notable change:
* Addition of the MTK NAND controller driver

And a bunch of specific NAND driver improvements/fixes. Here are the
changes that are worth mentioning:
* A few fixes/improvements for the xway NAND controller driver
* A few fixes for the sunxi NAND controller driver
* Support for DMA in the sunxi NAND driver
* Support for the sunxi NAND controller IP embedded in A23/A33 SoCs
* Addition for bitflips detection in erased pages to the brcmnand driver
* Support for new brcmnand IPs
* Update of the OMAP-GPMC binding to support DMA channel description

----------------------------------------------------------------
Boris Brezillon (6):
      mtd: nand: sunxi: add support for DMA assisted operations
      mtd: nand: sunxi: update DT bindings
      mtd: nand: sunxi: Fix OOB bytes retrieval in read_chunks_dma()
      mtd: nand: sunxi: prefer 1k ECC blocks when applicable
      mtd: nand: sunxi: check ecc->size values
      mtd: nand: sunxi: fix subpage write

Cooper Jr., Franklin (2):
      mtd: nand: omap2: Support parsing dma channel information from DT
      ARM: OMAP2+: Update GPMC and NAND DT binding documentation

Dan Carpenter (1):
      mtd: nand: sunxi: prevent a small memory leak

Florian Fainelli (1):
      mtd: brcmnand: Add v7.2 controller support

Harvey Hunt (1):
      mtd: nand: jz4780: Update MODULE_AUTHOR email address

Hauke Mehrtens (6):
      mtd: nand: xway: add some more documentation
      mtd: nand: xway: convert to normal platform driver
      mtd: nand: xway: remove manual reset
      mtd: nand: xway: extract read and write function
      mtd: nand: xway: add missing write_buf and read_buf to nand driver
      mtd: nand: xway: add nandaddr to own struct

Icenowy Zheng (2):
      mtd: nand: sunxi: update DT bindings
      mtd: nand: sunxi: add reset line support

Iwo Mergler (1):
      mtd: nandbiterrs: Support for NAND biterrors test on platforms withou=
t raw write

John Crispin (2):
      mtd: nand: xway: Avoid messing up with IO_ADDR_W in ->cmd_ctrl()
      mtd: nand: xway: fix nand locking

Jorge Ramirez-Ortiz (2):
      mtd: mediatek: device tree bindings for MTK
      mtd: mediatek: driver for MTK Smart Device

Kamal Dasu (2):
      mtd: brcmnand: Add check for erased page bitflips
      mtd: brcmnand: Detect sticky ucorr ecc error on dma reads

Rafa=C5=82 Mi=C5=82ecki (1):
      mtd: nand: add ESMT manufacturer

Wei Yongjun (1):
      mtd: nand: sunxi: fix return value check in sunxi_nfc_dma_op_prepare()

 .../bindings/memory-controllers/omap-gpmc.txt      |    7 +-
 .../devicetree/bindings/mtd/brcm,brcmnand.txt      |    1 +
 .../devicetree/bindings/mtd/gpmc-nand.txt          |    2 +-
 Documentation/devicetree/bindings/mtd/mtk-nand.txt |  160 ++
 .../devicetree/bindings/mtd/sunxi-nand.txt         |    6 +
 drivers/mtd/nand/Kconfig                           |    8 +-
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/brcmnand/brcmnand.c               |  171 ++-
 drivers/mtd/nand/jz4780_bch.c                      |    2 +-
 drivers/mtd/nand/jz4780_nand.c                     |    2 +-
 drivers/mtd/nand/mtk_ecc.c                         |  530 +++++++
 drivers/mtd/nand/mtk_ecc.h                         |   50 +
 drivers/mtd/nand/mtk_nand.c                        | 1526 ++++++++++++++++=
++++
 drivers/mtd/nand/nand_ids.c                        |    1 +
 drivers/mtd/nand/omap2.c                           |    7 +-
 drivers/mtd/nand/sunxi_nand.c                      |  397 ++++-
 drivers/mtd/nand/xway_nand.c                       |  231 +--
 drivers/mtd/tests/nandbiterrs.c                    |    2 +-
 include/linux/mtd/nand.h                           |    1 +
 19 files changed, 2981 insertions(+), 124 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
 create mode 100644 drivers/mtd/nand/mtk_ecc.c
 create mode 100644 drivers/mtd/nand/mtk_ecc.h
 create mode 100644 drivers/mtd/nand/mtk_nand.c

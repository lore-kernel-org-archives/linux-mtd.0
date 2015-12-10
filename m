From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Ryan Mallon <rmallon@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, Alexander Clouter <alex@digriz.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Marek Vasut <marek.vasut@gmail.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net,
 Mikael Starvik <starvik@axis.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-cris-kernel@axis.com,
 Josh Wu <josh.wu@atmel.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 00/58]  mtd: nand: refactor the NAND subsystem (part 1)
Date: Thu, 10 Dec 2015 08:59:44 +0100
Message-Id: <1449734442-18672-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This huge series aims at clarifying the relationship between the mtd and
nand_chip structures and hiding NAND framework internals to NAND
controller drivers.

The first part of the series (patch 1 to 4) is a set of fixes/simple
reworks easing the migration to mtd_to_nand().

The second part of the series embeds the mtd structure into the nand_chip
one so that NAND controller drivers don't have to bother allocating the
MTD device and linking it with the NAND chip.

The last part of the series hides accesses to the chip->priv field behind
two helper functions.

This allows removal of some of the boilerplate code done in all NAND
controller drivers, but most importantly, it unifies a bit the way NAND
chip structures are instantiated (even though we still have two different
kinds of drivers: those embedding the nand_chip struct into their private
nand chip representation, and those allocating two different structures
and linking them together with the chip->priv field).

As said in the title, this refactoring is only the first step. I plan to
rework the NAND controller / NAND chip separation for pretty much the same
reasons: clarifying the separation between the two concepts, and getting
rid of more boilerplate code in NAND controller drivers.

Stay tuned ;-).

Best Regards,

Boris

Changes since v3:
- fix some bugs introduced when migrating to nand_to_mtd()
- split the huge commit switching all drivers to nand_to_mtd() into several
  commits (one per driver) to ease review and integration
- add a simple fixes/reworks at the beginning of the series (mainly to
  ease migration to nand_to_mtd())
- drop already applied patches.

Changes since v2:
- fix some build warnings/erros

Changes since v1:
- dropped already applied patches
- fixed some typos
- manually fixed some modifications omitted by the coccinelle scripts
- manually reworked modifactions done by coccinelle scripts to improve
  readability and fix coding style issues

*** BLURB HERE ***

Boris Brezillon (58):
  mtd: nand: denali: add missing nand_release() call in denali_remove()
  mtd: nand: fsmc: create and use mtd_to_fsmc()
  mtd: nand: nuc900: create and use mtd_to_nuc900()
  mtd: nand: omap2: create and use mtd_to_omap()
  mtd: nand: ams-delta: use the mtd instance embedded in struct
    nand_chip
  mtd: nand: atmel: use the mtd instance embedded in struct nand_chip
  mtd: nand: au1550nd: use the mtd instance embedded in struct nand_chip
  mtd: nand: bcm47xx: use the mtd instance embedded in struct nand_chip
  mtd: nand: bf5xx: use the mtd instance embedded in struct nand_chip
  mtd: nand: brcm: use the mtd instance embedded in struct nand_chip
  mtd: nand: cafe: use the mtd instance embedded in struct nand_chip
  mtd: nand: cmx270: use the mtd instance embedded in struct nand_chip
  mtd: nand: cs553x: use the mtd instance embedded in struct nand_chip
  mtd: nand: davinci: use the mtd instance embedded in struct nand_chip
  mtd: nand: denali: use the mtd instance embedded in struct nand_chip
  mtd: nand: diskonchip: use the mtd instance embedded in struct
    nand_chip
  mtd: nand: docg4: use the mtd instance embedded in struct nand_chip
  mtd: nand: fsl_elbc: use the mtd instance embedded in struct nand_chip
  mtd: nand: fsl_ifc: use the mtd instance embedded in struct nand_chip
  mtd: nand: fsl_upm: use the mtd instance embedded in struct nand_chip
  mtd: nand: fsmc: use the mtd instance embedded in struct nand_chip
  mtd: nand: gpio: use the mtd instance embedded in struct nand_chip
  mtd: nand: gpmi: use the mtd instance embedded in struct nand_chip
  mtd: nand: hisi504: use the mtd instance embedded in struct nand_chip
  mtd: nand: jz4740: use the mtd instance embedded in struct nand_chip
  mtd: nand: lpc32xx: use the mtd instance embedded in struct nand_chip
  mtd: nand: mpc5121: use the mtd instance embedded in struct nand_chip
  mtd: nand: mxc: use the mtd instance embedded in struct nand_chip
  mtd: nand: nandsim: use the mtd instance embedded in struct nand_chip
  mtd: nand: ndfc: use the mtd instance embedded in struct nand_chip
  mtd: nand: nuc900: use the mtd instance embedded in struct nand_chip
  mtd: nand: omap2: use the mtd instance embedded in struct nand_chip
  mtd: nand: orion: use the mtd instance embedded in struct nand_chip
  mtd: nand: pasemi: use the mtd instance embedded in struct nand_chip
  mtd: nand: plat: use the mtd instance embedded in struct nand_chip
  mtd: nand: pxa3xx: use the mtd instance embedded in struct nand_chip
  mtd: nand: r852: use the mtd instance embedded in struct nand_chip
  mtd: nand: s3c2410: use the mtd instance embedded in struct nand_chip
  mtd: nand: sh_flctl: use the mtd instance embedded in struct nand_chip
  mtd: nand: sharpsl: use the mtd instance embedded in struct nand_chip
  mtd: nand: socrates: use the mtd instance embedded in struct nand_chip
  mtd: nand: sunxi: use the mtd instance embedded in struct nand_chip
  mtd: nand: tmio: use the mtd instance embedded in struct nand_chip
  mtd: nand: txx9ndfmc: use the mtd instance embedded in struct
    nand_chip
  mtd: nand: vf610: use the mtd instance embedded in struct nand_chip
  mtd: nand: update the documentation to reflect framework changes
  staging: mt29f_spinand: use the mtd instance embedded in struct
    nand_chip
  cris: nand: use the mtd instance embedded in struct nand_chip
  mtd: nand: update mtd_to_nand()
  mtd: nand: remove useless mtd->priv = chip assignments
  cris: nand: remove useless mtd->priv = chip assignments
  staging: mt29f_spinand: remove useless mtd->priv = chip assignment
  mtd: nand: simplify nand_dt_init() usage
  mtd: nand: kill the chip->flash_node field
  mtd: nand: add helpers to access ->priv
  ARM: make use of nand_set/get_controller_data() helpers
  mtd: nand: make use of nand_set/get_controller_data() helpers
  staging: mt29f_spinand: make use of nand_set/get_controller_data()
    helpers

 Documentation/DocBook/mtdnand.tmpl             | 31 +++++-----
 arch/arm/mach-ixp4xx/ixdp425-setup.c           |  4 +-
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c |  6 +-
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c |  6 +-
 drivers/mtd/nand/ams-delta.c                   | 22 +++----
 drivers/mtd/nand/atmel_nand.c                  | 69 ++++++++++-----------
 drivers/mtd/nand/au1550nd.c                    | 18 +++---
 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h |  1 -
 drivers/mtd/nand/bcm47xxnflash/main.c          |  9 +--
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c   | 18 +++---
 drivers/mtd/nand/bf5xx_nand.c                  | 13 ++--
 drivers/mtd/nand/brcmnand/brcmnand.c           | 44 +++++++------
 drivers/mtd/nand/cafe_nand.c                   | 35 ++++++-----
 drivers/mtd/nand/cmx270_nand.c                 | 14 ++---
 drivers/mtd/nand/cs553x_nand.c                 | 18 +++---
 drivers/mtd/nand/davinci_nand.c                | 29 ++++-----
 drivers/mtd/nand/denali.c                      | 68 ++++++++++++---------
 drivers/mtd/nand/denali.h                      |  1 -
 drivers/mtd/nand/diskonchip.c                  | 85 +++++++++++++-------------
 drivers/mtd/nand/docg4.c                       | 66 ++++++++++----------
 drivers/mtd/nand/fsl_elbc_nand.c               | 47 +++++++-------
 drivers/mtd/nand/fsl_ifc_nand.c                | 53 ++++++++--------
 drivers/mtd/nand/fsl_upm.c                     | 28 +++++----
 drivers/mtd/nand/fsmc_nand.c                   | 54 ++++++++--------
 drivers/mtd/nand/gpio.c                        | 20 +++---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c          |  2 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c         | 52 ++++++++--------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h         |  1 -
 drivers/mtd/nand/hisi504_nand.c                | 34 +++++------
 drivers/mtd/nand/jz4740_nand.c                 | 10 ++-
 drivers/mtd/nand/lpc32xx_mlc.c                 | 27 ++++----
 drivers/mtd/nand/lpc32xx_slc.c                 | 28 ++++-----
 drivers/mtd/nand/mpc5121_nfc.c                 | 28 ++++-----
 drivers/mtd/nand/mxc_nand.c                    | 42 ++++++-------
 drivers/mtd/nand/nand_base.c                   | 18 +++---
 drivers/mtd/nand/nandsim.c                     | 17 +++---
 drivers/mtd/nand/ndfc.c                        | 39 ++++++------
 drivers/mtd/nand/nuc900_nand.c                 | 38 +++++-------
 drivers/mtd/nand/omap2.c                       | 68 ++++++++-------------
 drivers/mtd/nand/orion_nand.c                  |  9 ++-
 drivers/mtd/nand/pasemi_nand.c                 | 13 ++--
 drivers/mtd/nand/plat_nand.c                   | 16 ++---
 drivers/mtd/nand/pxa3xx_nand.c                 | 54 ++++++++--------
 drivers/mtd/nand/r852.c                        | 39 ++++++------
 drivers/mtd/nand/r852.h                        |  1 -
 drivers/mtd/nand/s3c2410.c                     | 25 ++++----
 drivers/mtd/nand/sh_flctl.c                    |  9 ++-
 drivers/mtd/nand/sharpsl.c                     | 21 ++++---
 drivers/mtd/nand/socrates_nand.c               | 17 +++---
 drivers/mtd/nand/sunxi_nand.c                  | 14 ++---
 drivers/mtd/nand/tmio_nand.c                   | 11 ++--
 drivers/mtd/nand/txx9ndfmc.c                   | 13 ++--
 drivers/mtd/nand/vf610_nfc.c                   |  9 +--
 drivers/staging/mt29f_spinand/mt29f_spinand.c  | 15 ++---
 include/linux/mtd/nand.h                       | 19 ++++--
 include/linux/mtd/sh_flctl.h                   |  3 +-
 56 files changed, 699 insertions(+), 752 deletions(-)

-- 
2.1.4

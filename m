Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiJtr-0000Iv-Df
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 13:32:22 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>, Stefan Agner <stefan@agner.ch>,
 Lucas Stach <dev@lynxeye.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 00/17] Allow dynamic allocations during NAND chip
 identification phase
Date: Wed, 25 Jul 2018 15:31:35 +0200
Message-Id: <20180725133152.30898-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This series make a quite deep change in the NAND framework. Until now,
the NAND chip identification phase could be done in two manners from the
controller driver perspective:

1/ Call nand_scan()

  or

1/ Call nand_scan_ident()
2/ Do some controller-dependent configuration
3/ Call nand_scan_tail().

The fact that the identifaction could be split in two operations
involved that in the NAND framework, it was not possible to do any
dynamic allocation without risking a memory leak. What if the core
allocates a structure, then the driver between nand_scan_ident() and
nand_scan_tail() decides it cannot handle the chip and errors out?
The structure allocated by the core is lost: it is a memory leak. One
solution could have been to add a nand_scan_ident_cleanup() function,
but that would mean patching all the drivers anyway to make them call
this function when something fails between nand_scan_ident() and
nand_scan_tail().

To avoid this situation, we migrate all drivers to use nand_scan() in
conjuction with the recently added hooks ->attach_chip() and
->detach_chip() that are part of the nand_controller structure
operations. Drivers that need to tweak their configuration after
nand_scan_ident() should implement it. Any dynamically allocated space
in ->attach_chip() must be freed in the second hook: ->detach_chip().

The ->detach_chip() does not have to be called upon error in the
controller driver probe function. The nand_cleanup() helper already
exists for that and will do the call if needed. Of course, this helper
must be called on error after a successful nand_scan(), just like
before.

Once all drivers not using nand_scan() are migrated, nand_scan_ident()
and nand_scan_tail() are unexported and only available internally.

A previous work [1] removed the ONFI/JEDEC parameter pages and instead
allocated a nand_parameters structure in nand_chip, embedding both
generic entries and ONFI-related ones. The deal was, once dynamic
allocation possible, allocate in nand_scan_ident() the ONFI strcuture
only if actually needed. This is done in the last patches.

This series applies on top of nand/next.

Thank you,
Miquèl

[1] http://lists.infradead.org/pipermail/linux-mtd/2018-March/079456.html

Changes since v4:
=================
* Applied patches have been trimmed out of the series.
* Commit logs have been reworded a bit as suggested by Boris (done as
  well with applied commits).
* Always assigned the controller operations where the controller
  structure was initialized.
* brcmnand: moved the whole chunk between _ident() and _tail() in
  brcmnand_attach_chip().
* cafe: fixed the use of the useddma module parameter.
* denali: removed kfree(denali->buf) from denali_remove() as it is
  already done in ->detach_chip().
* lpc32xx_mlc: moved the IRQ handling out of the ->attach_chip()
  callback.
* txx9ndfmc: moved the block about ecc.size/bytes in
  txx9ndfmc_nand_scan() for more clarity.
* atmel: moved all the code in atmel_nand_register() directly in
  atmel_nand_controller_add_nand() + renamed atmel_nand_unregister()
  into atmel_nand_controller_remove_nand().
* nand_scan_ident: move the check on maxchips in nand_scan_with_ids()
  and the comment about it in the kernel doc (will no run
  nand_scan_ident() if zero).
* docg4: added a ->detach_chip() to fee the allocated BCH context.
* jz4740: fixed the error path and added a patch to clarify the
  transition to nand_scan(). Also removed unneeded curly braces
  and removed useless pdev parameters from the driver private
  structure (added in this series).
* core: moved the definition of nand_release() close to nand_cleanup()
  in rawnand.h while updating the comments.
* micron: only check for the ->onfi pointer to be present, not the
  vendor revision which is redundant.

Changes since v3:
=================
* Constified all the nand_controller_ops structure definitions.
* Fixed a build issue in fsl_elbc.
* Added a patch in the core to prevent executing nand_scan_ident if
  maxchips is NULL.
* Fixed the regression around the model name.
* Used kstrdup to allocate the model.
* The migration from char model[] to const char *model is done in a
  separate patch.

Changes since v2:
=================
* Rebased on top of nand/next.
* Adapted all drivers to declare statically a nand_controller_ops
  structure and assign it in the probe().
* Added the migration of the tegra_nand.c driver.
* Moved brcmnand controller ops affectation in the probe().

Changes since v1:
=================
* Rebased on top of nand/next.
* Light rewording of the cover letter about the possibility to have a
  nand_scan_ident_cleanup() function (just as example of how this series
  could have been done differently).
* Changed the hooks to reside in the nand_hw_ctrl structure instead of
  being part of nand_ecc_ctrl as these hooks are more
  controller-related.


Miquel Raynal (17):
  mtd: rawnand: brcmnand: convert driver to nand_scan()
  mtd: rawnand: cafe: convert driver to nand_scan()
  mtd: rawnand: lpc32xx_mlc: convert driver to nand_scan()
  mtd: rawnand: omap2: convert driver to nand_scan()
  mtd: rawnand: atmel: clarify NAND addition/removal paths
  mtd: rawnand: atmel: convert driver to nand_scan()
  mtd: rawnand: do not execute nand_scan_ident() if maxchips is zero
  mtd: rawnand: docg4: convert driver to nand_scan()
  mtd: rawnand: jz4740: fix probe function error path
  mtd: rawnand: jz4740: group nand_scan_{ident,tail} calls
  mtd: rawnand: jz4740: convert driver to nand_scan()
  mtd: rawnand: tegra: convert driver to nand_scan()
  mtd: rawnand: txx9ndfmc: clarify ECC parameters assignation
  mtd: rawnand: txx9ndfmc: convert driver to nand_scan()
  mtd: rawnand: do not export nand_scan_[ident|tail]() anymore
  mtd: rawnand: allocate model parameter dynamically
  mtd: rawnand: allocate dynamically ONFI parameters during detection

 drivers/mtd/nand/raw/atmel/nand-controller.c | 149 ++++----
 drivers/mtd/nand/raw/brcmnand/brcmnand.c     |  63 ++--
 drivers/mtd/nand/raw/cafe_nand.c             | 135 ++++---
 drivers/mtd/nand/raw/docg4.c                 |  70 ++--
 drivers/mtd/nand/raw/jz4740_nand.c           |  40 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c           |  61 +--
 drivers/mtd/nand/raw/nand_base.c             | 134 ++++---
 drivers/mtd/nand/raw/nand_micron.c           |   6 +-
 drivers/mtd/nand/raw/nand_timings.c          |  12 +-
 drivers/mtd/nand/raw/omap2.c                 | 533 +++++++++++++--------------
 drivers/mtd/nand/raw/tegra_nand.c            | 162 ++++----
 drivers/mtd/nand/raw/txx9ndfmc.c             |  32 +-
 include/linux/mtd/rawnand.h                  |  26 +-
 13 files changed, 762 insertions(+), 661 deletions(-)

-- 
2.14.1

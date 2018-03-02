Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erlcS-0004Jo-5A
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 14:25:13 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 00/14] Improve timings handling in the NAND framework
Date: Fri,  2 Mar 2018 15:24:08 +0100
Message-Id: <20180302142422.2543-1-miquel.raynal@bootlin.com>
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

This series evolves how GET/SET_FEATURES operations are handled by the
NAND core by adding two helpers that should be called instead of calling
directly the ->onfi_get/set_feature() hooks.

Then, the parameter page that was always allocated no matter if the NAND
core could make use of it is dropped. Instead, a much smaller structure
is embedded in the nand_chip structure and just stores the information
that will be useful for the core. Future enhancements of the core that
will need more information will just have to add a new entry in this
structure and fill it during the detection phase. A bitmap is used to
know which optional feature is actually supported.

This give the possibility in vendor code to overload this bitmap and
force the addition/removal of supported features in the list, depending
for instance on the NAND chip currently being used.

This new possibility is effectively used for Macronix NAND chip
MX30LF2G18AC. This chip supports natively the timing mode 5, and its
parameter page indicates that it supports GET/SET_FEATURES on timing
modes, while in reality it does not. Removing this feature from the
supported bitmap makes it usable at high speed instead of unnecessarily
limiting it to timing mode 0.

Thank you,
Miquèl

Changes since v2:
=================
  - Squashed the series with another preparation series not yet merged
    about GPMI timings improvements. Core patches are here now, while a
    second series with only GPMI-related changes will be sent very soon.
  - s/support_setting_features/supports_set_get_features/
  - Used a bitmap for set_features and another for get_features.
  - Removed repetiting setting the timings mode parameters bit in the
    supported features bitmap in Micron driver.
  - Split the commit removing the parameter pages in three (one that
    adds the new structure, one that get rid of JEDEC parameter page,
    one that get rid of ONFI parameter page).
  - Moved the ONFI-specific fields in the nand_parameters structure
    into an onfi_parameters structure within it. It is statically
    allocated today, and will move to dynamic allocation in the near
    future.
  - Removed the __packed attribute on the nand_parameters structure.

Changes since v1:
=================
  - Some changes, a bit unrelated to what we try to achieve here have
    been moved to the series that prepares this one.
  - Change the formula in Macronix code that determines if we are
    dealing with the failing chip.


Miquel Raynal (14):
  mtd: rawnand: rename default ->onfi_get/set_features() implementations
  mtd: rawnand: rename SET/GET FEATURES related functions
  mtd: rawnand: mxc: rename the local ->set/get_features()
    implementation
  mtd: rawnand: move calls to ->select_chip() in
    nand_setup_data_interface()
  mtd: rawnand: check ONFI timings have been acked by the chip
  mtd: rawnand: avoid setting again the timings to mode 0 after a reset
  mtd: rawnand: use wrappers to call onfi GET/SET_FEATURES
  mtd: rawnand: mxc: remove useless checks in GET/SET_FEATURES functions
  mtd: rawnand: prepare the removal of ONFI/JEDEC parameter pages
  mtd: rawnand: prepare the removal of the ONFI parameter page
  mtd: rawnand: allow vendors to declare (un)supported features
  mtd: rawnand: macronix: nack the support of changing timings for one
    chip
  mtd: rawnand: get rid of the JEDEC parameter page in nand_chip
  mtd: rawnand: get rid of the ONFI parameter page in nand_chip

 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c |   4 +-
 drivers/mtd/nand/raw/cafe_nand.c                 |   4 +-
 drivers/mtd/nand/raw/docg4.c                     |   4 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c             |   4 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c              |   4 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c        |   8 +-
 drivers/mtd/nand/raw/hisi504_nand.c              |   4 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c               |   4 +-
 drivers/mtd/nand/raw/mxc_nand.c                  |  24 +-
 drivers/mtd/nand/raw/nand_base.c                 | 282 ++++++++++++++++-------
 drivers/mtd/nand/raw/nand_macronix.c             |  10 +
 drivers/mtd/nand/raw/nand_micron.c               |  39 ++--
 drivers/mtd/nand/raw/nand_timings.c              |  10 +-
 drivers/mtd/nand/raw/pxa3xx_nand.c               |   4 +-
 drivers/mtd/nand/raw/qcom_nandc.c                |   4 +-
 drivers/mtd/nand/raw/sh_flctl.c                  |   4 +-
 drivers/mtd/nand/raw/vf610_nfc.c                 |   4 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c    |   4 +-
 include/linux/mtd/rawnand.h                      |  76 +++---
 19 files changed, 307 insertions(+), 190 deletions(-)

-- 
2.14.1

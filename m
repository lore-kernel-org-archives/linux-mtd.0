Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ehuYY-0002QG-1n
 for linux-mtd@lists.infradead.org; Sat, 03 Feb 2018 09:56:24 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/6] Improve timings handling in the NAND framework
Date: Sat,  3 Feb 2018 10:55:38 +0100
Message-Id: <20180203095544.9855-1-miquel.raynal@bootlin.com>
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

Miquel Raynal (6):
  mtd: nand: Avoid setting again the timings to mode 0 after a reset
  mtd: nand: Use wrappers to call onfi GET/SET_FEATURES
  mtd: nand: mxc: Remove useless checks in GET/SET_FEATURES functions
  mtd: nand: Stop using a static parameter page for all chips
  mtd: nand: Allow vendors to declare (un)supported features
  mtd: nand: macronix: Unflag the support of changing timings for
    MX30LF2G18AC

 drivers/mtd/nand/mxc_nand.c      |  10 --
 drivers/mtd/nand/nand_base.c     | 259 ++++++++++++++++++++++++++-------------
 drivers/mtd/nand/nand_macronix.c |  12 ++
 drivers/mtd/nand/nand_micron.c   |  35 +++---
 drivers/mtd/nand/nand_timings.c  |  10 +-
 include/linux/mtd/rawnand.h      |  53 ++++----
 6 files changed, 231 insertions(+), 148 deletions(-)

-- 
2.14.1

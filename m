Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhbrk-0004mN-B4
 for linux-mtd@lists.infradead.org; Wed, 07 Sep 2016 12:22:09 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] mtd: nand: automate NAND timings selection
Date: Wed,  7 Sep 2016 14:21:35 +0200
Message-Id: <1473250902-31139-1-git-send-email-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series aims at automating the NAND timings selection which is
currently supposed to be done in each NAND controller driver, thus
simplifying drivers implementation.

As suggested by Boris this version of the series introduces a nand_reset()
function which replaces the several open coded NAND_CMD_RESET commands
in the code. This makes sure we can apply the timing each time after
after reset.

Also I have brought back the conversion patch for teh sunxi driver whic
was part of Boris initial posting. It's untested due to the lack of hardware,
so please test before applying.

Sascha

Changes since v2:
- Add accessor function to get the SDR timing from struct nand_data_interface
- Change nand_reset() argument to struct nand_chip
- Drop conversion of nand_timing array to struct nand_data_interface
- Recalculate timing whenever needed instead of storing a pointer in struct
  nand_chip
- some more refactoring

Changes since v1:
- create a nand_reset() function to create a single place to reset NAND
  chips and to apply timings
- Add patch to convert sunxi driver for automated timing setup
- split into more patches

Changes since the initial posting from Boris:

- Integrate Feedback from Ezequiel Garcia
- When iterating over the chips calling onfi_set_features() for each
  bail out when any of the calls fail, not only the last one.
- When one of the onfi_set_features() calls fail then reset the chipi
  afterwards.
- Drop Sunxi example, add patch for the mxc_nand controller instead.

----------------------------------------------------------------
Boris Brezillon (1):
      mtd: nand: automate NAND timings selection

Sascha Hauer (6):
      mtd: nand: Create a NAND reset function
      mtd: nand: Introduce nand_data_interface
      mtd: nand: sunxi: switch from manual to automated timing config
      mtd: nand: mxc: implement onfi get/set features
      mtd: nand: mxc: Add timing setup for v2 controllers
      mtd: nand: remove unnecessary 'extern' from function declarations

 drivers/mtd/nand/mxc_nand.c   | 133 ++++++++++++++++++++++++++
 drivers/mtd/nand/nand_base.c  | 157 ++++++++++++++++++++++++++++++-
 drivers/mtd/nand/sunxi_nand.c |  76 +++------------
 include/linux/mtd/nand.h      | 211 ++++++++++++++++++++++++++++--------------
 4 files changed, 442 insertions(+), 135 deletions(-)

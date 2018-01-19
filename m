Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ecSx8-0002ck-W2
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 09:27:34 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH v2 0/2] Migrate the GPMI driver to use NAND core timings
Date: Fri, 19 Jan 2018 10:25:45 +0100
Message-Id: <20180119092547.26873-1-miquel.raynal@free-electrons.com>
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

The GPMI NAND controller driver has its own timings logic while the core
also has its own that should be preferred to avoid code duplication.
This series migrates the driver to use the ->setup_data_interface()
hook, preferred way to handle timings negotiation between controllers
and NAND chips.

This driver has stronger requirements in terms of respect of the ONFI
specification than the core has, and last time I post changes to this
section this was raised to me. Hence, the first patch effectively
applies the same requirements to the core. Doing this can slow down
several chips that do not follow entirely the specifications, but
another series is coming to add the possibility for NAND vendors to
flag certain features as "unsupported". See

    "mtd: nand: Check ONFI timings have been acked by the chip"

commit log for more details.

Thank you,
Miquèl


Changes since v1:
=================
  - Removed inline on non-static gpmi_enable/disable_clk() functions.
  - Rewording some lines of the patch.
  - Use tREA_max value provided by the core instead of a locally defined
    value.
  - Check ->conf in gpmi_setup_data_interface() instead of
    ->onfi_timing_mode_default (use tRC).
  - Removed useless copy of hw.timing_mode.
  - Moved gpmi_nfc_apply_timings() to ->select_chip().
  - Canceled the useless move of one structure.

One comment is not addressed here: using one register for TIMING0/1 and
CTRL1 that is only written in ->apply_timings(). This will be done in a
later patch that will update the way timings are derived.


Miquel Raynal (2):
  mtd: nand: Check ONFI timings have been acked by the chip
  mtd: nand: gpmi: Support ->setup_data_interface()

 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 275 +++++++++------------------------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  43 ++++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  82 +++++-----
 drivers/mtd/nand/nand_base.c           |  41 ++++-
 4 files changed, 183 insertions(+), 258 deletions(-)

-- 
2.11.0

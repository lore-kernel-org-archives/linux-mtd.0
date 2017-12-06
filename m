From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: GPMI nand driver cleanup
Date: Wed,  6 Dec 2017 10:19:15 +0100
Message-Id: <20171206091925.5810-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series contains several cleanup patches for the GPMI nand driver.
The code is unnecessarily complicated in several places. For example
the private driver data struct contains variables which should better
be passed around between functions to make the lifetime of these
variables clear. Also there are functions which take up to eight
arguements and are so trivial that they are shorter and easier to
read if open coded in the caller.

The series also contains the bugfix in 1/10 which I previously sent
separately.

The driver has more room for cleanups. The splitting up into gpmi-lib
and gpmi-nand seems rather unnecessary. The gpmi-lib functions call
back into gpmi-nand which contradicts the principle of a lib. Also
the functions in gpmi-lib all have a proper gpmi_ prefix, but the
functions exported from gpmi-nand.c do not have a prefix at all. In
several cases gpmi-nand.c only contains a wrapper around functions
in gpmi-lib.c. I tend to merge gpmi-nand.c and gpmi-lib.c into a
single file (which would be around 3.7k lines then). I think this
would make the driver a lot more readable, but of course also produces
some churn. Before doing this I want to ask for other opinions to avoid
putting the work to /dev/null later.

Sascha

----------------------------------------------------------------
Sascha Hauer (10):
      mtd: nand: gpmi: Fix failure when a erased page has a bitflip at BBM
      mtd: nand: gpmi: Utilize hardware to detect bitflips in erased blocks
      mtd: nand: gpmi: drop dma_ops_type
      mtd: nand: gpmi: pass buffer and len around
      mtd: nand: gpmi: put only once used functions inline
      mtd: nand: gpmi: remove direct_dma_map_ok from driver data struct
      mtd: nand: gpmi: return valid value from bch_set_geometry()
      mtd: nand: gpmi: remove unnecessary variables
      mtd: nand: gpmi: rework gpmi_ecc_write_page
      mtd: nand: gpmi: return error code from gpmi_ecc_write_page

 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  55 +++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 383 ++++++++-------------------------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  24 +--
 3 files changed, 128 insertions(+), 334 deletions(-)

Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bqFas-000289-WA
 for linux-mtd@lists.infradead.org; Sat, 01 Oct 2016 08:24:28 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH 0/2] mtd: nand: Enforce tCCS wait time after a column change
Date: Sat,  1 Oct 2016 10:24:01 +0200
Message-Id: <1475310243-32625-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Marc recently struggled with the RNDIN/RNDOUT commands when trying to
add support for the Tango NAND controller.
After some investigation it appeared that nothing in the
nand_command_lp() code waits tCCS, which is required to make sure the
NAND chip is ready to receive/send data on the bus after a column
change.

This series adds some more timings to the nand_sdr_timings struct
(including tCCS) and try to extract them from the ONFI parameter table
(if available).

It then adds a new flags to ask the core to enforce the tCCS
constraint.
As noted in the commit message, this is an opt-in flag to avoid perf
regressions on existing implementations (adding an ndelay() might be
useless if the controller IP or driver already takes care of that),
but it might appear that some implementations are actually broken and
needs this flag as well.

Regards,

Boris

Boris Brezillon (2):
  mtd: nand: Add a few more timings to nand_sdr_timings
  mtd: nand: Wait tCCS after a column change

 drivers/mtd/nand/nand_base.c    | 26 +++++++++++++++++++++++++-
 drivers/mtd/nand/nand_timings.c | 26 +++++++++++++++++++++++++-
 include/linux/mtd/nand.h        | 18 ++++++++++++++++++
 3 files changed, 68 insertions(+), 2 deletions(-)

-- 
2.7.4

Received: from mail1.bemta8.messagelabs.com ([216.82.243.206])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byenk-00046q-KF
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 12:56:31 +0000
To: linux-mtd <linux-mtd@lists.infradead.org>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH v6 0/4] Tango NAND Flash controller driver (and dependencies)
Message-ID: <580E0318.5020004@sigmadesigns.com>
Date: Mon, 24 Oct 2016 14:48:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series imports a driver for the Tango NAND Flash controller
and a few dependent patches, included for easy reference.

Boris Brezillon (2):
  mtd: nand: Add a few more timings to nand_sdr_timings
  mtd: nand: Wait tCCS after a column change

Marc Gonzalez (2):
  mtd: nand: Actually apply the optimal timings
  mtd: nand: tango: import driver for tango chips

 drivers/mtd/nand/Kconfig        |   6 +
 drivers/mtd/nand/Makefile       |   1 +
 drivers/mtd/nand/nand_base.c    |  28 +-
 drivers/mtd/nand/nand_timings.c |  26 +-
 drivers/mtd/nand/tango_nand.c   | 654 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h        |  18 ++
 6 files changed, 730 insertions(+), 3 deletions(-)
 create mode 100644 drivers/mtd/nand/tango_nand.c

Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dCibL-0004yY-Pl
 for linux-mtd@lists.infradead.org; Mon, 22 May 2017 08:22:05 +0000
Date: Mon, 22 May 2017 10:21:31 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Marek
 Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PULL] mtd: nand: Fixes for 4.12-rc3
Message-ID: <20170522102131.220657ad@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Here is a fixes PR for 4.12-rc3.

As usual, let me know if there's a problem and I'll update my PR.

Thanks,

Boris

The following changes since commit 08332893e37af6ae779367e78e444f8f9571511d:

  Linux 4.12-rc2 (2017-05-21 19:30:23 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/nand/fixes-for-4.12-rc3

for you to fetch changes up to d4ed3b9015b5eebc90d629579d9e7944607cbae5:

  mtd: nand: make nand_ooblayout_lp_hamming_ops static (2017-05-22 09:42:29 +0200)

----------------------------------------------------------------
This pull request contains several fixes to the core and the tango
driver.

tango fixes:
 * Add missing MODULE_DEVICE_TABLE() in tango_nand.c
 * Update the number of corrected bitflips

core fixes:
 * Fix a long standing memory leak in nand_scan_tail()
 * Fix several bugs introduced by the per-vendor init/detection
   infrastructure (introduced in 4.12)
 * Add a static specifier to nand_ooblayout_lp_hamming_ops definition

----------------------------------------------------------------
Andres Galacho (1):
      mtd: nand: tango: Export OF device ID table as module aliases

Brian Norris (4):
      mtd: nand: don't leak buffers when ->scan_bbt() fails
      mtd: nand: drop unneeded module.h include
      mtd: nand: free vendor-specific resources in init failure paths
      mtd: nand: samsung: warn about un-parseable ECC info

Colin Ian King (1):
      mtd: nand: make nand_ooblayout_lp_hamming_ops static

Marc Gonzalez (1):
      mtd: nand: tango: Update ecc_stats.corrected

 drivers/mtd/nand/nand_base.c    | 46 +++++++++++++++++++++++++++++++++++-----------
 drivers/mtd/nand/nand_ids.c     |  1 -
 drivers/mtd/nand/nand_samsung.c |  3 +++
 drivers/mtd/nand/tango_nand.c   | 23 ++++++++++++++++-------
 4 files changed, 54 insertions(+), 19 deletions(-)

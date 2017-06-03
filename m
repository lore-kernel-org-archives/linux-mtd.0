Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGxvm-0002wi-At
 for linux-mtd@lists.infradead.org; Sat, 03 Jun 2017 01:32:43 +0000
Received: by mail-pg0-x241.google.com with SMTP id v18so99713pgb.3
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jun 2017 18:32:20 -0700 (PDT)
Date: Fri, 2 Jun 2017 18:32:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [GIT PULL] MTD fixes for 4.12
Message-ID: <20170603013217.GA135402@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit 08332893e37af6ae779367e78e444f8f9571511d:

  Linux 4.12-rc2 (2017-05-21 19:30:23 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20170602

for you to fetch changes up to 05e97a9eda72d58dba293857df6aac62584ef99a:

  Merge tag 'nand/fixes-for-4.12-rc3' of git://git.infradead.org/linux-mtd into MTD (2017-06-01 10:53:55 -0700)

----------------------------------------------------------------
MTD fixes for 4.12:

NAND updates from Boris:
"""
tango fixes:
 * Add missing MODULE_DEVICE_TABLE() in tango_nand.c
 * Update the number of corrected bitflips

core fixes:
 * Fix a long standing memory leak in nand_scan_tail()
 * Fix several bugs introduced by the per-vendor init/detection
   infrastructure (introduced in 4.12)
 * Add a static specifier to nand_ooblayout_lp_hamming_ops definition
"""

----------------------------------------------------------------
Andres Galacho (1):
      mtd: nand: tango: Export OF device ID table as module aliases

Brian Norris (5):
      mtd: nand: don't leak buffers when ->scan_bbt() fails
      mtd: nand: drop unneeded module.h include
      mtd: nand: free vendor-specific resources in init failure paths
      mtd: nand: samsung: warn about un-parseable ECC info
      Merge tag 'nand/fixes-for-4.12-rc3' of git://git.infradead.org/linux-mtd into MTD

Colin Ian King (1):
      mtd: nand: make nand_ooblayout_lp_hamming_ops static

Marc Gonzalez (1):
      mtd: nand: tango: Update ecc_stats.corrected

 drivers/mtd/nand/nand_base.c    | 46 +++++++++++++++++++++++++++++++----------
 drivers/mtd/nand/nand_ids.c     |  1 -
 drivers/mtd/nand/nand_samsung.c |  3 +++
 drivers/mtd/nand/tango_nand.c   | 23 ++++++++++++++-------
 4 files changed, 54 insertions(+), 19 deletions(-)

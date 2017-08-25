Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dlNVt-0007ox-Nm
 for linux-mtd@lists.infradead.org; Fri, 25 Aug 2017 22:55:43 +0000
Received: by mail-pg0-x242.google.com with SMTP id t3so1528259pgt.5
 for <linux-mtd@lists.infradead.org>; Fri, 25 Aug 2017 15:55:21 -0700 (PDT)
Date: Fri, 25 Aug 2017 15:55:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [GIT PULL] MTD fixes for v4.13-rc7
Message-ID: <20170825225518.GA37579@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

Here are a few last fixes for this release.

FYI, Boris Brezillon will probably be handling MTD pull requests for the
next release. I've been a little less active recently, and it's probably
good to get some redundancy in the system anyway.

The following changes since commit 9a51544774a57fcb94994a61860a17f9e63a8d7b:

  mtd: blkdevs: Fix mtd block write failure (2017-08-12 14:53:24 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20170825

for you to fetch changes up to be3e83e3471cd0faff2c2d88fe9cfc73d9a9745a:

  mtd: nand: atmel: Relax tADL_min constraint (2017-08-24 20:59:50 -0700)

----------------------------------------------------------------
MTD fixes for 4.13-rc7

Two fixes - one for a 4.13 regression, and the other for an older one:

* Atmel NAND: since we started utilizing ONFI timings, we found that we
  were being too restrict at rejecting them, partly due to discrepancies
  in ONFI 4.0 and earlier versions. Relax the restriction to keep these
  platforms booting. This is a 4.13-rc1 regression.

* nandsim: repeated probe/removal may not work after a failed init,
  because we didn't free up our debugfs files properly on the failure
  path. This has been around since 3.8, but it's nice to get this fixed
  now in a nice easy patch that can target -stable, since there's
  already refactoring work (that also fixes the issue) targeted for the
  next merge window

----------------------------------------------------------------
Boris Brezillon (1):
      mtd: nand: atmel: Relax tADL_min constraint

Uwe Kleine-König (1):
      mtd: nandsim: remove debugfs entries in error path

 drivers/mtd/nand/atmel/nand-controller.c | 13 ++++++++++++-
 drivers/mtd/nand/nandsim.c               |  1 +
 2 files changed, 13 insertions(+), 1 deletion(-)

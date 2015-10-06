Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjW3A-0007JW-8v
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2015 17:29:17 +0000
Received: by wiclk2 with SMTP id lk2so169670758wic.1
 for <linux-mtd@lists.infradead.org>; Tue, 06 Oct 2015 10:28:54 -0700 (PDT)
Date: Tue, 6 Oct 2015 18:28:44 +0100
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [GIT PULL] MTD fixes for 4.3-rc
Message-ID: <20151006172844.GA5270@localhost>
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

These fixes have sat a bit longer than they should, but better late than
never.

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20151006

for you to fetch changes up to e5a5d92d9dc36055b971d79e408e345f5ce88701:

  mxc_nand: fix copy_spare (2015-09-27 17:09:35 -0700)

----------------------------------------------------------------
A few MTD fixes:

 * mxc_nand: a "refactoring only" change in 4.3-rc1 had some bad pointer
   (array) arithmetic. Fix that

 * sunxi_nand:

   - Fix an old list manipulation / memory management bug in the device
     release() code path

   - Correct a few mistakes in OOB write support

----------------------------------------------------------------
Boris BREZILLON (2):
      mtd: nand: sunxi: fix OOB handling in ->write_xxx() functions
      mtd: nand: sunxi: fix sunxi_nand_chips_cleanup()

Eric Benard (1):
      mxc_nand: fix copy_spare

 drivers/mtd/nand/mxc_nand.c   |    2 +-
 drivers/mtd/nand/sunxi_nand.c |   27 ++++++++++-----------------
 2 files changed, 11 insertions(+), 18 deletions(-)

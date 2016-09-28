Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpKl7-0006HM-JM
 for linux-mtd@lists.infradead.org; Wed, 28 Sep 2016 19:43:14 +0000
Received: by mail-pf0-x241.google.com with SMTP id q2so2517069pfj.0
 for <linux-mtd@lists.infradead.org>; Wed, 28 Sep 2016 12:42:53 -0700 (PDT)
Date: Wed, 28 Sep 2016 12:42:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] Late MTD fixes for v4.8
Message-ID: <20160928194249.GA145475@google.com>
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

My apologies for sending this so late. I've been fairly absent as a
maintainer this cycle, but I did queue these up weeks ago. In the
meantime, Richard was able to handle some other fixes (thanks!) but
didn't pick these up.

On the bright side, these are very simple changes that should carry
little risk. Please let me know if you have any concerns.

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20160928

for you to fetch changes up to f6d7c1b5598b6407c3f1da795dd54acf99c1990c:

  mtd: nand: davinci: Reinitialize the HW ECC engine in 4bit hwctl (2016-09-09 19:39:33 -0700)

----------------------------------------------------------------
Another round of MTD fixes for v4.8

Davinci NAND: fix a long-standing bug in how we clear/prep 4-bit ECC

OMAP NAND: an error-handling fix that made it into v4.8-rc1 caused
error-handling cases in other configurations/code-paths; this fixes the fix

----------------------------------------------------------------
Karl Beldan (1):
      mtd: nand: davinci: Reinitialize the HW ECC engine in 4bit hwctl

Roger Quadros (1):
      mtd: nand: omap2: Don't call dma_release_channel() if dma_request_chan() failed

 drivers/mtd/nand/davinci_nand.c | 3 +++
 drivers/mtd/nand/omap2.c        | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

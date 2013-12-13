Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrNQm-0007MY-8s
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 07:45:05 +0000
Received: by mail-pb0-f41.google.com with SMTP id jt11so2100478pbb.14
 for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2013 23:44:39 -0800 (PST)
Date: Thu, 12 Dec 2013 23:44:28 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] MTD fixes for 3.13-rc
Message-ID: <20131213074428.GA24650@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

Here are two MTD fixes for the pxa3xx-nand driver.

Brian

The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:

  Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20131212

for you to fetch changes up to 15b540c71cac840f0a3e8b1b4b7a773deb847ffb:

  mtd: nand: pxa3xx: Use info->use_dma to release DMA resources (2013-12-12 15:02:04 -0800)

----------------------------------------------------------------
Two MTD fixes, for the pxa3xx-nand driver:

 - This driver was not ready to fully support Armada 370 NAND, with
   particularly notable problems seen on flash with 2KB page sizes. This
   "compatible" entry really should have been held back until 3.14 or
   later.

 - Fix a bug seen in rare cases on the error path of a failed probe attempt,
   where we free unallocated DMA resources

----------------------------------------------------------------
Ezequiel Garcia (2):
      Partially revert "mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible string"
      mtd: nand: pxa3xx: Use info->use_dma to release DMA resources

 drivers/mtd/nand/pxa3xx_nand.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

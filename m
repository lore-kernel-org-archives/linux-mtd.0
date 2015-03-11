Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVUUv-0000Ah-7c
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 00:27:41 +0000
Received: by pdjp10 with SMTP id p10so6348100pdj.10
 for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2015 17:27:19 -0700 (PDT)
Date: Tue, 10 Mar 2015 17:27:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] MTD fixes for 4.0
Message-ID: <20150311002707.GF4124@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20150310

for you to fetch changes up to 5e0899db69e27abfdc1c6223ca74f479acdedaa6:

  mtd: nand: MTD_NAND_HISI504 should depend on HAS_DMA (2015-03-02 22:55:56 -0800)

----------------------------------------------------------------
MTD fixes for 4.0

 * pxa3xx_nand
   - fix timeout issues when draining the FIFO (BCH only)
   - don't crash when no chip-selects are used
 * hisi504_nand
   - depend on HAS_DMA, to fix compile errors

----------------------------------------------------------------
Geert Uytterhoeven (1):
      mtd: nand: MTD_NAND_HISI504 should depend on HAS_DMA

Maxime Ripard (1):
      mtd: nand: pxa3xx: Fix PIO FIFO draining

Robert Jarzmik (1):
      mtd: pxa3xx_nand: fix driver when num_cs is 0

 drivers/mtd/nand/Kconfig       |  1 +
 drivers/mtd/nand/pxa3xx_nand.c | 50 +++++++++++++++++++++++++++++++++++++-----
 2 files changed, 45 insertions(+), 6 deletions(-)

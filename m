Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzyQ4-00076s-OG
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 03:00:57 +0000
Received: by padhx2 with SMTP id hx2so134118766pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 19:00:35 -0800 (PST)
Date: Fri, 20 Nov 2015 19:00:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] MTD updates for 4.4-rc2
Message-ID: <20151121030026.GA28964@localhost>
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

The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20151120

for you to fetch changes up to 1ddaa021b000220b5f2ad023e4f15ed44990974b:

  MAINTAINERS: brcmnand: Add co-maintainer for Broadcom SoCs (2015-11-18 13:16:58 -0800)

----------------------------------------------------------------
MTD fixes for 4.4-rc2:

 * MAINTAINERS updates for brcmnand driver

 * Fix reboot hangs seen when multiple NAND flash chips are registered with the
   same controller

 * Fix build issues on jz4740 NAND driver; the error was introduced in 4.3, so
   I guess nobody really cared, but we might as well fix it

----------------------------------------------------------------
Brian Norris (2):
      mtd: jz4740_nand: fix build on jz4740 after removing gpio.h
      mtd: nand: fix shutdown/reboot for multi-chip systems

Florian Fainelli (1):
      MAINTAINERS: brcmnand: Add Broadcom internal mailing-list

Kamal Dasu (1):
      MAINTAINERS: brcmnand: Add co-maintainer for Broadcom SoCs

 MAINTAINERS                    |    2 ++
 drivers/mtd/nand/jz4740_nand.c |    1 +
 drivers/mtd/nand/nand_base.c   |    2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

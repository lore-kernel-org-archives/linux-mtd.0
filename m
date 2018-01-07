Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eY7N1-00004s-EH
 for linux-mtd@lists.infradead.org; Sun, 07 Jan 2018 09:36:01 +0000
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr
Subject: [GIT PULL] final MTD fixes for v4.15
Date: Sun, 07 Jan 2018 10:36:18 +0100
Message-ID: <5737666.9mBnCfRmi7@blindfold>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

The following changes since commit 30a7acd573899fd8b8ac39236eff6468b195ac7d:

  Linux 4.15-rc6 (2017-12-31 14:47:43 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20180107

for you to fetch changes up to fee4380f368e84ed216b62ccd2fbc4126f2bf40b:

  mtd: nand: pxa3xx: Fix READOOB implementation (2018-01-06 23:06:58 +0100)

----------------------------------------------------------------
This pull request contains a single fix for the pxa3xx NAND driver.

----------------------------------------------------------------
Boris Brezillon (1):
      mtd: nand: pxa3xx: Fix READOOB implementation

 drivers/mtd/nand/pxa3xx_nand.c | 1 +
 1 file changed, 1 insertion(+)

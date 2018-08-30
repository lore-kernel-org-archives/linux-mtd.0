Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fvOIV-0004ew-Bh
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2018 14:51:49 +0000
Date: Thu, 30 Aug 2018 16:51:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Marek
 Vasut <marex@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] mtd: Fixes for 4.19-rc2
Message-ID: <20180830165103.66eaa2ef@bbrezillon>
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

Hello Linus,

Here is the MTD fixes PR for 4.19-rc2.

Regards,

Boris

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/for-4.19-rc2

for you to fetch changes up to 336d139f8718b1336c9d22f0e462611ae1229850:

  mtd: rawnand: denali: do not pass zero maxchips to nand_scan() (2018-08-27 20:41:46 +0200)

----------------------------------------------------------------
Raw NAND fixes:
- denali: Fix a regression caused by the nand_scan() rework
- docg4: Fix a build error when gcc decides to not iniline some
  functions (can be reproduced with gcc 4.1.2)

----------------------------------------------------------------
Geert Uytterhoeven (1):
      mtd: rawnand: docg4: Remove wrong __init annotations

Masahiro Yamada (1):
      mtd: rawnand: denali: do not pass zero maxchips to nand_scan()

 drivers/mtd/nand/raw/denali.c | 5 +++++
 drivers/mtd/nand/raw/docg4.c  | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1bSO-0001Ny-Gw
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2018 17:35:26 +0000
Date: Thu, 29 Mar 2018 19:35:01 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Richard
 Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] mtd: Fixes for 4.16
Message-ID: <20180329193501.223f22f9@bbrezillon>
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

Here is my last fixes PR for this release. It contains 2 fixes, one in
the atmel NAND driver and another one in the CFI/JEDEC code.

Regards,

Boris

The following changes since commit 3eb2ce825ea1ad89d20f7a3b5780df850e4be274:

  Linux 4.16-rc7 (2018-03-25 12:44:30 -1000)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.16

for you to fetch changes up to 87a73eb5b56fd6e07c8e499fe8608ef2d8912b82:

  mtd: jedec_probe: Fix crash in jedec_read_mfr() (2018-03-29 19:29:06 +0200)

----------------------------------------------------------------
* Fix a bug in Atmel ECC engine driver
* Fix a bug in the CFI/JEDEC driver

----------------------------------------------------------------
Boris Brezillon (1):
      mtd: nand: atmel: Fix get_sectorsize() function

Linus Walleij (1):
      mtd: jedec_probe: Fix crash in jedec_read_mfr()

 drivers/mtd/chips/jedec_probe.c | 2 ++
 drivers/mtd/nand/atmel/pmecc.c  | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

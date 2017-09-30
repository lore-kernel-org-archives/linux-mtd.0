Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dyLxF-0000Mu-JZ
 for linux-mtd@lists.infradead.org; Sat, 30 Sep 2017 17:53:35 +0000
Date: Sat, 30 Sep 2017 19:53:08 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] mtd: Fixes for 4.14-rc3
Message-ID: <20170930195308.608737c2@bbrezillon>
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

I'm a bit late, but here is a fixes PR for 4.14-rc3.

Regards,

Boris

The following changes since commit 73600b619bf8b9803a0610624a0e11f5ed8f761e:

  mtd: nand: remove unused blockmask variable (2017-09-18 14:51:02 +0200)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.14-rc3

for you to fetch changes up to 36de80740008e6a4a55115b4a92e2059e47c1cba:

  mtd: nand: atmel: fix buffer overflow in atmel_pmecc_user (2017-09-27 17:33:28 +0200)

----------------------------------------------------------------
* Fix partition alignment check in mtdcore.c
* Fix a buffer overflow in the Atmel NAND driver

----------------------------------------------------------------
Boris Brezillon (1):
      mtd: Fix partition alignment check on multi-erasesize devices

Richard Genoud (1):
      mtd: nand: atmel: fix buffer overflow in atmel_pmecc_user

 drivers/mtd/mtdpart.c          | 8 ++++++++
 drivers/mtd/nand/atmel/pmecc.c | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezNSr-0007G5-98
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 14:14:48 +0000
Date: Fri, 23 Mar 2018 15:14:27 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Marek
 Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jagdish Gediya <jagdish.gediya@nxp.com>,
 OuYang ZhiZhong <ouyzz@yealink.com>
Subject: [GIT PULL] mtd: fixes for 4.16-rc7
Message-ID: <20180323151427.31229231@bbrezillon>
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

Here is a fixes PR for 4.16-rc7.

Regards,

Boris

The following changes since commit c698ca5278934c0ae32297a8725ced2e27585d7f:

  Linux 4.16-rc6 (2018-03-18 17:48:42 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.16-rc7

for you to fetch changes up to 6b00c35138b404be98b85f4a703be594cbed501c:

  mtd: nand: fsl_ifc: Read ECCSTAT0 and ECCSTAT1 registers for IFC 2.0 (2018-03-21 10:22:28 +0100)

----------------------------------------------------------------
* Fix several problems in the fsl_ifc NAND controller driver
* Fix misuse of mtd_ooblayout_ecc() in mtdchar.c

----------------------------------------------------------------
Jagdish Gediya (3):
      mtd: nand: fsl_ifc: Fix nand waitfunc return value
      mtd: nand: fsl_ifc: Fix eccstat array overflow for IFC ver >= 2.0.0
      mtd: nand: fsl_ifc: Read ECCSTAT0 and ECCSTAT1 registers for IFC 2.0

OuYang ZhiZhong (1):
      mtdchar: fix usage of mtd_ooblayout_ecc()

 drivers/mtd/mtdchar.c           |  4 ++--
 drivers/mtd/nand/fsl_ifc_nand.c | 32 +++++++++++++-------------------
 include/linux/fsl_ifc.h         |  6 +-----
 3 files changed, 16 insertions(+), 26 deletions(-)


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

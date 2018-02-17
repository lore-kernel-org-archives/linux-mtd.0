Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1emylV-0004SQ-H4
 for linux-mtd@lists.infradead.org; Sat, 17 Feb 2018 09:26:43 +0000
Date: Sat, 17 Feb 2018 10:26:28 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Richard
 Weinberger <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] mtd: fixes for 4.16-rc2
Message-ID: <20180217102628.28639355@bbrezillon>
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

Here is a small fixes PR for 4.16-rc2.

Regards,

Boris

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.16-rc2

for you to fetch changes up to f23def8038611fa362de345c540107c78edaa085:

  mtd: nand: MTD_NAND_MARVELL should depend on HAS_DMA (2018-02-12 10:57:20 +0100)

----------------------------------------------------------------
* Add missing dependency to NAND_MARVELL Kconfig entry
* Use the appropriate OOB layout in the VF610 driver

----------------------------------------------------------------
Geert Uytterhoeven (1):
      mtd: nand: MTD_NAND_MARVELL should depend on HAS_DMA

Stefan Agner (1):
      mtd: nand: vf610: set correct ooblayout

 drivers/mtd/nand/Kconfig     | 2 +-
 drivers/mtd/nand/vf610_nfc.c | 6 ++----

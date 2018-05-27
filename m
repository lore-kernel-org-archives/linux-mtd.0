Received: from mail1.bemta8.messagelabs.com ([216.82.243.206])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fN56H-0007j8-1c
 for linux-mtd@lists.infradead.org; Sun, 27 May 2018 23:29:23 +0000
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: [PATCH v7 0/5] mtd: cfi_cmdset_0002: Change write and erase functions
Date: Mon, 28 May 2018 08:27:56 +0900
Message-Id: <20180527232801.1666-1-ikegami@allied-telesis.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The changes are to make sure to check the operation status.
Actually the flash write and erase error behavior is caused on our products.
The flash is Macronix flash device MX29GL512FHT2I-11G used by our products.
The patch series was separated for changes of flash write and erase.
Since those were not depended each other at the time.
But by additional changes the changes are related more as same way currently.
So combine patch series for the flash write and erase changes as v6.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org

Tokunori Ikegami (5):
  mtd: cfi_cmdset_0002: Change write buffer to check correct value
  mtd: cfi_cmdset_0002: Change definition naming to retry write
    operation
  mtd: cfi_cmdset_0002: Change erase functions to retry for error
  mtd: cfi_cmdset_0002: Change erase functions to check chip good only
  mtd: cfi_cmdset_0002: Change erase one block to enable XIP once

 drivers/mtd/chips/cfi_cmdset_0002.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

-- 
2.16.1

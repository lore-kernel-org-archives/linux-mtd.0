Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqMsV-0006rF-C1
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 12:57:31 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH for v3.13 0/2] pxa3xx-nand fixes for v3.13
Date: Tue, 10 Dec 2013 09:57:14 -0300
Message-Id: <1386680236-21698-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Two almost-oneline fixes intended for v3.13.

The first commit fixes a current problem that can be reproduced
on PXA boards, when use_dma = 1 and after a device fails to be detected.
The driver currently tries to release DMA resources that are not allocated.

The second commit fixes a problem that can be triggered on PXA boards
by writing a blank page (0xff).
The bug itself was found by Arnaud Ebalard while testing 2048B page size
support on the Armada 370/XP variant, yet the bug can be reproduced on the
driver's PXA variant.

Ezequiel Garcia (2):
  mtd: nand: pxa3xx: Use info->use_dma to release DMA resources
  mtd: nand: pxa3xx: Clear need_wait flag when starting a command

 drivers/mtd/nand/pxa3xx_nand.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.8.1.5

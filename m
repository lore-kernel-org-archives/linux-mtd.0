Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtOuj-0004dQ-6O
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 21:44:21 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH RESEND 0/3] pxa3xx-nand: Support 2 KiB page size devices
Date: Wed, 18 Dec 2013 18:44:07 -0300
Message-Id: <1387403050-23965-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
 Seif Mazareeb <seif@marvell.com>, Simon Guinot <sguinot@lacie.com>,
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

PATCH 1 fixes a problem that can be triggered by writing a blank
page (0xff). The bug itself was found by Arnaud Ebalard while testing 2048B
page size support on the Armada 370/XP variant, yet the bug can be reproduced
on the driver's PXA variant.

The other two patches enable the support for 2048B pages on the Armada 370/XP
variant.

PATCH 2 reduces the I/O overhead on flash devices that won't need the extended
command semantics, by changing the way the cmdfunc() variants are used. The
decision of which cmdfunc() should be used is now made based on the page size
and not on thec ontroller variant.

PATCH 3, consolidates the ECC initialization -mostly to avoid code duplication-
since the A370/XP variant can also support smaller pages, with no-BCH
requirements.

I think the driver looks slightly cleaner after this work, but feel free to
provide any feedback or advise differently.

Thanks,

Ezequiel Garcia (3):
  mtd: nand: pxa3xx: Clear need_wait flag when starting a command
  mtd: nand: pxa3xx: Use extended cmdfunc() only if needed
  mtd: nand: pxa3xx: Consolidate ECC initialization

 drivers/mtd/nand/pxa3xx_nand.c | 72 ++++++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 34 deletions(-)

-- 
1.8.1.5

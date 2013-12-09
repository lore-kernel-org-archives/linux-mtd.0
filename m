Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VpxwR-0001eW-1q
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 10:19:55 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] pxa3xx-nand: A370/XP support for 2048B page size
Date: Mon,  9 Dec 2013 07:19:42 -0300
Message-Id: <1386584384-6379-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
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

In order to support 2048B pages on the Armada 370/XP variant, some changes
are needed.

To reduce the overhead on devices that won't need the controller extended
command semantics, the first patch changes the way the cmdfunc() variants
are used. The decision of which cmdfunc() should be used is now made based
on the page size and not on the device variant.

Then, the ECC initialization is consolidated (mostly to avoid code
duplication) since the A370/XP variant can support smaller pages, with
no-BCH requirements.

This is v3.14 material.

Ezequiel Garcia (2):
  mtd: nand: pxa3xx: Use extended cmdfunc() only if needed
  mtd: nand: pxa3xx: Consolidate ECC initialization

 drivers/mtd/nand/pxa3xx_nand.c | 71 ++++++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 34 deletions(-)

-- 
1.8.1.5

Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am6di-0000GV-EJ
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 21:29:59 +0000
Received: by mail-qg0-x22c.google.com with SMTP id f52so10720762qga.3
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 14:29:37 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 0/2] nand: Remove BUG abuse
Date: Fri,  1 Apr 2016 18:29:22 -0300
Message-Id: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

While using nandsim to debug an issue with an UBI image,
I hit a BUG() when passing some crazy ID values to nandsim.

I've always felt that nand_base.c is sort of abusing the 
BUG() macro, so decided to fix it.

There are other BUG() uses, but they aren't in the nand_scan
path, so I'm not touching them.

Patches apply cleanly on v4.6-rc1.

Ezequiel Garcia (2):
  mtd: nand: Drop mtd.owner requirement in nand_scan
  mtd: nand: Remove BUG() abuse in nand_scan_tail

 drivers/mtd/nand/nand_base.c | 62 ++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 28 deletions(-)

-- 
2.7.0

Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJ4Wy-0005Kx-SB
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2014 17:13:57 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] pxa3xx-nand: Minor cleanup
Date: Thu, 27 Feb 2014 14:13:24 -0300
Message-Id: <1393521206-4623-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Two very small cleanups.

Ezequiel Garcia (2):
  mtd: nand: pxa3xx: Remove unused macro
  mtd: nand: pxa3xx: Print actual ECC strength in error message

 drivers/mtd/nand/pxa3xx_nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
1.8.1.5

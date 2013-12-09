Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vpxnf-0001Si-Cd
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 10:10:51 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/1] Small fix for pxa3xx-nand waitfunc's
Date: Mon,  9 Dec 2013 07:10:25 -0300
Message-Id: <1386583826-6294-1-git-send-email-ezequiel.garcia@free-electrons.com>
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

Hello,

This commit is a small fix which I'd like to get applied on v3.13.
It fixes a current problem that can be triggered on PXA boards with
2048B page size devices, by writing a blank page (0xff).

The bug itself was found by Arnaud Ebalard while testing 2048B page size
support on the Armada 370/XP variant, yet the bug is current reproducible
on the driver's PXA variant as well.

See the commit message in the patch for more details.

Big thanks to Arnaud for spotting this bug and for helping me debug it!

Ezequiel Garcia (1):
  mtd: nand: pxa3xx: Clear need_wait flag when starting a command

 drivers/mtd/nand/pxa3xx_nand.c | 1 +
 1 file changed, 1 insertion(+)

-- 
1.8.1.5

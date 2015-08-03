Received: from mail-qk0-f172.google.com ([209.85.220.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMGq8-0002z0-GE
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 14:35:45 +0000
Received: by qkbm65 with SMTP id m65so51304036qkb.2
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2015 07:35:20 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: antoine.tenart@free-electrons.com, robert.jarzmik@free.fr,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 0/2] nand: pxa3xx: A couple device identification fixes
Date: Mon,  3 Aug 2015 11:31:24 -0300
Message-Id: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

A couple fixes. The first one to increase the size of the READ_ID
buffer, which is required to read 'ONFI' and 'JEDEC'.
The second one, to allow to read the ONFI and JEDEC PARAM pages.

This is tested on:
 * Armada XP GP board (w/ONFI device)
 * PXA3xx CM-X300 board (non-ONFI/JEDEC device)

Can't test on any JEDEC device, but at least I can't see any regressions.

Ezequiel Garcia (2):
  nand: pxa3xx: Increase READ_ID buffer and make the size static
  nand: pxa3xx: Increase initial buffer size

 drivers/mtd/nand/pxa3xx_nand.c | 43 +++++++++++++++---------------------------
 1 file changed, 15 insertions(+), 28 deletions(-)

-- 
2.4.6

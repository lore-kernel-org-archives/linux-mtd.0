Received: from mail-yh0-f44.google.com ([209.85.213.44])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WelOt-0003Z7-MV
 for linux-mtd@lists.infradead.org; Mon, 28 Apr 2014 13:15:16 +0000
Received: by mail-yh0-f44.google.com with SMTP id z6so1356612yhz.31
 for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2014 06:14:50 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/3] nandtest: Allow multiple read & check iterations
Date: Mon, 28 Apr 2014 10:14:16 -0300
Message-Id: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset extends the nandtest to allow multiple read & check iterations.
Repeating the read-and-check multiple times, stresses driver's ECC engine and
has been useful to discover poor stability in an old (not mainline) OMAP2 NAND
driver.

The first two patches are just cosmetic, and the real work is done in the last
patch.

The new 'reads' parameters, allows to simulate a more realistic workload:

  1. erase block
  2. write data
  3. read and check (N times)

Ezequiel Garcia (3):
  nandtest: Remove redundant check
  nandtest: Move the "read and compare" code to a function
  nandtest: Introduce multiple reads & check iterations

 nandtest.c | 108 ++++++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 64 insertions(+), 44 deletions(-)

-- 
1.9.1

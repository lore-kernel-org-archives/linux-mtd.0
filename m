Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Th4CX-0000dj-2e
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2012 20:07:14 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] mtd: nand/docg4: set of fixes and enhancements
Date: Fri,  7 Dec 2012 12:07:20 -0800
Message-Id: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, this is a short set of minor fixes and enhancements to the docg4, tested on
my Palm Treo 680.

Mike Dunn (3):
  mtd: nand/docg4: add support for writing in reliable mode
  mtd: nand/docg4: reserve bb marker area in ecclayout
  mtd: nand/docg4: fix and improve read of factory bbt

 drivers/mtd/nand/docg4.c |   73 ++++++++++++++++++++++++++++++++++++++++------
 1 files changed, 64 insertions(+), 9 deletions(-)

-- 
1.7.8.6

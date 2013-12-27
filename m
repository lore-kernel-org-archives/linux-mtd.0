Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwQFr-0003NE-Ml
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 05:46:40 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 0/5] mtd: nand: support the JEDEC compliant nand.
Date: Fri, 27 Dec 2013 13:14:41 +0800
Message-ID: <1388121286-32620-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some vendors support the JEDEC standard only, such as Toshiba.
We can get all the information for the JEDEC parameter page, just like
we did with the ONFI parameter page.

This patch set adds the support for the JEDEC compliant nand chips.

You can download the JEDEC standard about the NAND in the:
    www.jedec.org

My code references to the JESD230A, August 2013, revision 1.

Tested with Toshiba TH58TEG7DDKTA20(16K + 1280).
(Unfortuately, this ECC info of its JEDEC parameter page is zero,
 i hope toshiba can fix it in future.)

This patch set depends on another patch set :
  http://lists.infradead.org/pipermail/linux-mtd/2013-December/051174.html

Huang Shijie (5):
  mtd: nand: add the data structures for JEDEC parameter page
  mtd: nand: add fields for JEDEC in nand_chip
  mtd: nand: add a helper to get the supported features for JEDEC
  mtd: nand: parse out the JEDEC compliant nand
  mtd: nand: print out the right information for JEDEC compliant nand

 drivers/mtd/nand/nand_base.c |   96 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/nand.h     |   90 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 183 insertions(+), 3 deletions(-)

-- 
1.7.2.rc3

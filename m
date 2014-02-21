Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGjWT-0007vm-2U
 for linux-mtd@lists.infradead.org; Fri, 21 Feb 2014 06:23:46 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 0/5] mtd: nand: support the JEDEC compliant nand.
Date: Fri, 21 Feb 2014 13:39:36 +0800
Message-ID: <1392961181-20693-1-git-send-email-b32955@freescale.com>
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
 TOSHIBA FAE confirmed that they will fix it in future.)

v2 --> v3:
	[1] add more comment for the new fields.
	[2] follow Brian's suggestions to change the parsing code.

v1 --> v2:
	[1] use the read_byte to replace the read_buf.


Huang Shijie (5):
  mtd: nand: add the data structures for JEDEC parameter page
  mtd: nand: add fields for JEDEC in nand_chip
  mtd: nand: add a helper to get the supported features for JEDEC
  mtd: nand: parse out the JEDEC compliant nand
  mtd: nand: print out the right information for JEDEC compliant nand

 drivers/mtd/nand/nand_base.c |   98 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/nand.h     |   96 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 190 insertions(+), 4 deletions(-)

-- 
1.7.2.rc3

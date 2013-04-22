Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUBeH-0000HX-Do
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 07:58:54 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 0/8] mtd: add datasheet's ECC information to nand_chip{}
Date: Mon, 22 Apr 2013 15:47:50 +0800
Message-ID: <1366616878-29481-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

1.) Why add the ECC information to the nand_chip{} ?
   Each nand chip has its requirement for the ECC correctability, such as
   "4bit ECC for each 512Byte" or "40bit ECC for each 1024Byte".
   This ECC info is very important to the nand controller, such as gpmi.

   Take the Micron MT29F64G08CBABA for example, its geometry is
   8k page size, 744 bytes oob size and it requires 40bit ECC per 1K bytes.
   If we do not provide the ECC info to the gpmi nand driver, it has to
   calculate the ECC correctability itself. The gpmi driver will gets the 56bit
   ECC for per 1K bytes which is beyond its BCH's 40bit ecc capibility.
   The gpmi will quits in this case. But in actually, the gpmi can supports
   this nand chip if it can get the right ECC info.

2.) About the patch set:
   2.1) patch 1 ~ patch 4:
	       Parse out the ecc info from the extended parameter page for
	       ONFI nand.
	       
   2.2) patch 5 ~ patch 7:
               Add the ECC info for full-id nand.

   2.3) patch 8
               The gpmi uses the ecc info to set the BCH module. and with this
	       patch set, the gpmi can supports the MT29F64G08CBABA now.


v1 --> v2:
	[0] Since the first 3 patches are accepted, I do not send them in the
	    version 2.
	[1] add NAND_ prefix for macros used by the full-id nands.
	[2] add nand_ prefix for the extend parameter page data structures.
	[3] rename the onfi_get_feature() to onfi_feature().
	[4] I re-test this patch set again.

Huang Shijie (8):
  mtd: add data structures for Extended Parameter Page
  mtd: add a helper to get the supported features for ONFI nand
  mtd: get the ECC info from the Extended Parameter Page
  mtd: replace the hardcode with the onfi_get_feature()
  mtd: add a new field for ecc info in the nand_flash_dev{}
  mtd: parse out the ECC info for the full-id nand chips
  mtd: add the ecc info for some full-id nand chips
  mtd: gpmi: set the BCH's geometry with the ecc info

 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  128 +++++++++++++++++++++++++++++++-
 drivers/mtd/nand/nand_base.c           |   62 +++++++++++++++-
 drivers/mtd/nand/nand_ids.c            |    8 +-
 include/linux/mtd/nand.h               |   62 +++++++++++++++-
 4 files changed, 251 insertions(+), 9 deletions(-)

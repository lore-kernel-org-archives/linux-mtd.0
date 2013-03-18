Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHY90-0008IS-R5
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 11:22:24 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 00/11] mtd: add datasheet's ECC information to nand_chip{}
Date: Mon, 18 Mar 2013 19:18:43 +0800
Message-ID: <1363605534-24776-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, matthieu.castet@parrot.com, dedekind1@gmail.com
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
   2.1) patch 0:
               Tell the reason why add the ecc info to nand_chip{}

   2.2) patch 1 ~ patch 6:
	       Parse out the ecc info for ONFI nand. If we can not get the ecc
	       info directly for the parameter page, we can try to get it from
	       the extended page.

   2.3) patch 7 ~ patch 9:
               Add the ECC info for full-id nand.

   2.4) patch 10:
               The gpmi uses the ecc info to set the BCH module. and with this
	       patch set, the gpmi can supports the MT29F64G08CBABA now.


Huang Shijie (11):
  mtd: add datasheet's ECC information to nand_chip{}
  mtd: increase max OOB size to 744
  mtd: get the ECC info from the parameter page for ONFI nand
  mtd: add data structures for Extended Parameter Page
  mtd: add a helper to get the supported features for ONFI nand
  mtd: get the ECC info from the Extended Parameter Page
  mtd: replace the hardcode with the onfi_get_feature()
  mtd: add a new field for ecc info in the nand_flash_dev{}
  mtd: parse out the ECC info for the full-id nand chips
  mtd: add the ecc info for some full-id nand chips
  mtd: gpmi: set the BCH's geometry with the ecc info

 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  128 +++++++++++++++++++++++++++++++-
 drivers/mtd/nand/nand_base.c           |   67 ++++++++++++++++-
 drivers/mtd/nand/nand_ids.c            |    8 +-
 include/linux/mtd/nand.h               |   69 +++++++++++++++++-
 4 files changed, 262 insertions(+), 10 deletions(-)

Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUZAv-0003Uy-GW
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 09:06:10 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V3 0/9] mtd: add datasheet's ECC information to nand_chip{}
Date: Tue, 23 Apr 2013 16:54:48 +0800
Message-ID: <1366707297-31309-1-git-send-email-b32955@freescale.com>
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
   2.1) patch 1:
   		This patch adds some comment for the two fields which can be
		treated as the initial semantics.

   2.2) patch 2 ~ patch 5:
	       Parse out the ecc info from the extended parameter page for
	       ONFI nand.
	       
   2.2) patch 6 ~ patch 8:
               Add the ECC info for full-id nand.

   2.3) patch 9
               The gpmi uses the ecc info to set the BCH module. and with this
	       patch set, the gpmi can supports the MT29F64G08CBABA now.


v2 --> v3:
	[0] add a new patch to define the semantics of the two fields.
	[1] Use the Change Read Column command to remove the "last" argument.
	[2] simplify the onfi_feature().
	[3] Use kmalloc() to replace kcalloc().
	[4] others.

v1 --> v2:
	[0] Since the first 3 patches are accepted, I do not send them in the
	    version 2.
	[1] add NAND_ prefix for macros used by the full-id nands.
	[2] add onfi_ prefix for the extend parameter page data structures.
	[3] rename the onfi_get_feature() to onfi_feature().
	[4] I re-test this patch set again.

Huang Shijie (9):
  mtd: add more comment for ecc_strength/ecc_size
  mtd: add data structures for Extended Parameter Page
  mtd: add a helper to get the supported features for ONFI nand
  mtd: get the ECC info from the Extended Parameter Page
  mtd: replace the hardcode with the onfi_feature()
  mtd: add a new field for ecc info in the nand_flash_dev{}
  mtd: parse out the ECC info for the full-id nand chips
  mtd: add the ecc info for some full-id nand chips
  mtd: gpmi: set the BCH's geometry with the ecc info

 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  128 +++++++++++++++++++++++++++++++-
 drivers/mtd/nand/nand_base.c           |   80 +++++++++++++++++++-
 drivers/mtd/nand/nand_ids.c            |    8 +-
 include/linux/mtd/nand.h               |   63 +++++++++++++++-
 4 files changed, 269 insertions(+), 10 deletions(-)

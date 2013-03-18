Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHY97-0008O0-C4
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 11:22:31 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 01/11] mtd: add datasheet's ECC information to nand_chip{}
Date: Mon, 18 Mar 2013 19:18:44 +0800
Message-ID: <1363605534-24776-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1363605534-24776-1-git-send-email-b32955@freescale.com>
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>
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

2.) about the new fields.
   The @ecc_strength stands for the ecc bits needed within the @ecc_size.
   Both of the new fields should be set which conform to the datasheet.

   For example:
	"4bit ECC for each 512Byte" could be:
		@ecc_strength = 4, @ecc_size = 512.
	"40bit ECC for each 1024Byte" could be:
		@ecc_strength = 40, @ecc_size = 1024.

3.) Why do not re-use the @strength and @size in the nand_ecc_ctrl{}?
   The @strength and @size in nand_ecc_ctrl{} is used by the nand controller
   driver, while the @ecc_strength and @ecc_size are get from the datasheet.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 4b87815..65b0e8b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -425,6 +425,9 @@ struct nand_buffers {
  *			bad block marker position; i.e., BBM == 11110111b is
  *			not bad when badblockbits == 7
  * @cellinfo:		[INTERN] MLC/multichip data from chip ident
+ * @ecc_strength:	[INTERN] ECC correctability from the datasheet.
+ * @ecc_size:		[INTERN] ECC size required by the @ecc_strength,
+ *                      also from the datasheet.
  * @numchips:		[INTERN] number of physical chips
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
  * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
@@ -502,6 +505,8 @@ struct nand_chip {
 	unsigned int pagebuf_bitflips;
 	int subpagesize;
 	uint8_t cellinfo;
+	uint16_t ecc_strength;
+	uint16_t ecc_size;
 	int badblockpos;
 	int badblockbits;
 
-- 
1.7.1

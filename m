Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UdBR7-0005wc-4h
 for linux-mtd@lists.infradead.org; Fri, 17 May 2013 03:34:32 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v6 01/10] mtd: add datasheet's ECC information to nand_chip{}
Date: Fri, 17 May 2013 11:17:25 +0800
Message-ID: <1368760654-28754-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1368760654-28754-1-git-send-email-b32955@freescale.com>
References: <1368760654-28754-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, vikram186@gmail.com, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
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
   The @ecc_strength_ds stands for the ecc bits needed within the @ecc_step_ds.
   The two fields should be set from the nand chip's datasheets.

   For example:
	"4bit ECC for each 512Byte" could be:
		@ecc_strength_ds = 4, @ecc_step_ds = 512.
	"40bit ECC for each 1024Byte" could be:
		@ecc_strength_ds = 40, @ecc_step_ds = 1024.

3.) Why do not re-use the @strength and @size in the nand_ecc_ctrl{}?
   The @strength and @size in nand_ecc_ctrl{} is used by the nand controller
   driver, while the @ecc_strength_ds and @ecc_step_ds are get from the datasheet.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 38535eb..ee696f1 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -434,6 +434,12 @@ struct nand_buffers {
  *			bad block marker position; i.e., BBM == 11110111b is
  *			not bad when badblockbits == 7
  * @cellinfo:		[INTERN] MLC/multichip data from chip ident
+ * @ecc_strength_ds:	[INTERN] ECC correctability from the datasheet.
+ *			Minimum amount of bit errors per @ecc_step_ds guaranteed
+ *			to be correctable. If unknown, set to zero.
+ * @ecc_step_ds:	[INTERN] ECC step required by the @ecc_strength_ds,
+ *                      also from the datasheet. It is the recommended ECC step
+ *			size, if known; if unknown, set to zero.
  * @numchips:		[INTERN] number of physical chips
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
  * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
@@ -510,6 +516,8 @@ struct nand_chip {
 	unsigned int pagebuf_bitflips;
 	int subpagesize;
 	uint8_t cellinfo;
+	uint16_t ecc_strength_ds;
+	uint16_t ecc_step_ds;
 	int badblockpos;
 	int badblockbits;
 
-- 
1.7.1

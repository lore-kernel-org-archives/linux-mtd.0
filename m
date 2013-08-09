Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7jKQ-0008A3-JZ
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2013 09:49:51 +0000
Date: Fri, 9 Aug 2013 12:49:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd: nand: silence some shift wrap warnings
Message-ID: <20130809094904.GC29282@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are static checkers which complain when we declare variables as
64 bit bitfields but only use the lower 32 bits because of shift
wrapping.  In this case "len" is declared as u64 as opposed to unsigned
long or something which might be 32 bits.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9a48758..3eddd04 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -108,13 +108,13 @@ static int check_offs_len(struct mtd_info *mtd,
 	int ret = 0;
 
 	/* Start address must align on block boundary */
-	if (ofs & ((1 << chip->phys_erase_shift) - 1)) {
+	if (ofs & ((1ULL << chip->phys_erase_shift) - 1)) {
 		pr_debug("%s: unaligned address\n", __func__);
 		ret = -EINVAL;
 	}
 
 	/* Length must align on block boundary */
-	if (len & ((1 << chip->phys_erase_shift) - 1)) {
+	if (len & ((1ULL << chip->phys_erase_shift) - 1)) {
 		pr_debug("%s: length not block aligned\n", __func__);
 		ret = -EINVAL;
 	}
@@ -394,7 +394,7 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 		memset(&einfo, 0, sizeof(einfo));
 		einfo.mtd = mtd;
 		einfo.addr = ofs;
-		einfo.len = 1 << chip->phys_erase_shift;
+		einfo.len = 1ULL << chip->phys_erase_shift;
 		nand_erase_nand(mtd, &einfo, 0);
 
 		/* Write bad block marker to OOB */
@@ -2630,7 +2630,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		}
 
 		/* Increment page address and decrement length */
-		len -= (1 << chip->phys_erase_shift);
+		len -= (1ULL << chip->phys_erase_shift);
 		page += pages_per_block;
 
 		/* Check, if we cross a chip boundary */

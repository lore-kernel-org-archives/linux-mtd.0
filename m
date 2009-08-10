Received: from koko.iders.ca ([206.45.72.61])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Maduc-00023u-Dt
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 23:04:22 +0000
Received: from [200.123.101.231] (zen.iders.ca [200.123.101.231])
	by koko.iders.ca (Postfix) with ESMTP id 1166B3E400A
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Aug 2009 18:04:01 -0500 (CDT)
Message-ID: <4A80A760.20901@iders.ca>
Date: Mon, 10 Aug 2009 18:04:00 -0500
From: Andrew McKay <amckay@iders.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: nand_update_bbt fix
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

For NAND parts with 2K pages or larger, kmalloc of one erase block will exceed 
128K and fail.  A vmalloc is used in nand_scan_bbt to allocate enough memory for 
one erase block.  This should likely be the case for nand_update_bbt as well.

Not sure the proper way to submit a patch, but here's a diff of the change:

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 55c23e5..43b8d08 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1030,7 +1030,7 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
   /* Allocate a temporary buffer for one eraseblock incl. oob */
   len = (1 << this->bbt_erase_shift);
   len += (len >> this->page_shift) * mtd->oobsize;
- buf = kmalloc(len, GFP_KERNEL);
+ buf = vmalloc(len);
   if (!buf) {
     printk(KERN_ERR "nand_update_bbt: Out of memory\n");
     return -ENOMEM;
@@ -1063,7 +1063,7 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
   }

   out:
- kfree(buf);
+ vfree(buf);
   return res;
  }

Andrew McKay
Iders Inc.

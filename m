Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BE9vE-0001KE-9W
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 17:41:04 +0100
Mime-Version: 1.0
Message-Id: <a06002006bca469e103ce@[130.161.115.44]>
Date: Thu, 15 Apr 2004 18:39:55 +0200
To: linux-mtd@lists.infradead.org
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
Subject: NAND bad blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

There's a slight discrepancy between what mtd and mkyaffs consider a bad block.

 From mtd/drivers/mtd/nand/nand.c:

   static int nand_block_bad(struct mtd_info *mtd, unsigned long page)
   {
         struct nand_chip *this = mtd->priv;

         this->cmdfunc (mtd, NAND_CMD_READOOB, NAND_BADBLOCK_POS, page);
         if (this->read_byte(mtd) != 0xff)
                 return 1;

         return 0;
   }

...which would indicate that even one bit set to zero would mark the 
block bad. However, mkyaffs.c has this code:

   /* Read the OOB data to determine if the block is valid.
    * If the block is damaged, then byte 5 of the OOB data will
    * have at least 2 zero bits.
    */

..snip..

   if(countBits[oobbuf[5]] < 7)
   {
	printf("Block at 0x08%lx is damaged and is not being 
formatted\n",addr);
   }

So, which is it ?

JDB
-- 
LART. 250 MIPS under one Watt. Free hardware design files.
http://www.lart.tudelft.nl/

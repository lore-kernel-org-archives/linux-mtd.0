Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BEFIY-00036C-65
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 23:25:30 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>,
	linux-mtd@lists.infradead.org
Date: Fri, 16 Apr 2004 10:35:17 +1200
References: <a06002006bca469e103ce@[130.161.115.44]>
In-Reply-To: <a06002006bca469e103ce@[130.161.115.44]>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040415222525.548414E20@blood.actrix.co.nz>
Subject: Re: NAND bad blocks
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 16 April 2004 04:39, J.D. Bakker wrote:
> Hi all,
>
> There's a slight discrepancy between what mtd and mkyaffs consider a bad
> block.
>
>  From mtd/drivers/mtd/nand/nand.c:
>
>    static int nand_block_bad(struct mtd_info *mtd, unsigned long page)
>    {
>          struct nand_chip *this = mtd->priv;
>
>          this->cmdfunc (mtd, NAND_CMD_READOOB, NAND_BADBLOCK_POS, page);
>          if (this->read_byte(mtd) != 0xff)
>                  return 1;
>
>          return 0;
>    }
>
> ...which would indicate that even one bit set to zero would mark the
> block bad. However, mkyaffs.c has this code:
>
>    /* Read the OOB data to determine if the block is valid.
>     * If the block is damaged, then byte 5 of the OOB data will
>     * have at least 2 zero bits.
>     */
>
> ..snip..
>
>    if(countBits[oobbuf[5]] < 7)
>    {
> 	printf("Block at 0x08%lx is damaged and is not being
> formatted\n",addr);
>    }

The idea with the bit counting in YAFFS is to prevent a single bad bit 
causing a block to be erroneously marked bad, thereby losing your data.

In reality this situation hardly ever, if ever, arises and the two code 
sequences are pretty much equivalent.

-- Charles

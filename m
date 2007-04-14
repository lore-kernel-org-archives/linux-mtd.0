Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HceyI-0005D4-RX
	for linux-mtd@lists.infradead.org; Sat, 14 Apr 2007 05:55:07 -0400
Subject: Re: [PATCH] [MTD] Casting bug in nand_default_block_markbad
From: Thomas Gleixner <tglx@linutronix.de>
To: Andre Renaud <andre@bluewatersys.com>
In-Reply-To: <461C5290.6090202@bluewatersys.com>
References: <461C5290.6090202@bluewatersys.com>
Content-Type: text/plain
Date: Sat, 14 Apr 2007 11:56:03 +0200
Message-Id: <1176544564.3387.56.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-04-11 at 15:14 +1200, Andre Renaud wrote:
> There is a slight bug in nand_default_block_markbad, where the offset is
> cast to an integer, prior to being shifted. This means that on large
> offsets, it is incorrectly doing a signed shift & losing bits. Fixed
> this by doing the cast after the shift (as is done elsewhere in the code).
> 
> Signed-off-by: Andre Renaud <andre@bluewatersys.com>
> 
> Index: drivers/mtd/nand/nand_base.c
> ===================================================================
> --- drivers/mtd/nand/nand_base.c        (revision 957)
> +++ drivers/mtd/nand/nand_base.c        (working copy)

Please provide patches which can be applied with -p1, i.e. do the diff
one directory level up

> @@ -355,7 +355,7 @@
>         int block, ret;
> 
>         /* Get block number */
> -       block = ((int)ofs) >> chip->bbt_erase_shift;
> +       block = (int)(ofs >> chip->bbt_erase_shift);
>         if (chip->bbt)
>                 chip->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);

Also your patch is whitespace damaged and does not apply.
There is some HOWTO submit patches with Thunderbird somewhere in the
net.

I fix that up manually.

Thanks,

	tglx

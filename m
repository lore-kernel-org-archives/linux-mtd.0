Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HhTpS-0005Iq-D5
	for linux-mtd@lists.infradead.org; Fri, 27 Apr 2007 13:01:55 -0400
Subject: Re: [PATCH] [MTD] NAND: Wrong calculation of page number in
	nand_block_bad()
From: Thomas Gleixner <tglx@linutronix.de>
To: "Knobloch, Thomas" <knobloch@siemens.com>
In-Reply-To: <2EDADF4ED023F04BAD4D7A4131ECEB930105527C@mchp7rfa.ww002.siemens.net>
References: <2EDADF4ED023F04BAD4D7A4131ECEB930105527C@mchp7rfa.ww002.siemens.net>
Content-Type: text/plain
Date: Fri, 27 Apr 2007 19:03:51 +0200
Message-Id: <1177693431.25960.123.camel@localhost.localdomain>
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

On Fri, 2007-04-27 at 13:19 +0200, Knobloch, Thomas wrote:
> In case that there is no memory based bad block table available the
> function nand_block_checkbad() in drivers/mtd/nand/nand_base.c will call
> nand_block_bad() directly. When parameter 'getchip' is set to zero,
> nand_block_bad() will not right shift the offset to calculate the
> correct page number.
> 
> Signed-off-by: Thomas Knobloch <knobloch@siemens.com>
>
> diff -uNr a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> --- a/drivers/mtd/nand/nand_base.c	2007-04-27 12:44:23.345198284
> +0200
> +++ b/drivers/mtd/nand/nand_base.c	2007-04-27 12:46:57.916226928
> +0200
> @@ -312,7 +312,7 @@
>  		/* Select the NAND device */
>  		chip->select_chip(mtd, chipnr);
>  	} else
> -		page = (int)ofs;
> +		page = (int)(ofs >> chip->page_shift);

Can you please make this outside the else path, so we can remove same
code in the if (getchip) path.

Please also apply the pagemask right there so we don't have it in both
cmdfunc() calls.

	tglx

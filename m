Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjGYh-0005dX-DX
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 11:16:00 -0400
Subject: Re: AW: [PATCH] [MTD] NAND: Wrong calculation of page number
	innand_block_bad()
From: Thomas Gleixner <tglx@linutronix.de>
To: "Knobloch, Thomas" <knobloch@siemens.com>
In-Reply-To: <2EDADF4ED023F04BAD4D7A4131ECEB93010554E3@mchp7rfa.ww002.siemens.net>
References: <2EDADF4ED023F04BAD4D7A4131ECEB930105527C@mchp7rfa.ww002.siemens.net>
	<1177693431.25960.123.camel@localhost.localdomain>
	<2EDADF4ED023F04BAD4D7A4131ECEB93010554E3@mchp7rfa.ww002.siemens.net>
Content-Type: text/plain
Date: Wed, 02 May 2007 17:18:14 +0200
Message-Id: <1178119094.25504.1.camel@localhost.localdomain>
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

On Wed, 2007-05-02 at 14:14 +0200, Knobloch, Thomas wrote:
> On Fri, 2007-04-27 at 19:04, Thomas Gleixner wrote:
> > Can you please make this outside the else path, so we can remove same
> > code in the if (getchip) path.
> > 
> > Please also apply the pagemask right there so we don't have it in both
> > cmdfunc() calls.
> 
> I added the requested code cleanup to the original patch:

If you now manage to send a non line wrapped patch with the log message
and your Signed-off-by, then I can apply it right from the mail.

Thanks,

	tglx

>  	if (chip->options & NAND_BUSWIDTH_16) {
>  		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos &
> 0xFE,
> +		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos,
> page);
>  		if (chip->read_byte(mtd) != 0xff)
>  			res = 1;
>  	}

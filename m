Received: from mail02.hansenet.de ([213.191.73.62] helo=webmail.hansenet.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HFpRG-0003xr-US
	for linux-mtd@lists.infradead.org; Sat, 10 Feb 2007 05:26:42 -0500
From: Thomas Koeller <thomas.koeller@baslerweb.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] eXcite nand flash driver
Date: Sat, 10 Feb 2007 11:22:04 +0100
References: <200702080157.25432.thomas.koeller@baslerweb.com>
	<1170949737.3646.29.camel@chaos>
In-Reply-To: <1170949737.3646.29.camel@chaos>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <200702101122.05049.thomas.koeller@baslerweb.com>
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Donnerstag, 8. Februar 2007, Thomas Gleixner wrote:
> > +/* command and control functions */
> > +static void excite_nand_control(struct mtd_info *mtd, int cmd,
> > +				       unsigned int ctrl)
> > +{
> > +	io_reg_t regs =
> > +	    container_of(mtd, struct excite_nand_drvdata, board_mtd)->regs;
> > +	static void __iomem *tgt = NULL;
> > +
> > +	switch (ctrl) {
> > +	case NAND_CTRL_CHANGE | NAND_CTRL_CLE:
> > +		tgt = regs + EXCITE_NANDFLASH_CMD_BYTE;
> > +		break;
> > +	case NAND_CTRL_CHANGE | NAND_CTRL_ALE:
> > +		tgt = regs + EXCITE_NANDFLASH_ADDR_BYTE;
> > +		break;
> > +	case NAND_CTRL_CHANGE | NAND_NCE:
> > +		tgt = regs + EXCITE_NANDFLASH_DATA_BYTE;
> > +		break;
> > +	}
>
> Err, did this ever work ? I doubt it. From nand_base.c:
>
>                 chip->cmd_ctrl(mtd, page_addr, ctrl);
>                 ctrl &= ~NAND_CTRL_CHANGE;
>                 chip->cmd_ctrl(mtd, page_addr >> 8, ctrl);
>
> So I expect an OOPS happens on a regular base.
>

I guess it is the 'static void __iomem *tgt = NULL' part that worries
you? Think about it, that value is never used.

However, I admit it is somewhat unclean, and therefore I am changing
it. Updated patch follows.

tk

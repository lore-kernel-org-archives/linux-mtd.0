Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vmpfc-000571-Op
 for linux-mtd@lists.infradead.org; Sat, 30 Nov 2013 18:53:37 +0000
Received: by mail-pb0-f49.google.com with SMTP id jt11so16021970pbb.8
 for <linux-mtd@lists.infradead.org>; Sat, 30 Nov 2013 10:53:15 -0800 (PST)
Date: Sat, 30 Nov 2013 10:53:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3] mtd/nand: don't use {read,write}_buf for 8-bit
 transfers
Message-ID: <20131130185308.GG29397@norris.computersforpeace.net>
References: <1365164021.28127.109.camel@i7.infradead.org>
 <1385500515-5376-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20131127073512.GB13929@norris.computersforpeace.net>
 <20131129122018.GB2815@localhost>
 <20131130060428.GA29397@norris.computersforpeace.net>
 <20131130163535.GB2402@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131130163535.GB2402@localhost>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, kernel@pengutronix.de,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 30, 2013 at 01:35:36PM -0300, Ezequiel Garcia wrote:
> On Fri, Nov 29, 2013 at 10:04:28PM -0800, Brian Norris wrote:
> > 
> > Unfortunately, I realized that Uwe's patch doesn't go far enough, I
> > don't think. It looks like it needs something like the following diff
> > (only compile-tested).
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index bd39f7b67906..1ab264457d94 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -2933,7 +2933,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
> >  					int *busw)
> >  {
> >  	struct nand_onfi_params *p = &chip->onfi_params;
> > -	int i;
> > +	int i, j;
> >  	int val;
> >  
> >  	/* Try ONFI for unknown chip or LP */
> > @@ -2942,18 +2942,10 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
> >  		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
> >  		return 0;
> >  
> > -	/*
> > -	 * ONFI must be probed in 8-bit mode or with NAND_BUSWIDTH_AUTO, not
> > -	 * with NAND_BUSWIDTH_16
> > -	 */
> > -	if (chip->options & NAND_BUSWIDTH_16) {
> > -		pr_err("ONFI cannot be probed in 16-bit mode; aborting\n");
> > -		return 0;
> > -	}
> > -
> >  	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> >  	for (i = 0; i < 3; i++) {
> > -		chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
> > +		for (j = 0; j < sizeof(*p); j++)
> > +			*(uint8_t *)p = chip->read_byte(mtd);
> >  		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
> >  				le16_to_cpu(p->crc)) {
> >  			break;
> > 
> > What do you think? (And more importantly, how does this test out for
> > you?)
> > 
> 
> Your proposal would work (fixing a minor typo for incrementing 'p'),
> except the nand_command() implementation messes with the buswith.
> Therefore, after a long debugging session, I could make it work using
> this hack:
> 
> @@ -542,8 +545,8 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
>  	/* Serially input address */
>  	if (column != -1) {
>  		/* Adjust columns for 16 bit buswidth */
> -		if (chip->options & NAND_BUSWIDTH_16)
> -			column >>= 1;
> +//		if (chip->options & NAND_BUSWIDTH_16)
> +//			column >>= 1;
>  		chip->cmd_ctrl(mtd, column, ctrl);
>  		ctrl &= ~NAND_CTRL_CHANGE;
>  	}

Hmm, that does seem like a hack. What command is giving you problems, by
the way? And is the NAND operational after this hack?

It looks like those two lines are there so that we can always specify
'column' in bytes, and nand_command() will do the byte/word translation
automatically. But we don't want this for certain commands, I think, so
maybe a "hack" is necessary...

> Now, IMHO, the solution of setting the defaults to x8 during the device
> detection phase, is far simpler.
> 
> BTW: this is not really related to Uwe's patch, right? It's just a complement
> to his work, as far as I can see.

Yeah, it's a complement. At first, I though Uwe's patch included this,
but I was wrong.

Brian

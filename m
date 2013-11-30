Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vmrkl-0006ck-Ln
 for linux-mtd@lists.infradead.org; Sat, 30 Nov 2013 21:07:04 +0000
Date: Sat, 30 Nov 2013 18:06:44 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3] mtd/nand: don't use {read,write}_buf for 8-bit
 transfers
Message-ID: <20131130210643.GB2334@localhost>
References: <1365164021.28127.109.camel@i7.infradead.org>
 <1385500515-5376-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20131127073512.GB13929@norris.computersforpeace.net>
 <20131129122018.GB2815@localhost>
 <20131130060428.GA29397@norris.computersforpeace.net>
 <20131130163535.GB2402@localhost> <20131130165122.GC2402@localhost>
 <20131130190149.GH29397@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131130190149.GH29397@norris.computersforpeace.net>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>, kernel@pengutronix.de,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 30, 2013 at 11:01:49AM -0800, Brian Norris wrote:
> On Sat, Nov 30, 2013 at 01:51:23PM -0300, Ezequiel Garcia wrote:
> > On Sat, Nov 30, 2013 at 01:35:35PM -0300, Ezequiel Garcia wrote:
> > > On Fri, Nov 29, 2013 at 10:04:28PM -0800, Brian Norris wrote:
> > > > 
> > > > Unfortunately, I realized that Uwe's patch doesn't go far enough, I
> > > > don't think. It looks like it needs something like the following diff
> > > > (only compile-tested).
> > > > 
> > > > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > > > index bd39f7b67906..1ab264457d94 100644
> > > > --- a/drivers/mtd/nand/nand_base.c
> > > > +++ b/drivers/mtd/nand/nand_base.c
> > > > @@ -2933,7 +2933,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
> > > >  					int *busw)
> > > >  {
> > > >  	struct nand_onfi_params *p = &chip->onfi_params;
> > > > -	int i;
> > > > +	int i, j;
> > > >  	int val;
> > > >  
> > > >  	/* Try ONFI for unknown chip or LP */
> > > > @@ -2942,18 +2942,10 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
> > > >  		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
> > > >  		return 0;
> > > >  
> > > > -	/*
> > > > -	 * ONFI must be probed in 8-bit mode or with NAND_BUSWIDTH_AUTO, not
> > > > -	 * with NAND_BUSWIDTH_16
> > > > -	 */
> > > > -	if (chip->options & NAND_BUSWIDTH_16) {
> > > > -		pr_err("ONFI cannot be probed in 16-bit mode; aborting\n");
> > > > -		return 0;
> > > > -	}
> > > > -
> > > >  	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> > > >  	for (i = 0; i < 3; i++) {
> > > > -		chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
> > > > +		for (j = 0; j < sizeof(*p); j++)
> > > > +			*(uint8_t *)p = chip->read_byte(mtd);
> > > >  		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
> > > >  				le16_to_cpu(p->crc)) {
> > > >  			break;
> > > > 
> > > > What do you think? (And more importantly, how does this test out for
> > > > you?)
> > > > 
> > > 
> > > Your proposal would work (fixing a minor typo for incrementing 'p'),
> > > except the nand_command() implementation messes with the buswith.
> > > Therefore, after a long debugging session, I could make it work using
> > > this hack:
> > > 
> > > @@ -542,8 +545,8 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
> > >  	/* Serially input address */
> > >  	if (column != -1) {
> > >  		/* Adjust columns for 16 bit buswidth */
> > > -		if (chip->options & NAND_BUSWIDTH_16)
> > > -			column >>= 1;
> > > +//		if (chip->options & NAND_BUSWIDTH_16)
> > > +//			column >>= 1;
> > >  		chip->cmd_ctrl(mtd, column, ctrl);
> > >  		ctrl &= ~NAND_CTRL_CHANGE;
> > >  	}
> > > 
> > > Now, IMHO, the solution of setting the defaults to x8 during the device
> > > detection phase, is far simpler.
> > > 
> > 
> > And after some more debugging, I now realise the above problem is also
> > present at my previous proposal. So it seems we would need to actually
> > temporary "deactivate" NAND_BUSWIDTH_16 from chip->options.
> > 
> > I wonder how ugly that could be. Comments?
> 
> I'm not sure yet. I'd like to better understand what command is failing,
> and why.
> 
> > In any case, it seems our proposals are equivalent:
> > * we can change the defaults to x8 (is this at all needed?)
> > * we can use read_byte
> 
> No, our proposals are not equivalent.
> 
> Your patches are only solving these ONFI bus-width problems during
> initialization.

Agreed.

> I believe we will want to use some ONFI routines (SET
> FEATURES, especially) after initialization. This is where the rest of
> Uwe's patch comes into play. So I don't think we can always switch
> between call-backs and play games with NAND_BUSWIDTH_16; we should get
> the bus width right as soon as possible, and then make sure that the
> callbacks always work as expected.
> 

Sure, I completely understand the above. The patches I've been pushing
are meant *only* to solve the initial device detection, and in
particular to fix the currently broken ONFI detection.

I realise that Uwe's patches (and from what I've been seeing some more)
are needed in other to solve other ONFI width-related problems.

Just to clarify, the v2 I just sent was motivated by this rationale:
if we need to temporarily switch off NAND_BUSWIDTH_16, then it makes
sense to also switch the entire default functions.

However, if you can find a cleaner (i.e. ot too hacky) solution,
so we can prevent this width switching, I'd be happy to test it!

> You are also placing more burden on drivers. You require the drivers to
> add failure logic if the NAND core auto-configures a buswidth that the
> host doesn't support. I prefer that for cases where the bus width is
> known a-priori, the driver only needs to call nand_scan(), and the NAND
> core can error out appropriately.
> 

Yup, that's correct. Under my solution driver's _must_ handle a two phase
initialization: nand_scan_ident() + nand_scan_tail(); but only if they
need some special tweaking after the bus width discovering.

I admit my proposal might be narrow-minded, and biased by the only few
NAND drivers I'm familiar to :(
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com

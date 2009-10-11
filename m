Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MwrTq-0003LP-Re
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 06:00:35 +0000
Subject: Re: [PATCH 2/3]: mtdoops: Use panic_write if panic_on_oops is set
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <1254979692.3359.32.camel@localhost>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091002160652.5581c13c@marrow.netinsight.se>
	<1254979692.3359.32.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 09:00:20 +0300
Message-Id: <1255240820.3359.33.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd <linux-mtd@lists.infradead.org>,
	Aaro Koskinen <aaro.koskinen@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-08 at 08:28 +0300, Artem Bityutskiy wrote:
> On Fri, 2009-10-02 at 16:06 +0200, Simon Kagstrom wrote:
> > mtdoops will not store the oops if panic_on_oops is set. This patch
> > makes use of panic_write if panic_on_oops is set. mtdoops_inc_counter is
> > also not good to call on panics, since the call to mtd->read suspends
> > the panic (at least with my NAND flash), so defer that. There is also no
> > point in doing it since we cannot recover from the panic anyway.
> > 
> > panic_on_oops is not exported to modules, so make mtdoops in-kernel only
> > 
> > Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> > ---
> >  drivers/mtd/Kconfig   |    2 +-
> >  drivers/mtd/mtdoops.c |    8 ++++++--
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> > index ecf90f5..6b39a8b 100644
> > --- a/drivers/mtd/Kconfig
> > +++ b/drivers/mtd/Kconfig
> > @@ -305,7 +305,7 @@ config SSFDC
> >  	  flash. You can mount it with FAT file system.
> >  
> >  config MTD_OOPS
> > -	tristate "Log panic/oops to an MTD buffer"
> > +	bool "Log panic/oops to an MTD buffer"
> >  	depends on MTD
> >  	help
> >  	  This enables panic and oops messages to be logged to a circular
> > diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> > index 244582c..cc2c187 100644
> > --- a/drivers/mtd/mtdoops.c
> > +++ b/drivers/mtd/mtdoops.c
> > @@ -215,7 +215,11 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
> >  		printk(KERN_ERR "mtdoops: Write failure at %d (%td of %d written), err %d.\n",
> >  			cxt->nextpage * cxt->page_size, retlen,	cxt->page_size, ret);
> >  
> > -	mtdoops_inc_counter(cxt);
> > +	/* Go to next page, but skip this if we are currently panicking.
> > +	 * We will not recover from that anyway, and the mtd->read call
> > +	 * causes the panic to suspend */
> > +	if (!in_interrupt() && !panic_on_oops)
> > +		mtdoops_inc_counter(cxt);
> 
> Hmm, what if we are in an oops we want to write more than one time,
> because the oops output is large? With this change we will write twice
> to the same flash area in that case, which is bad.
> 
> Basically, if you skip 'mtdoops_inc_counter()', you should disallow any
> further mtdoops writes, so you need something like 'ctx->i_am_screwed'
> flag, I guess.
> 
> Also, I think this kind of check should be inside
> 'mtdoops_inc_counter()', not outside. It is just cleaner.
> 
> BTW, 'mtdoops_inc_counter()' reads flash before each write, which is
> strange. If an eraseblock was erased, everything is 0xFFed there. Why
> not to maintain an internal array which contains erased/not erased
> status of each eraseblock?
> 
> > @@ -340,7 +344,7 @@ static void mtdoops_console_sync(void)
> >  	cxt->ready = 0;
> >  	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
> >  
> > -	if (mtd->panic_write && in_interrupt())
> > +	if (mtd->panic_write && (in_interrupt() || panic_on_oops))
> >  		/* Interrupt context, we're going to panic so try and log */
> >  		mtdoops_write(cxt, 1);

Oh, panic_on_oops is not exported. So we should either export it or make
mtdoops to be always compiled-in.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

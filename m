Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mvmec-0003es-0j
	for linux-mtd@lists.infradead.org; Thu, 08 Oct 2009 06:39:14 +0000
Date: Thu, 8 Oct 2009 08:38:57 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH 2/3]: mtdoops: Use panic_write if panic_on_oops is set
Message-ID: <20091008083857.5bdc9c6d@marrow.netinsight.se>
In-Reply-To: <1254979692.3359.32.camel@localhost>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091002160652.5581c13c@marrow.netinsight.se>
	<1254979692.3359.32.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd <linux-mtd@lists.infradead.org>,
	Aaro Koskinen <aaro.koskinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for reviewing the patches!

On Thu, 08 Oct 2009 08:28:12 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

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

No, cxt->ready is set by mtdoops_inc_counter, so there will only be one
write (no more messages are put in the buffer) until inc_counter is done.

> Also, I think this kind of check should be inside
> 'mtdoops_inc_counter()', not outside. It is just cleaner.

OK, I'll do that.

> BTW, 'mtdoops_inc_counter()' reads flash before each write, which is
> strange. If an eraseblock was erased, everything is 0xFFed there. Why
> not to maintain an internal array which contains erased/not erased
> status of each eraseblock?

Well, it reads the flash for the next block which will be written (on
the next oops), and schedules an erase if needed. But sure, since it
scans the partition at startup, an array could be used instead.

The check I added was because mtdoops_inc_counter caused my panic to
hang with my NAND flash (it sounds strange, but I never got the actual
restart). I haven't debugged why it happened, but it's caused by the
mtd->read call from mtdoops_inc_counter. 


Anyway, perhaps a cleaner solution to the entire issue is to put
mtdoops_inc_counter in a scheduled work instead so that we can skip
this check entirely.

> > @@ -340,7 +344,7 @@ static void mtdoops_console_sync(void)
> >  	cxt->ready = 0;
> >  	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
> >  
> > -	if (mtd->panic_write && in_interrupt())
> > +	if (mtd->panic_write && (in_interrupt() || panic_on_oops))
> >  		/* Interrupt context, we're going to panic so try and log */
> >  		mtdoops_write(cxt, 1);
> >  	else
> 
> I agree with this part and will push the patch from Aaro to my tree for
> now.

Good, just bear in mind that adding the panic_on_oops check will make
it impossible to build as a module as panic_on_oops is not exported. I
disabled module-building in this patch because of this.

But perhaps the real solution is to export panic_on_oops, I just
assumed that there was some good reason why it wasn't exported so
far :-)

// Simon

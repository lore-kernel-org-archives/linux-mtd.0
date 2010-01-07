Received: from [194.16.221.21] (helo=ernst.netinsight.se)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSmA4-0002sS-T2
	for linux-mtd@lists.infradead.org; Thu, 07 Jan 2010 06:48:05 +0000
Date: Thu, 7 Jan 2010 07:47:17 +0100
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v7 5/5]: mtdoops: refactor as a kmsg_dumper
Message-ID: <20100107074717.7dcbb50c@marrow.netinsight.se>
In-Reply-To: <1262788396.3181.8153.camel@macbook.infradead.org>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091015094815.36f5872c@marrow.netinsight.se>
	<1262788396.3181.8153.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 06 Jan 2010 14:33:16 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> > +	/* Panics must be written immediately */
> > +	if (reason == kmsg_dump_panic) {
> > +		if (!cxt->mtd->panic_write)
> > +			printk(KERN_ERR "mtdoops: Cannot write from panic without panic_write\n");
> > +		else
> > +			mtdoops_write(cxt, 1);
> > +		return;
> 
> Would there be any harm in scheduling the work_write function _anyway_,
> just in case it manages to run?
> 
> The bug report at http://bugzilla.kernel.org/show_bug.cgi?id=14102 seems
> to be suggesting that sometimes it _did_ manage to work, with a bit of
> luck and a following wind.

In my tests, I never got it to write out anything when using scheduled
work on panics. I did the tests on a uniprocessor though, maybe that
could be a reason.

But you are right, probably it doesn't hurt anyway. 

> Also, it looks like in the (in_interrupt() || panic_on_oops) case we end
> up calling kmsg_dump(KMSG_DUMP_OOPS) from oops_exit(), almost
> immediately followed by kmsg_dump(KMSG_DUMP_PANIC). Is that going to do
> the right thing?

Well, since I never got it to dump anything with the work queue, the
dump will be done when KMSG_DUMP_PANIC is called. The work queue never
gets to run, so I never saw double dumps with this approach.

Anyway, perhaps one could do a cancel_work() when running the panic
handler to avoid situations when both are written (since it apparently
is possible as above).

// Simon

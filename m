Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MxEJP-0001WD-Rf
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 06:23:20 +0000
Date: Mon, 12 Oct 2009 08:23:12 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH 2/3]: mtdoops: Use panic_write if panic_on_oops is set
Message-ID: <20091012082312.4cd9b36c@marrow.netinsight.se>
In-Reply-To: <1255240820.3359.33.camel@localhost>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091002160652.5581c13c@marrow.netinsight.se>
	<1254979692.3359.32.camel@localhost>
	<1255240820.3359.33.camel@localhost>
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

On Sun, 11 Oct 2009 09:00:20 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2009-10-08 at 08:28 +0300, Artem Bityutskiy wrote:
>
> > > -	if (mtd->panic_write && in_interrupt())
> > > +	if (mtd->panic_write && (in_interrupt() || panic_on_oops))
> > >  		/* Interrupt context, we're going to panic so try and log */
> > >  		mtdoops_write(cxt, 1);
> 
> Oh, panic_on_oops is not exported. So we should either export it or make
> mtdoops to be always compiled-in.

Yep, in the earlier patch series (this one!) I made it always
compiled-in, but for new one I kept the module support and also sent
a patch to LKML which exports panic_on_oops. I saw you did the same
thing now, thanks!

// Simon

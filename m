Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]
	helo=master.linux-sh.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MZEwS-0002FZ-ME
	for linux-mtd@lists.infradead.org; Fri, 07 Aug 2009 02:12:29 +0000
Date: Fri, 7 Aug 2009 11:12:18 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [patch 8/8] mtd: make onenand/generic.c more generic
Message-ID: <20090807021218.GA25378@linux-sh.org>
References: <200908062305.n76N5but004994@imap1.linux-foundation.org>
	<9c9fda240908061753l58776235j44f733b6dab354b1@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c9fda240908061753l58776235j44f733b6dab354b1@mail.gmail.com>
Cc: tony@atomide.com, damm@igel.co.jp, akpm@linux-foundation.org,
	dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 07, 2009 at 09:53:06AM +0900, Kyungmin Park wrote:
> Hi,
> 
> > +/*
> > + * Note: Driver name and platform data format have been updated!
> > + *
> > + * This version of the driver is named "onenand-flash" and takes struct
> > + * onenand_platform_data as platform data. The old ARM-specific version
> > + * with the name "onenand" used to take struct flash_platform_data.
> > + */
> > +#define DRIVER_NAME ? ?"onenand-flash"
> >
> 
> At least only apollon board use this driver name, "onenand" at kernel.
> so there's no reason to change it.
> Of course internally we use it "onenand" at other board. but at this
> time no need to rename it.
> 
> we not fully discuss it so I hope to discuss it more. I hope to keep
> the name as before.
> 
You completely ignored the comments for why the name change was done in
the first place. The data structures are changed around meaning that any
of the old onenand users are going to silently blow up if they have not
yet been updated. Forcing them to change over to the new driver name
means that someone has taken a look at it and converted to the new
platform data, rather than just ending up with bogus crashes.

If you're happy with your platforms breaking randomly in order to keep
the names the same, then fine, the name change can be dropped. I think
it's a but discourteous to introduce this sort of breakage while
keeping the same name, however. Folks that suddenly realize their devices
are no longer showing up will have to manually look and convert over to
the new data structure, which is a lot less evil than randomly blowing
up.

Since you seem to be the only one that has out of tree drivers that are
using this and those are the ones that are the most likely to be broken
by this change, I find it unusual that you are resisting changing the
name, it's precisely to help these transitions rather than ending up with
nonsensical oopses. If you would rather have existing users blow up
because they haven't converted over to the new data structures, then
sure, lets keep the old name. 

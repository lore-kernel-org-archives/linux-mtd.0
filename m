Received: from quartz.orcorp.ca ([184.70.90.242])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TNomu-0003bH-Q0
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 17:49:13 +0000
Date: Mon, 15 Oct 2012 11:49:07 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] [MTD] Adjust the NOR CFI flash timeouts to round better
Message-ID: <20121015174907.GA529@obsidianresearch.com>
References: <20121005183202.GA11385@obsidianresearch.com>
 <1350308556.5769.5.camel@sauron.fi.intel.com>
 <1350317380.14124.26.camel@shinybook.infradead.org>
 <20121015165719.GB32563@obsidianresearch.com>
 <1350322301.14124.45.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1350322301.14124.45.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 15, 2012 at 10:31:41AM -0700, David Woodhouse wrote:

> > > So it's not *entirely* bogus, but it should certainly be cleaned up to
> > > use the msecs_to_jiffies() helpers... or preferably not use jiffies at
> > > all, perhaps.
> > 
> > No doubt this is part of why I've seen failures on my boards, the
> > timeout is too short by half and rounded wrong :)
> 
> Yeah, the rounding by +2 is confusing. I'm sure it's wrong, but at least
> I can kind of see where it came from.

The rounding by +2? I think even if you used msecs_to_jiffies you'd
need to add a +1 to the result to make the timeout algorithm work
right..

Is there a better way to do these timeouts?
 
> > A quick grep shows many cases in drivers/mtd that use division of HZ,
> > what would you like to see done here?
> 
> I'd like someone with infinite amounts of free time to go through and
> clean them all up :)

lol! Would you accept msecs_to_jiffies conversion for the cfi files?

> > ?? That's '??s', not 'us', for next time the patch is submitted. Welcome
> >   to the 21st century.
> > 
> > Hmm.. I may need a new terminal and/or mail reader ;)
> 
> As I said... welcome to the 21st century. Seriously though, what are you
> using that isn't capable of even *preserving* UTF-8 when you reply to
> it? That's really quite broken, and has been considered so for a decade
> or more already.

I deliberately made it not preserve UTF-8 for this posting, it is just
rxvt, nobody ever put unicode into it.

Jason

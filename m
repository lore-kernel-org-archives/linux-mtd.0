Received: from quartz.orcorp.ca ([184.70.90.242])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TNq1V-00019J-EU
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 19:08:25 +0000
Date: Mon, 15 Oct 2012 13:08:13 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] [MTD] Adjust the NOR CFI flash timeouts to round better
Message-ID: <20121015190813.GA7638@obsidianresearch.com>
References: <20121005183202.GA11385@obsidianresearch.com>
 <1350308556.5769.5.camel@sauron.fi.intel.com>
 <1350317380.14124.26.camel@shinybook.infradead.org>
 <20121015165719.GB32563@obsidianresearch.com>
 <1350322301.14124.45.camel@shinybook.infradead.org>
 <20121015174907.GA529@obsidianresearch.com>
 <1350325973.14124.49.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1350325973.14124.49.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 15, 2012 at 11:32:53AM -0700, David Woodhouse wrote:

> Yes, HZ/1500+1 I could understand. That's the number of jiffies that
> give you '666µs or more'. The +2 is odd though.

Looking more closely I agree, it seems bogus - the use of time_after
takes care of the short first jiffy problem, the real problem I see is
that 1500 was supposed to be µs, that is close to the datasheet spec
for the flash I have. Fixing that will almost double the timeout on my
systems...

> > > I'd like someone with infinite amounts of free time to go through and
> > > clean them all up :)
> > 
> > lol! Would you accept msecs_to_jiffies conversion for the cfi files?
> 
> Absolutely. Although I'd like to take a little step back and take a more
> thoughtful view of how we *should* be handing these timeouts, rather
> than a simple janitor-style conversion of the existing code.

Okay, well, I'll send a patch in a few days, if there is a better way
than:

 unsigned long uWriteTimeout = usecs_to_jiffies(1500);
 timeo = jiffies + uWriteTimeout;
 if (time_after(jiffies, timeo)) // TIMEOUT

Maybe someone will pipe up?

Jason

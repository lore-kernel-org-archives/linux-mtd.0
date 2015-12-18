Received: from mail-pf0-x22d.google.com ([2607:f8b0:400e:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA41F-0000ey-FZ
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 23:01:02 +0000
Received: by mail-pf0-x22d.google.com with SMTP id n128so38129436pfn.0
 for <linux-mtd@lists.infradead.org>; Fri, 18 Dec 2015 15:00:41 -0800 (PST)
Date: Fri, 18 Dec 2015 15:00:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: support JEDEC additional redundant parameter
 pages
Message-ID: <20151218230038.GU10460@google.com>
References: <1449268528-18154-1-git-send-email-antoine.tenart@free-electrons.com>
 <20151210202052.GJ144338@google.com> <20151211081620.GE28188@kwain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151211081620.GE28188@kwain>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 11, 2015 at 09:16:20AM +0100, Antoine Tenart wrote:
> On Thu, Dec 10, 2015 at 12:20:52PM -0800, Brian Norris wrote:
> > On Fri, Dec 04, 2015 at 11:35:28PM +0100, Antoine Tenart wrote:
> > > The JEDEC standard defines the JEDEC parameter page data structure.
> > > One page plus two redundant pages are always there, in bits 0-1535.
> > > Additionnal redundant parameter pages can be stored at bits 1536+.
> > > Add support to read these pages.
> > > 
> > > The first 3 JEDEC parameter pages are always checked, and if none
> > > is valid we try to read additional redundant pages following the
> > > standard definition: we continue while at least two of the four bytes
> > > of the parameter page signature match (stored in the first dword).
> > > 
> > > There is no limit to the number of additional redundant parameter
> > > page.
> > 
> > Hmm, do we really want this to be unbounded? What if (for example) a
> > driver is buggy and has some kind of wraparound, so that it keeps
> > returning the same parameter page (or a sequence of a few pages)?
> 
> I would say buggy drivers need to be fixed. It's complicated to handle
> all possible bugs a driver may have in the common code.

Well, that's a fair statement to some extent. But generally, it is
*much* preferred to code to real practice, rather than theoretical
standards. And it's also much preferred not to code in potentially
infinite loops. That's why we have timeouts, for instance, on most I/O.

> If you prefer we can put a limit to the tries the code make, but this
> can also impact working drivers by not trying enough. I'm open to
> suggestions.

Yes, please put some kind of limit. Probably a low one (after some
number of damaged parameter pages, what's the likelihood that there will
be any more correct ones?). If you make it a macro with a reasonable
name, then it'll be more obvious what it does, in case someone needs to
increase it.

> > Also, is this actually solving any real problem? Have you seen flash
> > that have more than the first 3 parameter pages? Have you tested
> > this beyond the first 3?
> 
> This does not solve any real world problem I had. I had to look at the
> JEDEC standard and I made this in order to test something. So I thought
> this could be useful to others, as the current code does not fully
> implement the standard.

OK. Well, I guess having the code might be better than nothing. I assume
you at least faked the parameter pages so you could exercise all the
code paths?

Brian

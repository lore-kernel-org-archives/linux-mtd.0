Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzvn6-0006wS-5g
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 00:12:35 +0000
Received: by pacej9 with SMTP id ej9so130827823pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 16:12:11 -0800 (PST)
Date: Fri, 20 Nov 2015 16:12:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Philippe De Muyter <phdm@macqel.be>
Cc: Simon Falsig <simon@newtec.dk>, linux-mtd@lists.infradead.org,
 Vignesh R <vigneshr@ti.com>
Subject: Re: mmap support for m25p80 device
Message-ID: <20151121001208.GE64635@google.com>
References: <9d83b70759c3d2507200432b4ff162be@mail.gmail.com>
 <20151118021503.GA140057@google.com>
 <20151119213119.GA106769@google.com>
 <20151120084152.GA26112@frolo.macqel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151120084152.GA26112@frolo.macqel>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 20, 2015 at 09:41:52AM +0100, Philippe De Muyter wrote:
> On Thu, Nov 19, 2015 at 01:31:19PM -0800, Brian Norris wrote:
> > On Tue, Nov 17, 2015 at 06:15:03PM -0800, Brian Norris wrote:
> > > It's not quite so simple. Read the comments in mtdchar, and you'll see
> > > that there's some layering bugs that caused us to disable MMU mmap
> > > entirely. Apparently no one cared so far. Read the comments here:
> > > 
> > > commit f5cf8f07423b2677cebebcebc863af77223a4972
> > > Author: David Woodhouse <David.Woodhouse@intel.com>
> > > Date:   Tue Oct 9 15:08:10 2012 +0100
> > > 
> > >     mtd: Disable mtdchar mmap on MMU systems
> > > 
> > > But feel free to fix it.
> > 
> > I see there's an old patch that never got reviewed/tested, for doing
> > this:
> > 
> > http://patchwork.ozlabs.org/patch/327981/
> 
> I use that patch to access a battery-back-up'ed SRAM connected to the
> WEIM bus of a Freescale i.MX6q ARM processor, and it works perfectly for
> that.  On that processor, the WEIM bus maps the connected peripherals in
> the physical memory addresses range, so it is really easy to make that
> user-accessible through mmap.  Only the above patch was needed.

OK, would you mind resending it, so it can get fresh eyes?

Brian

Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AJLKu-0005Ie-5f
	for <linux-mtd@lists.infradead.org>; Mon, 10 Nov 2003 23:20:44 +0000
Date: Mon, 10 Nov 2003 15:19:18 -0800
From: Jun Sun <jsun@mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20031110151918.D19785@mvista.com>
References: <20031104164431.K16745@mvista.com>
	<1068023691.6065.7.camel@hades.cambridge.redhat.com>
	<20031105095658.B19785@mvista.com>
	<1068112207.6065.455.camel@hades.cambridge.redhat.com>
	<20031106110921.G19785@mvista.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031106110921.G19785@mvista.com>;
	from jsun@mvista.com on Thu, Nov 06, 2003 at 11:09:21AM -0800
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] extend physmap.c to support run-time configure and
	partitioning (take 3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 06, 2003 at 11:09:21AM -0800, Jun Sun wrote:
> On Thu, Nov 06, 2003 at 09:50:07AM +0000, David Woodhouse wrote:
> > On Wed, 2003-11-05 at 09:56 -0800, Jun Sun wrote:
> > > Hmm, can you be more specific?  Here are all static variables that
> > > matter in physmap.c.  Which ones are you thinking to eliminate?  And in 
> > > what way?  (Assuming you do not mean I just drop "static" modifier...)
> > 
> > I mean mymtd, in particular. 
> > 
> 
> Can you explain how to eliminate that?
> 
> All mapping drivers keep a static pointer to remember the mtd info
> it discovers so that it can free it later.  Are you suggesting
> we get rid of the exit function and we don't free it?
> 

(This replies to the IRC discussion David and I had:

<jun> around?  I am really confued by your comment of eliminating "mymtd" variable.  Can you elaborate?
<jun> either we get rid of the exit cleanup function, or somehow we can retrieve this pointer without resorting to the static variable..
<jun> either way the solution is not obvious to me.
<dwmw2> get rid of the exit cleanup function, let the caller do that

)

David,

If I understand you correctly, you essentially want to make
physmap_set_map() do what init_physmap() does, and have 
physmap_unset_map() do what cleanup_physmap() does, right?  That 
would also explain your desire of having

	mtd = physmap_set_map(....)
	...
	physmap_unset_map(mtd)

Well, unfortunately that does _not_ work because run-time configuration
should run in the board setup code which is too early for what 
init_physmap() is doing (for example, such as ioremap() because trap_init()
has not run yet).

In order for the whole thing to work, the most obivous solution is 
to have three steps :

. during board setup time, call run-time configure routine, which remember
  arguments in local static variables
. during do_initcalls() time, we do physmap_init() like it is doing right
  now,
. during kernel exit time, we clean it up.

Does that make sense?  Do you have any more objections to the current patch
(take 3)?

Jun

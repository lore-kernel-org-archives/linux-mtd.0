Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACiss-00024G-57
	for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2003 18:04:26 +0100
Date: Thu, 23 Oct 2003 10:03:04 -0700
From: Jun Sun <jsun@mvista.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
   linux-mtd@lists.infradead.org
Message-ID: <20031023100304.B1070@mvista.com>
References: <20031022182558.U19834@mvista.com>
	<20031023153307.GA11669@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031023153307.GA11669@wohnheim.fh-wedel.de>;
	from joern@wohnheim.fh-wedel.de on Thu, Oct 23, 2003 at 05:33:07PM +0200
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 23, 2003 at 05:33:07PM +0200, Jörn Engel wrote:
> On Wed, 22 October 2003 18:25:58 -0700, Jun Sun wrote:
> > 
> > While looking at drvers/mtd/maps directories, it becomes
> > obvious to me that many files are derived from physmap.c,
> > in order to add partition support or add their own
> > set_vpp() pointer, etc..
> > 
> > Such a need can be easily satisfied by extending physmap.c
> > a little.
> > 
> > In this patch, I like to introduce phsmap_add_partition()
> > function, which allows boards to add flash partitions
> > at run-time.  (Note that you can still override this
> > hardcoded partition by using kernel command line)
> > 
> > In the patch I also showed how a board can make use of this
> > extension.  Hopefully we can get rid of lots of files under 
> > the maps directory. :)
> 
> For most people, you saved source code size and wasted binary size.
> The very same people are far more concerned about binary size. :)
>

Ahh, note that I turned a couple of functions and data into
__init kind.  That should make space-conservative people happy.
 
> I've tried to clean this up before and failed, but maybe you can do a
> better job.  Good luck!
>

What was the main objection?  I can list quite a few benefits:

1. remove _lots_ of duplicated mapping files, which also means
   a cleaner CONFIG_xxx space and a simpler Makefile.
2. the board-specific partition setup is now done in arch/<xxx>/<board>/setup.c
   which means when a board is deleted, its flash support is automatically
   removed.  (Not so with current arrangement)
3. futher _common_ improvement is possible.  For example, for most MIPS boards
   we don't need ioremap to access the flash area - CPU has a fixed uncached
   mapping to physical space.  Now we can just modify one file and benefts
   about almost 20 boards.

Jun

Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEzWJ-0008A4-Fd
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 23:14:31 +0000
Date: Wed, 29 Oct 2003 15:13:15 -0800
From: Jun Sun <jsun@mvista.com>
To: Cam Mayor <cmayor@iders.ca>
Message-ID: <20031029151315.E6588@mvista.com>
References: <20031022182558.U19834@mvista.com>
	<1067426006.15551.1546.camel@hades.cambridge.redhat.com>
	<20031029104546.K30683@mvista.com> <03102916572705.02584@kilauea.iders.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03102916572705.02584@kilauea.iders.ca>;
	from cmayor@iders.ca on Wed, Oct 29, 2003 at 04:57:27PM -0600
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 29, 2003 at 04:57:27PM -0600, Cam Mayor wrote:
> On Wednesday 29 October 2003 12:45, Jun Sun wrote:
> > On Wed, Oct 29, 2003 at 11:13:26AM +0000, David Woodhouse wrote:
> > >
> > > That's nicer. Why multiple physmap_add_partition() calls rather than
> > > just a single array passed to physmap_set_map() though?
> >
> > Hmm, currently partition only matters when CONFIG_MTD_PARTITIONS
> > is enabled.  I assume this mean sometimes people want to use
> > physmap without partitions.  True?
> 
> Yes.  We have a product that partitions physmap (from the kernel command 
> line), but also uses the unpartitioned physmap base device. 
> 
> ie. physmap on /dev/mtd0
>     physmap partitions on /dev/mtd1, /dev/mtd2, etc.   sometimes none.
> 

Thanks for the data point.  

My original comment is really a question to David: do we really
want "partition" to be an argument in phsmap_set_map() even when
CONFIG_MTD_PARTITIONS is _not_ configured?

If David does not like multiple add partition calls, we can
easily introduce another interface function:

 	physmap_set_partitions(partitions)

So it seems like we have three possibilities in terms
how a board tells physmap driver about the partitions:

1) lumped in physmap_set_map() (as David suggested)

2) calling adding parition multiple times (as in my original
   proposal)

3) calling adding partitions in one shot with an array.

I don't like 1) because of CONFIG_MTD_PARTITION issue.  But if
David insists, I can modify patch as such.

Jun

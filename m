Received: from mail.broadpark.no ([217.13.4.2])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkeB4-0000OU-Hv
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2004 03:27:43 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1089788931.8822.54.camel@imladris.demon.co.uk>
References: <1089728296.6288.19.camel@famine>
	<1089760454.8822.23.camel@imladris.demon.co.uk>
	<1089786408.7607.4.camel@famine>
	<1089787265.8822.31.camel@imladris.demon.co.uk>
	<1089787869.7607.9.camel@famine>
	<1089788931.8822.54.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <1089790059.7607.18.camel@famine>
Mime-Version: 1.0
Date: Wed, 14 Jul 2004 09:27:40 +0200
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Prune obsolete raw_node_ref's from RAM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-07-14 at 09:08, David Woodhouse wrote:
> On Wed, 2004-07-14 at 08:51 +0200, Øyvind Harboe wrote:
> > On Wed, 2004-07-14 at 08:41, David Woodhouse wrote:
> > > On Wed, 2004-07-14 at 08:26 +0200, Øyvind Harboe wrote:
> > > > Would all the performance problems go away if the lists were doubly
> > > > linked?
> > > 
> > > Well yes, but since the object of the exercise was to save memory,
> > > doubling the size of the objects in question doesn't really strike me as
> > > being the right way to approach the problem :)
> > 
> > The memory problem I ran into wasn't the size of the un-obsolete nodes,
> > but that they grew with the number of obsolete nodes.
> > 
> > I hate #if's in code as much as the next guy, but JFFS2 spans deeply
> > embedded systems to full-fledged PCs and it is only to be expected that
> > the different profiles have different needs.
> 
> Well, I'm more than happy to do 
> 	#define jffs2_prune_ref_lists(c, ref) do { } while (0)
> in the Linux code and let the implementation we're playing with live in
> eCos code alone. It would be nicer if it were generic though -- that's
> why I'm thinking about making it happen in a periodic pass, rather than
> doing it all on _every_ obsoletion. By doing it every single time, we
> maximise the amount of list-walking required. 
> 
> We could walk the next_in_ino list when we remove a given inode from the
> inode cache, dropping all obsolete nodes from it then in a single pass. 
> 
> And we could walk each eraseblock's list at some other time...

Hmmm... how about a configurable threshold(i.e. a maximum number
obsolete nodes) that triggers a "purge" at the end of
jffs2_mark_node_obsolete()?

A "purge" would be to loop through all the physical nodes and merge
those that can be merged.

For my purposes, I need to make sure that there is a predictable peak
usage of RAM. What precisely that peak usage is, is somewhat less
important.

-- 
Øyvind Harboe
http://www.zylin.com

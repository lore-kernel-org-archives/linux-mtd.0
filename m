Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bkdsr-0000CI-4D
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2004 03:08:53 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
In-Reply-To: <1089787869.7607.9.camel@famine>
References: <1089728296.6288.19.camel@famine>
	<1089760454.8822.23.camel@imladris.demon.co.uk>
	<1089786408.7607.4.camel@famine>
	<1089787265.8822.31.camel@imladris.demon.co.uk>
	<1089787869.7607.9.camel@famine>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1089788931.8822.54.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 14 Jul 2004 08:08:51 +0100
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

On Wed, 2004-07-14 at 08:51 +0200, Øyvind Harboe wrote:
> On Wed, 2004-07-14 at 08:41, David Woodhouse wrote:
> > On Wed, 2004-07-14 at 08:26 +0200, Øyvind Harboe wrote:
> > > Would all the performance problems go away if the lists were doubly
> > > linked?
> > 
> > Well yes, but since the object of the exercise was to save memory,
> > doubling the size of the objects in question doesn't really strike me as
> > being the right way to approach the problem :)
> 
> The memory problem I ran into wasn't the size of the un-obsolete nodes,
> but that they grew with the number of obsolete nodes.
> 
> I hate #if's in code as much as the next guy, but JFFS2 spans deeply
> embedded systems to full-fledged PCs and it is only to be expected that
> the different profiles have different needs.

Well, I'm more than happy to do 
	#define jffs2_prune_ref_lists(c, ref) do { } while (0)
in the Linux code and let the implementation we're playing with live in
eCos code alone. It would be nicer if it were generic though -- that's
why I'm thinking about making it happen in a periodic pass, rather than
doing it all on _every_ obsoletion. By doing it every single time, we
maximise the amount of list-walking required. 

We could walk the next_in_ino list when we remove a given inode from the
inode cache, dropping all obsolete nodes from it then in a single pass. 

And we could walk each eraseblock's list at some other time...



-- 
dwmw2

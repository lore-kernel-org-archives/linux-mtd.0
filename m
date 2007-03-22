Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HUMch-0001db-SA
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 08:42:33 -0400
Subject: Re: Strange automatic GC threshold ?
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1174330410.30079.53.camel@zod.rchland.ibm.com>
References: <1174321009.26465.266.camel@gentoo-jocke.transmode.se>
	<loom.20070319T174627-836@post.gmane.org>
	<1174323834.30079.16.camel@zod.rchland.ibm.com>
	<1174324903.26465.274.camel@gentoo-jocke.transmode.se>
	<1174325714.30079.29.camel@zod.rchland.ibm.com>
	<1174328248.26465.287.camel@gentoo-jocke.transmode.se>
	<1174330410.30079.53.camel@zod.rchland.ibm.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 22 Mar 2007 13:42:23 +0100
Message-Id: <1174567343.26465.303.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: MikeW <mw_phil@yahoo.co.uk>, linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-03-19 at 13:53 -0500, Josh Boyer wrote:
> On Mon, 2007-03-19 at 19:17 +0100, Joakim Tjernlund wrote:
> > > I'd be interested to see how the behavior of GC differs with the
> > > proposed change.  Theoretically, it seems to make sense to allow GC to
> > > make progress and it could help the "oh crap we're out of space" grind
> > > that seems to occur.  My biggest concern would be if it actually made GC
> > > harder to do in the long run as the obsolete nodes could potentially get
> > > more scattered among the eraseblocks.
> > 
> > Can't be worse than current behavior as now the system becomes painfully
> > slow long before it starts GC. Perhaps one need one threshold to start
> > GC due to dirtiness and another one when to stop?
> 

Sorry for the delay, got sucked into a black hole :)

> Well, it can though.  If the obsolete nodes are scattered throughout the
> blocks and moving them doesn't actually make any single eraseblock
> totally obsolete then you've eliminated the effectiveness of GC
> completely.  That problem exists today of course, but I'm concerned it
> could happen with more frequency if we're GCing sooner.  Maybe I'm just
> paranoid.

I hope you are just paranoid :)

I don't mind if the effectivness of GC w.r.t free space is 
somewhat reduced. Some systems(like ours) will die due to slow
FS since some apps thinks something is serioulsy wrong when
they can't communicate with another app since it is stuck in I/O.

If the current GC behaviour is important to many systems I think
we need a config option where one can enable a more agressive
GC mode that tries to keep the FS clean to maintain FS speed.

 Jocke

> 
> The often suggested idea of GCing into a completely separate block than
> the one you're writing into normally might help here.  But I'm not sure
> how feasible that is at this moment.
> 
> josh
> 
> 
> 

Received: from e36.co.us.ibm.com ([32.97.110.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTMzk-0004ja-0S
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 18:54:13 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l2JIre3p008769
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 14:53:40 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l2JIrewp065532
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 12:53:40 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l2JIreaw007061
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 12:53:40 -0600
Subject: Re: Strange automatic GC threshold ?
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1174328248.26465.287.camel@gentoo-jocke.transmode.se>
References: <1174321009.26465.266.camel@gentoo-jocke.transmode.se>
	<loom.20070319T174627-836@post.gmane.org>
	<1174323834.30079.16.camel@zod.rchland.ibm.com>
	<1174324903.26465.274.camel@gentoo-jocke.transmode.se>
	<1174325714.30079.29.camel@zod.rchland.ibm.com>
	<1174328248.26465.287.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Mon, 19 Mar 2007 13:53:30 -0500
Message-Id: <1174330410.30079.53.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MikeW <mw_phil@yahoo.co.uk>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-03-19 at 19:17 +0100, Joakim Tjernlund wrote:
> > I'd be interested to see how the behavior of GC differs with the
> > proposed change.  Theoretically, it seems to make sense to allow GC to
> > make progress and it could help the "oh crap we're out of space" grind
> > that seems to occur.  My biggest concern would be if it actually made GC
> > harder to do in the long run as the obsolete nodes could potentially get
> > more scattered among the eraseblocks.
> 
> Can't be worse than current behavior as now the system becomes painfully
> slow long before it starts GC. Perhaps one need one threshold to start
> GC due to dirtiness and another one when to stop?

Well, it can though.  If the obsolete nodes are scattered throughout the
blocks and moving them doesn't actually make any single eraseblock
totally obsolete then you've eliminated the effectiveness of GC
completely.  That problem exists today of course, but I'm concerned it
could happen with more frequency if we're GCing sooner.  Maybe I'm just
paranoid.

The often suggested idea of GCing into a completely separate block than
the one you're writing into normally might help here.  But I'm not sure
how feasible that is at this moment.

josh

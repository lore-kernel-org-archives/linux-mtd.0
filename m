Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTNB0-0006Fv-EE
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 15:05:53 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HTNAp-0008KF-Ft
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 20:05:39 +0100
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 20:05:39 +0100
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 20:05:39 +0100
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: Strange automatic GC threshold ?
Date: Mon, 19 Mar 2007 19:04:56 +0000 (UTC)
Message-ID: <loom.20070319T200056-695@post.gmane.org>
References: <1174321009.26465.266.camel@gentoo-jocke.transmode.se>
	<loom.20070319T174627-836@post.gmane.org>
	<1174323834.30079.16.camel@zod.rchland.ibm.com>
	<1174324903.26465.274.camel@gentoo-jocke.transmode.se>
	<1174325714.30079.29.camel@zod.rchland.ibm.com>
	<1174328248.26465.287.camel@gentoo-jocke.transmode.se>
	<1174330410.30079.53.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer <jwboyer <at> linux.vnet.ibm.com> writes:

> 
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
> Well, it can though.  If the obsolete nodes are scattered throughout the
> blocks and moving them doesn't actually make any single eraseblock
> totally obsolete then you've eliminated the effectiveness of GC
> completely.  That problem exists today of course, but I'm concerned it
> could happen with more frequency if we're GCing sooner.  Maybe I'm just
> paranoid.
> 
> The often suggested idea of GCing into a completely separate block than
> the one you're writing into normally might help here.  But I'm not sure
> how feasible that is at this moment.
> 
> josh

Unfortunately, subjects like GC are notoriously easy to "improve" - only
to discover that the "improvement" either doesn't help, or makes things worse
or very bad in some situations.

For this, some kind of algorithm test by simulation would be a good idea.

In this way, many different scenarios can be "left to run" over many different
cases to compare performances and any delinquent behaviour.

Regards,
MikeW

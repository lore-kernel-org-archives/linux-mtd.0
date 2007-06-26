Received: from e36.co.us.ibm.com ([32.97.110.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I3D63-0007ub-L7
	for linux-mtd@lists.infradead.org; Tue, 26 Jun 2007 16:36:52 +0100
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l5QFaTqp008973
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2007 11:36:29 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l5QFaQB6044894
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2007 09:36:26 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l5QFaPCO032556
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2007 09:36:25 -0600
Subject: Re: [PATCH][update] jffs2_gcd_mtd3, Stopping kernel threads timed out
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Uli Luckas <u.luckas@road.de>
In-Reply-To: <200706261639.49486.u.luckas@road.de>
References: <200706141509.50621.u.luckas@road.de>
	<200706261506.28737.u.luckas@road.de>
	<1182863977.19501.4.camel@weaponx.rchland.ibm.com>
	<200706261639.49486.u.luckas@road.de>
Content-Type: text/plain
Date: Tue, 26 Jun 2007 10:36:24 -0500
Message-Id: <1182872184.19501.15.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-06-26 at 16:39 +0200, Uli Luckas wrote:
> On Tuesday, 26. June 2007, Josh Boyer wrote:
> > On Tue, 2007-06-26 at 15:06 +0200, Uli Luckas wrote:
> > > On Tuesday, 19. June 2007, Uli Luckas wrote:
> > > > Hi,
> > > > is there anything in the way of apllying this patch?
> > >
> > > Please, can someone tell me what it takes to get a jffs2 bug fix into the
> > > kernel? Or even reviewed? This patch should even get into 2.6.22. Am I
> > > doing something wrong here?
> >
> > You aren't doing anything wrong.  David is away on business.
> >
> does that mean, we won't get any fixes applied, before David is back? And does 
> anyone know, when he will be back?

Basically, yes.  He's the one with the permissions to commit to the mtd
git tree.

> > The one thing I would hesitate with about your patch is that you've now
> > broken the existing behavior of the thread in regards to SIGHUP.  You
> > used to be able to send the threads a SIGHUP and it would do a single
> > pass.  With your patch, it won't do that unless the thresholds are
> > right.  Being able to send SIGHUP to force a GC pass is a pretty useful
> > thing for debugging, etc.
> >
> thanks Josh, alot for reviewing the patch. Following your advise, I force GC 
> now, if SIGHUP was received.
> The patch still introduces a change in sematics though for all other signals 
> (except SIGKILL). But I feel, the new behavior is more what one would expect. 
> In case, the old behavior is desired, it is simple enough to set force_gc in 
> the coresponding branches.

Your updated patch looks good to me.  Will need a Signed-off-by: line
though.

josh

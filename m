Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTLlf-00029Y-WC
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 17:35:37 +0000
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l2JHZO9H015822
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 13:35:24 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l2JHZO2d068954
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 11:35:24 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l2JHZOoZ004223
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 11:35:24 -0600
Subject: Re: Strange automatic GC threshold ?
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1174324903.26465.274.camel@gentoo-jocke.transmode.se>
References: <1174321009.26465.266.camel@gentoo-jocke.transmode.se>
	<loom.20070319T174627-836@post.gmane.org>
	<1174323834.30079.16.camel@zod.rchland.ibm.com>
	<1174324903.26465.274.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Mon, 19 Mar 2007 12:35:14 -0500
Message-Id: <1174325714.30079.29.camel@zod.rchland.ibm.com>
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

On Mon, 2007-03-19 at 18:21 +0100, Joakim Tjernlund wrote:
> On Mon, 2007-03-19 at 12:03 -0500, Josh Boyer wrote:
> > On Mon, 2007-03-19 at 16:49 +0000, MikeW wrote:
> > > Joakim Tjernlund <joakim.tjernlund <at> transmode.se> writes:
> > > 
> > > > 
> > > > In jffs2_thread_should_wake() there is this test to
> > > > wake up GC thread:
> > > > 
> > > > 	if (c->nr_free_blocks + c->nr_erasing_blocks < c->resv_blocks_gctrigger &&
> > > > 			(dirty > c->nospc_dirty_size))
> > > > 
> > > > The && in the above if means that no matter how dirty the FS is, it wont
> > > > trigger GC until there is a very low count of free blocks as well(24 in my
> > > > case out of 1003). I wonder if that && should be a || instead?
> > > > 
> 
> How about thinking about the orginal question that made me send this
> mail in the first place before sending any patches? :)

I have been.  That response just takes more time. :)  (And the patches
comment was about adding more (), not to you specifically.)

I'd be interested to see how the behavior of GC differs with the
proposed change.  Theoretically, it seems to make sense to allow GC to
make progress and it could help the "oh crap we're out of space" grind
that seems to occur.  My biggest concern would be if it actually made GC
harder to do in the long run as the obsolete nodes could potentially get
more scattered among the eraseblocks.

Do you (or anyone else) have a setup where you could test the change
with varying cases of write frequency and usage?

josh

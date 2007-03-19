Received: from e33.co.us.ibm.com ([32.97.110.151])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTLHQ-0000nt-9u
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 17:04:21 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e33.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l2JH44cn010302
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 13:04:04 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l2JH44ch067828
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 11:04:04 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l2JH44mN007153
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 11:04:04 -0600
Subject: Re: Strange automatic GC threshold ?
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: MikeW <mw_phil@yahoo.co.uk>
In-Reply-To: <loom.20070319T174627-836@post.gmane.org>
References: <1174321009.26465.266.camel@gentoo-jocke.transmode.se>
	<loom.20070319T174627-836@post.gmane.org>
Content-Type: text/plain
Date: Mon, 19 Mar 2007 12:03:54 -0500
Message-Id: <1174323834.30079.16.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-03-19 at 16:49 +0000, MikeW wrote:
> Joakim Tjernlund <joakim.tjernlund <at> transmode.se> writes:
> 
> > 
> > In jffs2_thread_should_wake() there is this test to
> > wake up GC thread:
> > 
> > 	if (c->nr_free_blocks + c->nr_erasing_blocks < c->resv_blocks_gctrigger &&
> > 			(dirty > c->nospc_dirty_size))
> > 
> > The && in the above if means that no matter how dirty the FS is, it wont
> > trigger GC until there is a very low count of free blocks as well(24 in my
> > case out of 1003). I wonder if that && should be a || instead?
> > 
> >  Jocke
> 
> In the interests of clarity and robustness to edits, there should
> be (  ) around the comparison subexpression at any rate.

Patches welcome :)

josh

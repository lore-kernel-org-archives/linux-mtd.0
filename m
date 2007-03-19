Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTL3W-0003t2-Vq
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 12:50:02 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HTL3I-00089z-4m
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 17:49:44 +0100
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 17:49:44 +0100
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 17:49:44 +0100
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: Strange automatic GC threshold ?
Date: Mon, 19 Mar 2007 16:49:24 +0000 (UTC)
Message-ID: <loom.20070319T174627-836@post.gmane.org>
References: <1174321009.26465.266.camel@gentoo-jocke.transmode.se>
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

Joakim Tjernlund <joakim.tjernlund <at> transmode.se> writes:

> 
> In jffs2_thread_should_wake() there is this test to
> wake up GC thread:
> 
> 	if (c->nr_free_blocks + c->nr_erasing_blocks < c->resv_blocks_gctrigger &&
> 			(dirty > c->nospc_dirty_size))
> 
> The && in the above if means that no matter how dirty the FS is, it wont
> trigger GC until there is a very low count of free blocks as well(24 in my
> case out of 1003). I wonder if that && should be a || instead?
> 
>  Jocke

In the interests of clarity and robustness to edits, there should
be (  ) around the comparison subexpression at any rate.

Regards,
MikeW

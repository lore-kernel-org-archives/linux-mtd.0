Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JswL2-0008G6-Rw
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 08:46:25 +0000
Date: Mon, 5 May 2008 18:46:17 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] mkfs.ubifs: support --squash-uids
Message-ID: <20080505084617.GA11042@cloud.net.au>
References: <20080502051655.GA6654@cloud.net.au>
	<1209972672.3645.8.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1209972672.3645.8.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 05, 2008 at 10:31:12AM +0300, Artem Bityutskiy wrote:
> 
> On Fri, 2008-05-02 at 15:16 +1000, Hamish Moffatt wrote:
> > mkfs.jffs2 and genext2fs both have a -U/--squash-uids switch which make
> > them ignore the uid/gids in the directory and set them to 0:0 instead.
> > 
> > Here's my implementation for mkfs.ubifs.
> > 
> > Signed-off-by: Hamish Moffatt <hamish@cloud.net.au>
> > 
> 
> Thanks for the patch. Before applying it, we'd like to know what do you
> expect to happen if -U is used simultaneously with the device table
> (-D). Should we use what device table says for directories which are
> created because they are specified in the device table, or we should use
> 0 anyway? Or we should just prohibit simultaneous usage of -U and -D ?

Good point. mkfs.jffs2 (from my reading of the source code) squashes 
ownership of files read from the specified root directory, but the
ownerships specified in the device table are still used. I think that
makes sense, because you can always specify 0:0 in the device table if
that's what you need.

However it's not what is implemented by my patch :-) Would you like me
to fix it up and resubmit, or will you? I applied the squashing at the
lowest level without realizing the effect on the device table.

thanks,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

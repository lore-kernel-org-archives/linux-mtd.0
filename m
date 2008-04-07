Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JijfE-0007VB-OM
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 05:13:05 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1JijfD-0008AG-Aa
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 00:13:03 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1Jijf9-0000zp-3I
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 15:12:59 +1000
Date: Mon, 7 Apr 2008 15:12:59 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: Re: choosing a file system to use on NAND/UBI
Message-ID: <20080407051259.GA3584@cloud.net.au>
References: <20080328010403.GB23610@cloud.net.au>
	<1206686024.3856.57.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1206686024.3856.57.camel@sauron>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 28, 2008 at 08:33:44AM +0200, Artem Bityutskiy wrote:
> On Fri, 2008-03-28 at 12:04 +1100, Hamish Moffatt wrote:
> > I'm developing an embedded product which will have its root file system
> > on NAND. The root will be pre-prepared and installed using
> > flashcp/nandwrite/ubiupdatevol, and usually mounted read-only.
> > Occasionally we might want to mount it read/write for debug purposes.
> Please, tell the size of your flash and whether it SLC or MLC.

Just to finish this old discussion, it's a 512Mb SLC part. ie not very
big. I have tried UBIFS and I am very pleased with it. Performance is
much better than JFFS2, which was slow to mount and slow during early
reads (even when the image was processed with sumtool).

> > Will ubifs on UBI be better? Is it mature enough to use yet?
> UBIFS mounts very quickly. It is very stable. We find minor issues from
> time to time, but they are fixed quickly.

I noticed that the on-chip format just changed (nanoseconds etc). Do you
plan any more incompatible changes? This is the sort of maturity issue I
was worried about.

> > Would I be better choosing LogFS or YAFFS1/2, perhaps without UBI?
> 
> Never used YAFFSx, but it might be worth trying and evaluating. Vs.
> LogFS - last time we tried it - it was too slow. It also did not
> implement wear-levelling and bad block handling.
> 
> If you try to evaluate them - I would be interested to know about your
> experience.

I could not get a pre-generated YAFFS2 image to mount successfully, and
a call for assistance on the YAFFS mailing list went unanswered.
Although I'm interested in LogFS I don't have enough time to try it
thoroughly.

thanks,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

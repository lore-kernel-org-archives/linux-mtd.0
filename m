Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jf26Y-0001qp-Mj
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 00:05:58 +0000
Date: Fri, 28 Mar 2008 11:05:51 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: corrupted ubi after reboot while busy
Message-ID: <20080328000551.GA23610@cloud.net.au>
References: <20080327070541.GA10446@cloud.net.au>
	<1206625178.3856.38.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1206625178.3856.38.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 27, 2008 at 03:39:38PM +0200, Artem Bityutskiy wrote:
> On Thu, 2008-03-27 at 18:05 +1100, Hamish Moffatt wrote:
> > I'm trying UBI for the first time; I have the kernel 2.6.24 with UBI
> > backported from 2.6.25-rc7.
> > 
> > I created a static volume (on NAND) and wrote a JFFS2 image to it with 
> > ubiupdatevol. mount succeeded, but the image was built wrongly so the
> > jffs2 garbage collector thread to fix it.
> Strange, the volume should be read-only, what could the GC thread do to
> it?

That's what I thought.

> >  I then rebooted the system
> > while this was running (using a proper reboot, which succeeded).
> > 
> > After rebooting, I can't attach the UBI volume at all:
> > 
> > Jan  1 00:16:34 elaraboot user.err kernel: [  994.310000] UBI error: validate_vid_hdr: inconsistent VID header at PEB 664                         
> > Jan  1 00:16:34 elaraboot user.err kernel: [  994.320000] UBI error: cannot attach mtd7                                                           
> > Jan  1 00:16:34 elaraboot user.err kernel: [  994.320000] UBI error: cannot initialize UBI, error -22 
> 
> Could you please enable UBI debugging (just UBI debugging, not any of
> debugging messages), and try to attach the MTD device again? Then send
> me the UBI output which you may take with dmesg?

I will try. I already erased the device to try something else, but I
will try to reproduce it.


thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

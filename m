Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K1z4J-0002UG-SO
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 07:30:32 +0000
Date: Fri, 30 May 2008 17:30:25 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: UBIFS on-media format changed to version 3
Message-ID: <20080530073025.GB20369@cloud.net.au>
References: <1212047442.31023.64.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1212047442.31023.64.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 29, 2008 at 10:50:42AM +0300, Artem Bityutskiy wrote:
> we have found a bug in UBIFS and the fix changes the on-media format.
> Namely, the direntry hash function changed. We've always assumed it to
> be 29 bits wide, but because of incorrect bitmask it has been only 25
> bits wide.
> 
> Please, update UBIFS and mkfs.ubifs to version 0.7. We have changed
> media format version from 2 to 3 as well. We support compatibility with
> older JFFS2 format (version 2) for now, but we would like to drop the
> support, unless someone really needs this and asks us not to do this. We
> are not in mainline so far, so we probably have luxury of changing
> on-flash format so far.
> 
> I've CCed people who may be using UBIFS and should be aware of the
> change.

Hi Artem,

Thanks for the notification.

What's the impact of the bug? Does it only affect particularly large
volumes or directories with a particularly large number of files or
something else?

As I understand your comments, the new source will currently work with 
existing file systems but you want to drop that ability?

We're just about to deploy devices with 2.6.24 + ubifs from GIT a month
or two back, though we're probably not going to upgrade the kernel on
existing devices in the future anyway.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

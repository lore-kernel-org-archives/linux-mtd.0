Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JttoL-0001Ov-OZ
	for linux-mtd@lists.infradead.org; Thu, 08 May 2008 00:16:39 +0000
Date: Thu, 8 May 2008 10:16:29 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] mkfs.ubifs: support --squash-uids
Message-ID: <20080508001628.GA5014@cloud.net.au>
References: <20080502051655.GA6654@cloud.net.au>
	<1209972672.3645.8.camel@sauron>
	<20080505084617.GA11042@cloud.net.au>
	<1210055916.3645.21.camel@sauron>
	<20080506094642.GB23685@cloud.net.au>
	<1210069392.3645.34.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1210069392.3645.34.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 06, 2008 at 01:23:12PM +0300, Artem Bityutskiy wrote:
> Fundamentally, mkfs.ubifs has to know FS size because UBIFS maintains
> and stores per-LEB information (like amount of dirty and free space in
> each LEB) in so-called LPT area on the media. So obviously, the size of
> this area depends on the total amount of LEBs, i.e. on the volume size.

OK (and thanks for adding this information to the web site also.)

In my case I am preparing images with mkfs.ubifs, and mounting them
read-only on my embedded target. In that case, could the max LEB count
be calculated automatically to fit the files and the LPT area?

I added support for ubifs images into buildroot. The user must configure
their LEB size, max I/O size, and max LEB count as these are all
required for mkfs.ubifs. Is there a formula to calculate an approximate 
max LEB count from the volume size and LEB size? I will need to improve
the documentation for these parameters shown to the buildroot users
(although probably I'm the only one using the ubifs target so far!).

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

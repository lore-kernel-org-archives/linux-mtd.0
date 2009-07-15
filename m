Received: from mx.tdiedrich.de ([2001:6f8:1132::2])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MR9xT-00036n-Ba
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 19:16:03 +0000
Date: Wed, 15 Jul 2009 21:15:59 +0200
From: Tobias Diedrich <ranma+kernel@tdiedrich.de>
To: David Brownell <david-b@pacbell.net>
Subject: Re: Kernel Oops when trying to suspend with ubifs mounted on
	block2mtd mtd device on 2.3.31-rc2
Message-ID: <20090715191558.GA18203@yamamaya.is-a-geek.org>
References: <20090715122051.GA1439@yamamaya.is-a-geek.org>
	<4A5DD233.7090702@nokia.com>
	<200907151055.17959.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200907151055.17959.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	David.Woodhouse@intel.com, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Brownell wrote:
> On Wednesday 15 July 2009, Adrian Hunter wrote:
> > Looks like it might be related to MTD driver model updates.
> 
> Not the sysfs support ... more likely the patch adding cls_suspend()
> support, 15bce40cb3133bcc07d548013df97e4653d363c1, is goofed.  Maybe
> it's invoking suspend on the wrong device node...

Yes, that is the culprit.
AFAICS it uses the 'dev_to_mtd()' macro to get the mtd, but calls it
on itself instead of the child classes, so the resulting mtd device
pointer is bogus.

With some debug printks I get:

[...]
PM: Freed 0 kbytes in 0.06 seconds[...]
mtd_cls_suspend(f68e3180, 1)
dev->class->name = 'mtd'
callig mtd->suspend() [f68e3148]
BUG: unable to handle kernel paging request[...]
[...]

-- 
Tobias						PGP: http://9ac7e0bc.uguu.de

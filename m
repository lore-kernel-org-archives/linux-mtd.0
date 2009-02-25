Received: from [202.230.225.126] (helo=topsms.toshiba-tops.co.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lc8ci-0002MU-Dp
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 01:31:49 +0000
Date: Wed, 25 Feb 2009 10:31:40 +0900 (JST)
Message-Id: <20090225.103140.155095402.nemoto@toshiba-tops.co.jp>
To: s.hauer@pengutronix.de
Subject: Re: [PATCH] physmap: Fix leak of memory returned by
	parse_mtd_partitions
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20090224152958.GN21900@pengutronix.de>
References: <20090224133505.GJ21900@pengutronix.de>
	<20090224.233600.27954115.anemo@mba.ocn.ne.jp>
	<20090224152958.GN21900@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 24 Feb 2009 16:29:58 +0100, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > The physmap patch has another bug and fixes are on the way mainline:
> > 
> > http://git.infradead.org/mtd-2.6.git?a=commit;h=e480814f138cd5d78a8efe397756ba6b6518fdb6
> > 
> > But this seems not enough, as you wrote.  If multiple mtd have same
> > mtd-id, bad things can happen.  And more seriously, if I load physmap
> > driver _again_ after unload, cmdlinepart will return a freed pointer
> > on the second time.
> > 
> > Hmm, little memory leak is less serious than crash.  Now I start
> > thinking reverting the commit 176bf2e0 will be best for 2.6.29
> > release.
> 
> Even when reverting the commit the same problem still exists because the
> array then gets freed in physmap_flash_remove(). This won't hurt me
> though because I never use mtd drivers as modules.

If the commit reverted, kfree() in physmap_flash_remove never be
called due to another bug (info->nr_parts is not set properly).  But
unloading the physmap module will lead crash anyway since master mtd
device will be freed without deleting slave mtd devices if cmdlinepart
was used.

So I think either reverting the commit or applying the above fix in
mtd-2.6 git tree can fix regression from 2.6.28.  Both work well
unless unloading the physmap module after booting with mtdparts=
option.

---
Atsushi Nemoto

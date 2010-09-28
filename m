Received: from mgw-sa02.nokia.com ([147.243.1.48])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P0VUb-0006Dv-FG
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 08:24:54 +0000
Date: Tue, 28 Sep 2010 11:24:46 +0300
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: Cannot rmmod after call to add_mtd_blktrans_dev
Message-ID: <20100928082446.GA999@angel.research.nokia.com>
References: <20100908122039.GA25005@angel.research.nokia.com>
	<1283957007.7935.0.camel@maxim-laptop>
	<1284851862.28101.2.camel@maxim-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1284851862.28101.2.camel@maxim-laptop>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 19, 2010 at 01:17:42AM +0200, ext Maxim Levitsky wrote:
> Please test the patch I have just posted on linux-mtd.

I tried the 1/3 patch sent on Sep 18 23:12 on top of 2.6.36-rc5.
Had some email problem and to pick the patch from web
archives. It didn't apply cleanly, but the merge conflict seemed
minor.

The patch seems to work. I am able to remove module but now
del_mtd_blktrans_dev(dev) relases my own device structure a bit
too early and have to protect it with extra kref_get() and
release it with blktrans_dev_put(dev).

Jarkko Lavinen

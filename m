Date: Thu, 21 Jun 2007 07:59:20 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Satyam Sharma <satyam.sharma@gmail.com>
Subject: Re: build failure due to ROOT_DEV in mtd module (was Re:
	linux-2.6.22-rc5-g7c8545e build #298 failed ...)
Message-ID: <20070621065920.GA9792@infradead.org>
References: <a781481a0706202352u1efed48fo5a101f8c015638d7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a781481a0706202352u1efed48fo5a101f8c015638d7@mail.gmail.com>
Cc: Tom Spink <tspink@gmail.com>, Toralf F?rster <toralf.foerster@gmx.de>,
	Paolo Giarrusso <blaisorblade@yahoo.it>, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 21, 2007 at 12:22:01PM +0530, Satyam Sharma wrote:
> >> The build seems to fail because of:
> >> ERROR: "ROOT_DEV" [drivers/mtd/maps/nettel.ko] undefined!
> >>
> >> After taking a quick look at the code, I can't immediately see why
> >> this would be, since there is an include for linux/root_dev.h at the
> >> top, there.
> >>
> >> There's only one occurrence of ROOT_DEV (line 425), and after a quick
> >> look at the git history, it seems the include was originally missing,
> >> but was put back in, in commit
> >> 6cc449c7d0292cb9b993f0df84fd3225e3099492.

Please just the reference to ROOT_DEV from this driver.  Just because
someone builds this driver there should be no change in the default root
device.

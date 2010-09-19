Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OxQbv-0004z6-Ee
	for linux-mtd@lists.infradead.org; Sun, 19 Sep 2010 20:35:45 +0000
Received: by bwz19 with SMTP id 19so5630325bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Sep 2010 13:35:40 -0700 (PDT)
Subject: Re: [PATCH 1/3] MTD: blktrans: Final version of hotplug support
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: dedekind1@gmail.com
In-Reply-To: <1284920908.1704.5.camel@brekeke>
References: <1284851558-1154-1-git-send-email-maximlevitsky@gmail.com>
	<1284851558-1154-2-git-send-email-maximlevitsky@gmail.com>
	<1284920908.1704.5.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Sep 2010 22:35:36 +0200
Message-ID: <1284928536.4022.5.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Maciej Rutecki <maciej.rutecki@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-09-19 at 21:28 +0300, Artem Bityutskiy wrote: 
> On Sun, 2010-09-19 at 01:12 +0200, Maxim Levitsky wrote:
> > Or at least this patch claims it to be so...
> > 
> > Now it once again possible to remove mtdtrans and mtd drivers even
> > if underlying mtd device is mounted.
> > This time in addition to code review, I also made the code
> > pass some torture tests like module reload in  a loop + read in a loop +
> > card insert/removal all at same time.
> > 
> > The blktrans_open/blktrans_release don't take the mtd table lock because:
> > 
> > While device is added (that includes execution of add_mtd_blktrans_dev)
> > the lock is already taken
> > 
> > Now suppose the device will never be removed. In this case even if we have changes
> > in mtd table, the entry that we need will stay exactly the same. (Note that we don't
> > look at table at all, just following private pointer of block device).
> > 
> > Now suppose that someone tries to remove the mtd device.
> > This will be propagated to trans driver which _ought_ to call del_mtd_blktrans_dev
> > which will take the per device lock, release the mtd device and set trans->mtd = NULL.
> > From this point on, following opens won't even be able to know anything about that mtd device
> > (which at that point is likely not to exist)
> > Also the same care is taken not to trip over NULL mtd pointer in blktrans_dev_release.
> > 
> > In addition to that I moved the blk_cleanup_queue back to del_mtd_blktrans_dev
> > because I now know that is ok, and I removed the BUG from deregister_mtd_blktrans
> > because the current mtd trans driver can still have 'dead' users upon removal.
> > These won't touch it again, so its safe to remove the module.
> > 
> > Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
> 
> Too many changes in one patch - please, split it on smaller patches. Do
> one change per patch not many changes in one. This patch is not really
> reviewable. And since you are fixing regression, make sure you have
> first N _minimal_ patches which just fix the regression and nothing
> else, and to the rest in the following M patches.
Artem, this patch, really fixes just one regression (especially V2).
The move of blk_cleanup_queue back if you insist, I can skip, its just
one line.

I really can't split this.


Note that in V2 I restricted again the unloading of the trans module if
its block device is in use.
If I were to allow that, it  turns out that removal will work just fine,
but if module is loaded again, it could register a block device with
same major/minor as the block device that still exists, and that causes
havoc.



Best regards,
Maxim Levitsky

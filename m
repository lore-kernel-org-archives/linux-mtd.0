Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USywo-0002BI-QI
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 00:13:04 +0000
Date: Thu, 18 Apr 2013 21:13:00 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
Message-ID: <20130419001259.GA2259@localhost>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304181630.58886.vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201304181630.58886.vapier@gentoo.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, richard.weinberger@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org, Tim Bird <tim.bird@am.sony.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

On Thu, Apr 18, 2013 at 04:30:55PM -0400, Mike Frysinger wrote:
> On Wednesday 12 December 2012 07:21:52 Ezequiel Garcia wrote:
> > Block device emulation on top of ubi volumes with read/write support.
> > Block devices are created upon user request through the
> > 'vol' module parameter.
> > 
> > For instance,
> > 
> >   $ modprobe ubiblock vol=/dev/ubi0_0
> >   $ modprobe ubiblock vol=0,rootfs
> 
> i played around with ubiblk before finding this newer version.  one thing i 
> think this is missing that ubiblk had is an ioctl interface for adding new 
> block volumes on the fly.  you can attach ubi volumes at runtime, but the only 
> way to attach ubiblocks is by loading/unloading the module, or by rebooting 
> and tweaking the command line.
> 
> imo, that support needs to be re-added.  it'd be great if we could do it via 
> the existing /dev/ubi_ctrl knob, but maybe that'll only work if ubi+ubiblock 
> are built into the kernel, or if ubiblock is merged with ubi ?
>

Yes, such support should be re-added. I'll think about it.

> > Read/write access is expected to work fairly well because the
> > request queue at block elevator orders block transfers to achieve
> > space-locality.
> > In other words, it's expected that reads and writes gets ordered
> > to address the same LEB.
> 
> i wonder if the write support should be put behind a CONFIG option.  
> personally, the write support is kind of neat and semi-useful for development, 
> but i don't plan on shipping anything on that :).  i just want read-only 
> support to load an ext2 fs on top of UBI.
> 

Mmm... good input. Maybe putting write support behind a CONFIG and
showing a big fat warning when the module loads will do?
(something to prevent regular users from using this carelessly).

May I ask why would you want to put ext2 fs? Have you considered f2fs?

> > +static int ubiblock_open(struct block_device *bdev, fmode_t mode)
> > +{
> > +	struct ubiblock *dev = bdev->bd_disk->private_data;
> > +	int ubi_mode = UBI_READONLY;
> > +	int ret;
> > +
> > +	mutex_lock(&dev->vol_mutex);
> > +	if (dev->refcnt > 0) {
> > +		/*
> > +		 * The volume is already opened,
> > +		 * just increase the reference counter
> > +		 */
> > +		dev->refcnt++;
> > +		mutex_unlock(&dev->vol_mutex);
> > +		return 0;
> > +	}
> > +
> > +	if (mode & FMODE_WRITE)
> > +		ubi_mode = UBI_READWRITE;
> 
> hmm, you handle ro vs rw here ...
> 
> > +	ret = ubiblock_alloc_cache(&dev->read_cache, dev->leb_size);
> > +	if (ret)
> > +		goto out_free;
> > +
> > +	ret = ubiblock_alloc_cache(&dev->write_cache, dev->leb_size);
> > +	if (ret)
> > +		goto out_free_cache;
> 
> ... but you always alloc a write cache even when it's mounted ro ?

Good catch.

I'll see if I can cook a v3 one of these days.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com

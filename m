Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPh4R-0002FR-N5
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 23:03:37 +0000
Date: Fri, 27 Sep 2013 20:02:33 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH v3 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20130927230012.GA19960@localhost>
References: <1368887515-10536-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1368887515-10536-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306202155.37322.vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201306202155.37322.vapier@gentoo.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, richard.weinberger@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org, Tim Bird <tim.bird@am.sony.com>,
 piergiorgio.beruto@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(I'm Ccing Piergiorgio who also seems interested in using this).

Hi Mike,

Sorry for not replying earlier.

On Thu, Jun 20, 2013 at 09:55:35PM -0400, Mike Frysinger wrote:
> On Saturday 18 May 2013 10:31:54 Ezequiel Garcia wrote:
> 
> hmm, i've only written a gendisk driver once, and that was many years ago (and 
> it was pretty shitty, so let's pretend i didn't at all).  so i won't be able 
> to say too much on that front.
> 

No problem. This feedback is great.

> > --- a/drivers/mtd/ubi/Kconfig
> > +++ b/drivers/mtd/ubi/Kconfig
> > 
> > +config MTD_UBI_BLOCK
> > +	bool "Block device access to UBI volumes"
> > +	default n
> > +	help
> > +	   Since UBI already takes care of eraseblock wear leveling
> > +	   and bad block handling, it's possible to implement a block
> > +	   device on top of it and therefore mount regular filesystems
> > +	   (i.e. not flash-oriented, as ext4).
> > +
> > +	   In other words, this is a software flash translation layer.
> > +
> > +	   If in doubt, say "N".
> 
> might be useful to mention that this is built into the main ubi module, and 
> you can use `ubiblkvol` to manage volumes at runtime.
> 

Okey, I'll think about a better description.

> > --- /dev/null
> > +++ b/drivers/mtd/ubi/block.c
> >
> > + * Copyright (c) 2012 Ezequiel Garcia
> > + * Copyright (c) 2011 Free Electrons
> 
> it's now 2013 :)
> 

Fixed.

> > +/* Maximum length of the 'block=' parameter */
> > +#define UBIBLOCK_PARAM_LEN 64
> 
> not entirely true, but maybe doesn't matter.  max length is 63 as it includes 
> \0 in the 64 byte count ;).
> 

Fixed.

> > +static int __init ubiblock_set_param(const char *val,
> > +				     const struct kernel_param *kp)
> > +{
> > +	int len, i, ret;
> 
> len should be size_t (since you assign strnlen() to it and that returns a 
> size_t)
> 

Fixed.

> > +	if (len == 0) {
> > +		ubi_warn("block: empty 'blk=' parameter - ignored\n");
> 
> i think this should be block= rather than blk=
> 

Fixed.

> > +MODULE_PARM_DESC(block, "Attach block devices to UBI volumes.");
> 
> add a short description to the block= format ?  you had a good snippet in the 
> init func above in one of the comments.
> 

Fixed.

> > +/*
> > + * A bunch of examples worth a thousand words.
> 
> move to the top of the file ?  i personally find it more useful when they live 
> there, but maybe my expectations are off.
> 

Fixed.

> > +static int ubiblock_fill_cache(struct ubiblock *dev, int leb_num,
> > +			       struct ubiblock_cache *cache,
> > +			       struct ubiblock_cache *aux_cache)
> > +{
> > ...
> > +		/*
> > +		 * Maybe it's possible to flip pointers instead of
> > +		 * memcpy'ing, but let's try to keep it simple for now.
> > +		 */
> > +		aux_cache->leb_num = -1;
> > +		aux_cache->state = STATE_EMPTY;
> > +		memcpy(cache->buffer, aux_cache->buffer, dev->leb_size);
> 
> yeah, trying to see if we could eliminate some of these memcpy's would be a 
> nice future enhancement
> 

Yeah, but I rather keep it simple for now.

> > +		/*
> > +		 * If leb is not on write cache, we flush current cached
> 
> usually people say "in cache" rather than "on cache".  this comes up in a few 
> comments in this file.
> 

Fixed.

> > +#else
> > +static int ubiblock_flush(struct ubiblock *dev, bool sync)
> > +{
> > +	return -EPERM;
> > +}
> > +
> > +static int ubiblock_write(struct ubiblock *dev, const char *buffer,
> > +              int pos, int len)
> > +{
> > +	return -EPERM;
> > +}
> > +#endif
> 
> i think you can just do:
> # define ubiblock_flush NULL
> # define ubiblock_write NULL
> 
> then the common layers will do the right thing when it sees these funcs don't 
> exist for this device
> 

Hmm... no, I don't think we can do that. Those functions are used inside
this file, and not passed as callbacks to any 'upper layer'. So, if we
put NULL we'll have to add some nasty 'if (ubiblock_flush)' and I really
prefer to avoid that.

> > +static int ubiblock_read(struct ubiblock *dev, char *buffer,
> > +			 int pos, int len)
> > +{
> > +	int leb, offset, ret;
> > +	int bytes_left = len;
> > +	int to_read = len;
> > +	char *cache_buffer;
> > +
> > +	/* Get leb:offset address to read from */
> > +	leb = pos / dev->leb_size;
> > +	offset = pos % dev->leb_size;
> > +
> > +	while (bytes_left) {
> > +
> > +		/*
> > +		 * We can only read one leb at a time.
> > +		 * Therefore if the read length is larger than
> > +		 * one leb size, we split the operation.
> > +		 */
> > +		if (offset + to_read > dev->leb_size)
> > +			to_read = dev->leb_size - offset;
> > +
> > +		/*
> > +		 * 1) First try on read cache, if not there...
> > +		 * 2) then try on write cache, if not there...
> > +		 * 3) finally load this leb on read_cache
> > +		 *
> > +		 * Note that reading never flushes to disk!
> > +		 */
> > +		if (leb_on_cache(&dev->read_cache, leb)) {
> > +			cache_buffer = dev->read_cache.buffer;
> > +
> > +#ifdef CONFIG_MTD_UBI_BLOCK_WRITE_SUPPORT
> > +		} else if (leb_on_cache(&dev->write_cache, leb)) {
> > +			cache_buffer = dev->write_cache.buffer;
> > +#endif
> > +
> > +		} else {
> > +			/* Leb is not in any cache: fill read_cache */
> > +			ret = ubiblock_fill_cache(dev, leb,
> > +				&dev->read_cache, NULL);
> > +			if (ret)
> > +				return ret;
> > +			cache_buffer = dev->read_cache.buffer;
> > +		}
> 
> i've read this code a few times but haven't been able to convince myself that 
> the coherency is correct.  in the write func, you check the write cache, but 
> not the read cache.  so what happens if you read from say block 0, then write 
> to it, then read from it ?  where does the read cache get synced to the write 
> cache ?  or would this scenario return stale data from the read cache ?
> 

Grr.. good catch. The code is wrong, of course. Which shows how hard it is to
get this two-cache thing right. I guess the correct implementation is to check
the write-cache first when reading.

In that case, it seems the coherency is guaranteed.

On the other side, I'm having second thoughts about this two-cached
implementation, which is based in pure speculation and zero facts.

I think we could simply wipe it out and return to the one-cache
implementation. If anyone wants to support some specific use case where
a two-cache implementation fits (which would mean picking some policy
regarding the cache replacement), then he'll have to convince me with
numbers first :-)

> > +static void ubiblock_do_work(struct work_struct *work)
> > +{
> > +	struct ubiblock *dev =
> > +		container_of(work, struct ubiblock, work);
> > +	struct request_queue *rq = dev->rq;
> > +	struct request *req;
> > +	int res;
> > +
> > +	spin_lock_irq(rq->queue_lock);
> 
> i thought work queues could sleep ?  so you could use a regular mutex here 
> rather than a spinlock ?
> 

Hm.. no. This queue_lock (to protect the queue) is a parameter to
blk_init_queue:

        spin_lock_init(&dev->queue_lock);
        dev->rq = blk_init_queue(ubiblock_request, &dev->queue_lock);

And it's exposed only because we need to access the queue to fetch
an item from it. So the lock is taken while accesing the queue, and
released as soon as that is done.

I've taken that from mtd_blkdevs.c and it seems to be correct.

We have a spinlock to protect the request queue, a mutex to protect
the (per-volume) ubiblock structure and one global mutex to protect
the list of ubiblock structures.

I've squeezed my brain to get the locking scheme right but feel free
to suggest improvements or point flaws.

> > +static int ubiblock_open(struct block_device *bdev, fmode_t mode)
> > +{
> > +	struct ubiblock *dev = bdev->bd_disk->private_data;
> > +	int ubi_mode = UBI_READONLY;
> > +	int ret;
> > +#ifdef CONFIG_MTD_UBI_BLOCK_WRITE_SUPPORT
> > +	const bool allow_write = true;
> > +#else
> > +	const bool allow_write = false;
> > +#endif
> > +
> > +	mutex_lock(&dev->vol_mutex);
> > +	if (dev->refcnt > 0) {
> > +		/*
> > +		 * The volume is already opened,
> > +		 * just increase the reference counter
> > +		 *
> > +		 * If the first user has oppened this as read-only,
> > +		 * we don't allow to open as read-write.
> > +		 * This is the simplest solution. A better one would
> > +		 * be to re-open the volume as writable and allocate
> > +		 * the write-cache.
> > +		 */
> > +		if ((mode & FMODE_WRITE) &&
> > +		    (dev->desc->mode != UBI_READWRITE)) {
> > +			ret = -EBUSY;
> > +			goto out_unlock;
> > +		}
> > +		dev->refcnt++;
> > +		mutex_unlock(&dev->vol_mutex);
> > +		return 0;
> > +	}
> 
> not a big deal, but this could probably just jump to the end (where you have 
> the same finishing code)
> 

Fixed.

> > +	if (allow_write && ubi_mode == UBI_READWRITE) {
> > +		ret = ubiblock_alloc_cache(&dev->write_cache, dev->leb_size);
> > +		if (ret) {
> > +			ubiblock_free_cache(&dev->read_cache);
> > +			goto out_free;
> > +		}
> > +	}
> > ....
> > +static void ubiblock_release(struct gendisk *gd, fmode_t mode)
> > +{
> > +	struct ubiblock *dev = gd->private_data;
> > +
> > +	mutex_lock(&dev->vol_mutex);
> > +
> > +	dev->refcnt--;
> > +	if (dev->refcnt == 0) {
> > +		ubiblock_flush(dev, true);
> > +
> > +		ubiblock_free_cache(&dev->read_cache);
> > +		ubiblock_free_cache(&dev->write_cache);
> 
> hmm, in the open call, you only alloc the write cache when the device gets 
> opened read/write.  what if it gets opened r/o and then closed ?  won't this 
> free barf ?  similarly, if read/write support is compiled out ...
> 

Well, you could put another 'if' here, but I think it will be pure churn.

Null pointers vfree/kfree is completely harmless in the kernel, and
the cache is allocated by kzalloc, so the buffer pointer is guaranteed
to be Null.

> > +	/*
> > +	 * Blocks devices needs to be attached to volumes explicitly
> 
> Blocks -> Block
> 

Fixed.

> > --- a/drivers/mtd/ubi/cdev.c
> > +++ b/drivers/mtd/ubi/cdev.c
> > 
> > +	/* Attach a block device to an UBI volume */
> > +	case UBI_IOCVOLATTBLK:
> > +	{
> > +		struct ubi_volume_info vi;
> > +
> > +		ubi_get_volume_info(desc, &vi);
> > +		err = ubiblock_add(&vi);
> > +		break;
> > +	}
> > +
> > +	/* Dettach a block device from an UBI volume */
> > +	case UBI_IOCVOLDETBLK:
> > +	{
> > +		struct ubi_volume_info vi;
> > +
> > +		ubi_get_volume_info(desc, &vi);
> > +		ubiblock_del(&vi);
> > +		break;
> > +	}
> 
> hmm, this always returns 0.  would be nice if ubiblock_del() returned a value 
> that this could pass back up to userspace.  i managed to confuse myself by 
> running a few times:
> 	# ubiblkvol -d /dev/ubi0_0
> it never issued an error/warning, and returned 0 all the time.  might be 
> problematic if you have code that wants to make sure it has detached all block 
> devices already ...

Fixed.

Thanks for this great feedback, and sorry again for staying
silent for so long.

BTW: Are you still using this? It'd be awesome to have actual users
report on the benefits (such as a lower memory consumption over other
alternatives).
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com

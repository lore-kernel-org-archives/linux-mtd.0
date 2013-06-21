Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UpqZw-000618-Ti
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2013 01:55:57 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 1/1] ubi: Introduce block devices for UBI volumes
Date: Thu, 20 Jun 2013 21:55:35 -0400
References: <1368887515-10536-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1368887515-10536-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1368887515-10536-2-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2010129.U7mRsQHq6d";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201306202155.37322.vapier@gentoo.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
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

--nextPart2010129.U7mRsQHq6d
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 18 May 2013 10:31:54 Ezequiel Garcia wrote:

hmm, i've only written a gendisk driver once, and that was many years ago (=
and=20
it was pretty shitty, so let's pretend i didn't at all).  so i won't be abl=
e=20
to say too much on that front.

> --- a/drivers/mtd/ubi/Kconfig
> +++ b/drivers/mtd/ubi/Kconfig
>=20
> +config MTD_UBI_BLOCK
> +	bool "Block device access to UBI volumes"
> +	default n
> +	help
> +	   Since UBI already takes care of eraseblock wear leveling
> +	   and bad block handling, it's possible to implement a block
> +	   device on top of it and therefore mount regular filesystems
> +	   (i.e. not flash-oriented, as ext4).
> +
> +	   In other words, this is a software flash translation layer.
> +
> +	   If in doubt, say "N".

might be useful to mention that this is built into the main ubi module, and=
=20
you can use `ubiblkvol` to manage volumes at runtime.

> --- /dev/null
> +++ b/drivers/mtd/ubi/block.c
>
> + * Copyright (c) 2012 Ezequiel Garcia
> + * Copyright (c) 2011 Free Electrons

it's now 2013 :)

> +/* Maximum length of the 'block=3D' parameter */
> +#define UBIBLOCK_PARAM_LEN 64

not entirely true, but maybe doesn't matter.  max length is 63 as it includ=
es=20
\0 in the 64 byte count ;).

> +static int __init ubiblock_set_param(const char *val,
> +				     const struct kernel_param *kp)
> +{
> +	int len, i, ret;

len should be size_t (since you assign strnlen() to it and that returns a=20
size_t)

> +	if (len =3D=3D 0) {
> +		ubi_warn("block: empty 'blk=3D' parameter - ignored\n");

i think this should be block=3D rather than blk=3D

> +MODULE_PARM_DESC(block, "Attach block devices to UBI volumes.");

add a short description to the block=3D format ?  you had a good snippet in=
 the=20
init func above in one of the comments.

> +/*
> + * A bunch of examples worth a thousand words.

move to the top of the file ?  i personally find it more useful when they l=
ive=20
there, but maybe my expectations are off.

> +static int ubiblock_fill_cache(struct ubiblock *dev, int leb_num,
> +			       struct ubiblock_cache *cache,
> +			       struct ubiblock_cache *aux_cache)
> +{
> ...
> +		/*
> +		 * Maybe it's possible to flip pointers instead of
> +		 * memcpy'ing, but let's try to keep it simple for now.
> +		 */
> +		aux_cache->leb_num =3D -1;
> +		aux_cache->state =3D STATE_EMPTY;
> +		memcpy(cache->buffer, aux_cache->buffer, dev->leb_size);

yeah, trying to see if we could eliminate some of these memcpy's would be a=
=20
nice future enhancement

> +		/*
> +		 * If leb is not on write cache, we flush current cached

usually people say "in cache" rather than "on cache".  this comes up in a f=
ew=20
comments in this file.

> +#else
> +static int ubiblock_flush(struct ubiblock *dev, bool sync)
> +{
> +	return -EPERM;
> +}
> +
> +static int ubiblock_write(struct ubiblock *dev, const char *buffer,
> +              int pos, int len)
> +{
> +	return -EPERM;
> +}
> +#endif

i think you can just do:
# define ubiblock_flush NULL
# define ubiblock_write NULL

then the common layers will do the right thing when it sees these funcs don=
't=20
exist for this device

> +static int ubiblock_read(struct ubiblock *dev, char *buffer,
> +			 int pos, int len)
> +{
> +	int leb, offset, ret;
> +	int bytes_left =3D len;
> +	int to_read =3D len;
> +	char *cache_buffer;
> +
> +	/* Get leb:offset address to read from */
> +	leb =3D pos / dev->leb_size;
> +	offset =3D pos % dev->leb_size;
> +
> +	while (bytes_left) {
> +
> +		/*
> +		 * We can only read one leb at a time.
> +		 * Therefore if the read length is larger than
> +		 * one leb size, we split the operation.
> +		 */
> +		if (offset + to_read > dev->leb_size)
> +			to_read =3D dev->leb_size - offset;
> +
> +		/*
> +		 * 1) First try on read cache, if not there...
> +		 * 2) then try on write cache, if not there...
> +		 * 3) finally load this leb on read_cache
> +		 *
> +		 * Note that reading never flushes to disk!
> +		 */
> +		if (leb_on_cache(&dev->read_cache, leb)) {
> +			cache_buffer =3D dev->read_cache.buffer;
> +
> +#ifdef CONFIG_MTD_UBI_BLOCK_WRITE_SUPPORT
> +		} else if (leb_on_cache(&dev->write_cache, leb)) {
> +			cache_buffer =3D dev->write_cache.buffer;
> +#endif
> +
> +		} else {
> +			/* Leb is not in any cache: fill read_cache */
> +			ret =3D ubiblock_fill_cache(dev, leb,
> +				&dev->read_cache, NULL);
> +			if (ret)
> +				return ret;
> +			cache_buffer =3D dev->read_cache.buffer;
> +		}

i've read this code a few times but haven't been able to convince myself th=
at=20
the coherency is correct.  in the write func, you check the write cache, bu=
t=20
not the read cache.  so what happens if you read from say block 0, then wri=
te=20
to it, then read from it ?  where does the read cache get synced to the wri=
te=20
cache ?  or would this scenario return stale data from the read cache ?

> +static void ubiblock_do_work(struct work_struct *work)
> +{
> +	struct ubiblock *dev =3D
> +		container_of(work, struct ubiblock, work);
> +	struct request_queue *rq =3D dev->rq;
> +	struct request *req;
> +	int res;
> +
> +	spin_lock_irq(rq->queue_lock);

i thought work queues could sleep ?  so you could use a regular mutex here=
=20
rather than a spinlock ?

> +static int ubiblock_open(struct block_device *bdev, fmode_t mode)
> +{
> +	struct ubiblock *dev =3D bdev->bd_disk->private_data;
> +	int ubi_mode =3D UBI_READONLY;
> +	int ret;
> +#ifdef CONFIG_MTD_UBI_BLOCK_WRITE_SUPPORT
> +	const bool allow_write =3D true;
> +#else
> +	const bool allow_write =3D false;
> +#endif
> +
> +	mutex_lock(&dev->vol_mutex);
> +	if (dev->refcnt > 0) {
> +		/*
> +		 * The volume is already opened,
> +		 * just increase the reference counter
> +		 *
> +		 * If the first user has oppened this as read-only,
> +		 * we don't allow to open as read-write.
> +		 * This is the simplest solution. A better one would
> +		 * be to re-open the volume as writable and allocate
> +		 * the write-cache.
> +		 */
> +		if ((mode & FMODE_WRITE) &&
> +		    (dev->desc->mode !=3D UBI_READWRITE)) {
> +			ret =3D -EBUSY;
> +			goto out_unlock;
> +		}
> +		dev->refcnt++;
> +		mutex_unlock(&dev->vol_mutex);
> +		return 0;
> +	}

not a big deal, but this could probably just jump to the end (where you hav=
e=20
the same finishing code)

> +	if (allow_write && ubi_mode =3D=3D UBI_READWRITE) {
> +		ret =3D ubiblock_alloc_cache(&dev->write_cache, dev->leb_size);
> +		if (ret) {
> +			ubiblock_free_cache(&dev->read_cache);
> +			goto out_free;
> +		}
> +	}
> ....
> +static void ubiblock_release(struct gendisk *gd, fmode_t mode)
> +{
> +	struct ubiblock *dev =3D gd->private_data;
> +
> +	mutex_lock(&dev->vol_mutex);
> +
> +	dev->refcnt--;
> +	if (dev->refcnt =3D=3D 0) {
> +		ubiblock_flush(dev, true);
> +
> +		ubiblock_free_cache(&dev->read_cache);
> +		ubiblock_free_cache(&dev->write_cache);

hmm, in the open call, you only alloc the write cache when the device gets=
=20
opened read/write.  what if it gets opened r/o and then closed ?  won't thi=
s=20
free barf ?  similarly, if read/write support is compiled out ...

> +	/*
> +	 * Blocks devices needs to be attached to volumes explicitly

Blocks -> Block

> --- a/drivers/mtd/ubi/cdev.c
> +++ b/drivers/mtd/ubi/cdev.c
>=20
> +	/* Attach a block device to an UBI volume */
> +	case UBI_IOCVOLATTBLK:
> +	{
> +		struct ubi_volume_info vi;
> +
> +		ubi_get_volume_info(desc, &vi);
> +		err =3D ubiblock_add(&vi);
> +		break;
> +	}
> +
> +	/* Dettach a block device from an UBI volume */
> +	case UBI_IOCVOLDETBLK:
> +	{
> +		struct ubi_volume_info vi;
> +
> +		ubi_get_volume_info(desc, &vi);
> +		ubiblock_del(&vi);
> +		break;
> +	}

hmm, this always returns 0.  would be nice if ubiblock_del() returned a val=
ue=20
that this could pass back up to userspace.  i managed to confuse myself by=
=20
running a few times:
	# ubiblkvol -d /dev/ubi0_0
it never issued an error/warning, and returned 0 all the time.  might be=20
problematic if you have code that wants to make sure it has detached all bl=
ock=20
devices already ...
=2Dmike

--nextPart2010129.U7mRsQHq6d
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRw7KZAAoJEEFjO5/oN/WBfIwQAM1dUGtM/CeFrv4+HPjVCbs/
8WYCksEYP0ZVggQMZF1NYVMsid9QCOPLhUb+3omJEeW4ArQoSpNSWk1wRXGsp0pY
r+hYNbJfmlErc7EW8DTWiUGIevW/FFgMhCgVTIcwIhieBZSnEnAC+k+JznKS+k3J
XFTdaeUHk8oDCoT2HinyYYQguoYsqWipFrKUo+bWXW0Fu16hGBshIFrbx6u8VyLU
Vk4oR3LFY7lKj0+a58rDLAMNjuCNX49+Wbklf6IRbpS5cNZAEVbzRX+KLhpLR6Vh
4mrN/LHIhwj8YQV79k8J1WWMKsm194FEXBhC3zAB4exluSukB3RvxcKANOBM/C3p
WdMiusrLoZHd+ZgOzQtcQs85exEIsa9vTh+5YHF+SHP1evQryE4Xr281OumjeAOr
EpozTxOYKVowiYoYKOgKVicKcqhDJJHlRq13uH8P+7d/99NfaErikhzYUps+YGA4
SeckbuxQM2VW1X04Pek2KQ2bGS7CKp0iz+RYmkyeJukF3Ne2vytlLUle8lZk2cfs
X4cBeg3/KA0WL8tz9EOttKfF56dSOiVOZ0PkZjbnwvhKkVdPn17w3/30PSBvWywU
VGsq1satMW5dsjcpfrQFvdw5i3zzTv4OzRLxyJosSje6H0NMOwaAGSkn+TqsPU18
SjYMNgSlQYBYHGT6ds91
=vpNw
-----END PGP SIGNATURE-----

--nextPart2010129.U7mRsQHq6d--

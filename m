Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USvRs-0007dl-1h
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2013 20:28:52 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
Date: Thu, 18 Apr 2013 16:30:55 -0400
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2170190.S8d07hf7jp";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201304181630.58886.vapier@gentoo.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, richard.weinberger@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Ezequiel Garcia <ezequiel@free-electrons.com>, Tim Bird <tim.bird@am.sony.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart2170190.S8d07hf7jp
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday 12 December 2012 07:21:52 Ezequiel Garcia wrote:
> Block device emulation on top of ubi volumes with read/write support.
> Block devices are created upon user request through the
> 'vol' module parameter.
>=20
> For instance,
>=20
>   $ modprobe ubiblock vol=3D/dev/ubi0_0
>   $ modprobe ubiblock vol=3D0,rootfs

i played around with ubiblk before finding this newer version.  one thing i=
=20
think this is missing that ubiblk had is an ioctl interface for adding new=
=20
block volumes on the fly.  you can attach ubi volumes at runtime, but the o=
nly=20
way to attach ubiblocks is by loading/unloading the module, or by rebooting=
=20
and tweaking the command line.

imo, that support needs to be re-added.  it'd be great if we could do it vi=
a=20
the existing /dev/ubi_ctrl knob, but maybe that'll only work if ubi+ubibloc=
k=20
are built into the kernel, or if ubiblock is merged with ubi ?

> Read/write access is expected to work fairly well because the
> request queue at block elevator orders block transfers to achieve
> space-locality.
> In other words, it's expected that reads and writes gets ordered
> to address the same LEB.

i wonder if the write support should be put behind a CONFIG option. =20
personally, the write support is kind of neat and semi-useful for developme=
nt,=20
but i don't plan on shipping anything on that :).  i just want read-only=20
support to load an ext2 fs on top of UBI.

> +static int ubiblock_open(struct block_device *bdev, fmode_t mode)
> +{
> +	struct ubiblock *dev =3D bdev->bd_disk->private_data;
> +	int ubi_mode =3D UBI_READONLY;
> +	int ret;
> +
> +	mutex_lock(&dev->vol_mutex);
> +	if (dev->refcnt > 0) {
> +		/*
> +		 * The volume is already opened,
> +		 * just increase the reference counter
> +		 */
> +		dev->refcnt++;
> +		mutex_unlock(&dev->vol_mutex);
> +		return 0;
> +	}
> +
> +	if (mode & FMODE_WRITE)
> +		ubi_mode =3D UBI_READWRITE;

hmm, you handle ro vs rw here ...

> +	ret =3D ubiblock_alloc_cache(&dev->read_cache, dev->leb_size);
> +	if (ret)
> +		goto out_free;
> +
> +	ret =3D ubiblock_alloc_cache(&dev->write_cache, dev->leb_size);
> +	if (ret)
> +		goto out_free_cache;

=2E.. but you always alloc a write cache even when it's mounted ro ?
=2Dmike

--nextPart2170190.S8d07hf7jp
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRcFgCAAoJEEFjO5/oN/WBPC0QAL0eG4uV+fRXDNAmNdFx8nOG
6L8wqDsOXHYlaZeZY4Co/U+7olKx96qN8P8PFH+yDrbR0uyA7KTDsj5kYBVmwrU5
Io9Pg78ZxdnzkeiZz7U+LQvYXFVJW4619/9m+2CPNoVcrswouhRUAJrep8tRD61Z
acYJSowN2Odvh3MqSJ1rlKLmPsGyM7LSOlxbglaI469vVs+2RxrEm6L/b31KqQL7
GPqJIkpD1Fs+pgnmQ2N41S3JLYOIcblo6XlFKAxn8DSHkRsfLeYWeX9ah4YwSQpN
An7yBHmQ8ny2fobPvNWzZqgjTIdRx2eSbkkrClJWN3h93l0fbfZrCnfEqgogLXQk
WdiYQlpZuGxapljdXCHbrnu6BFxcywFA4jZI43I9m3yutCnrEbSSTneidqJf6HlS
aResmmbIMdvG3jDLVhYHywarvcsRmbgy8Fm6kq32bf8ppsaM5P/l9NK8vfajfEnb
GIaZcb7tTS17hZ4MYIS9rmYMVsk5kZLoVEKytcKxf0Zn96qmqCUorQBsGRdFFvcN
ZmEOW3ej+MkliJfJjIlB4gxHtK+cTN4Dxf9ROFwM5BQKKSobPKgG4aYqkP0DsFBM
oCWZ0PHO6doyEF31lwP+wN74YSaGW24EA3dGEioQpAk7plhOKJBNrJQxobuAiHDL
N+ZJxal9sGhEnuApkg+i
=deCo
-----END PGP SIGNATURE-----

--nextPart2170190.S8d07hf7jp--

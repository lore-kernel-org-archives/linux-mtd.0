Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RdiJk-0002SY-06
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2011 13:04:16 +0000
Received: by ggnp4 with SMTP id p4so7760222ggn.36
 for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2011 05:04:15 -0800 (PST)
Message-ID: <1324559149.10300.93.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] MTD: pass driver methods through partition wrappers
 on unpartitioned devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Thu, 22 Dec 2011 15:05:49 +0200
In-Reply-To: <1324406536-18250-2-git-send-email-mikedunn@newsguy.com>
References: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>
 <1324406536-18250-2-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Q/sskNQlPH72XMCTg0xV"
Mime-Version: 1.0
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vimal Singh <vimal.newwork@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Q/sskNQlPH72XMCTg0xV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-12-20 at 10:42 -0800, Mike Dunn wrote:
> +		/*
> +		 * For unpartitioned devices, create a single "partition" that
> +		 * spans the entire device, so that driver methods go through
> +		 * partition wrappers in all cases.
> +		 */
> +		struct mtd_partition single_part =3D {
> +			.name =3D (char *)mtd->name,
> +			.offset =3D 0,
> +			.size =3D mtd->size,
> +			.mask_flags =3D 0,
> +			.ecclayout =3D mtd->ecclayout,
> +		};
> +		err =3D add_mtd_partitions(mtd, &single_part, 1);
>  	}

There is a problem with this approach :-(

Look at the 'mtd_blkpg_ioctl()' function which is used to re-partition
MTD device from user-space. It is a bit strange, but we use block device
for re-partition in order to not invent new ioctls.

This function has this code:

                /* Only master mtd device must be used to add partitions */
                if (mtd_is_partition(mtd))
                        return -EINVAL;

and your patch  will brake re-partitioning.

So I guess we should go back to your first patch where you just change
the ->read() / ->read_oob() interface.

Or:

1. Rework whole MTD interface from ->read()/->write()/etc (pointers to
functions) to mtd_read(mtd, ...)/mtd_write(mtd, ...)/etc.

2. In the new functions you may do the stuff you do at patch 2.

For me the second approach is more plausible.

--=20
Best Regards,
Artem Bityutskiy

--=-Q/sskNQlPH72XMCTg0xV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO8ystAAoJECmIfjd9wqK0xKQQAK2tTPDdJ1Sro/PVSia//5/v
8M/oqsHRufpL010NcmRAsKsyUhocWlKm2VzF+SnutAn2ZS2miidEeFKyKMhkSot4
FuTK1vbUtj1BBYtG60K/36QJgNeTT/NvlRv/3Q8Od+x+FQLixsZVJNgVGT/ztZzV
B9Nbytn4a7CHP062SJcuWp3r5HKkMi/Y94v01pfFu7x6l1GzWhzzCcLRymXvLR0X
0y2qFTDYMgJ9DSD2uKnUb7o/U0Gt9rv8gQ717Njt1ONl6AUWST75AE2WV1f1JmNN
K97JtPGgDLu8BYeRaxtb0gZDPvp7iC2MYrQVFno/XwUm69qhYqQDFmg86Dkmso5l
tfBUarjBglI19pzyUPZ9J8zc69aDkkreQ/IMVT//bsFuN10izzwC3IF8/8vHI+uW
PRGIYCvSrZ3JU+yQwXeaaZSXBrgLMBQwuKX8fiVNDMgYakS+npiV8R/ZfVFP28R+
9NmNjjitx37h6pmDWRWGvfdknjKD/rCe3yrwGwH4XCr5LoXbZ2Kc0ZP6qEY7bnG5
oK51MgrFlwVkhuyXM6dEyib78sL0X2HLbSbSXM6EDZFkByHLgggkCtkTRJaHaTK2
YBOU+EbsrUTepEh5E5RrW+xUF5bwiF4dU7rKEVsKcMKNTKKaZbgEnu6GFkkBY27D
8GQ/YbxJ2YaKh36zkX2V
=ngQV
-----END PGP SIGNATURE-----

--=-Q/sskNQlPH72XMCTg0xV--

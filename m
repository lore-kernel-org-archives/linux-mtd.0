Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RbwrP-0001Yx-78
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 16:11:44 +0000
Received: by iadk27 with SMTP id k27so5621226iad.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 08:11:41 -0800 (PST)
Message-ID: <1324138390.4240.69.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [MTD] NAND : SFTL (Simple Flash Transration Layer)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: katsuki.uwatoko@toshiba.co.jp
Date: Sat, 17 Dec 2011 18:13:10 +0200
In-Reply-To: <4CCCBA2E6B78F3katsuki.uwatoko@toshiba.co.jp>
References: <4CCCBA2E6B78F3katsuki.uwatoko@toshiba.co.jp>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-C1wZCqCghE96AV3cX9Bp"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-C1wZCqCghE96AV3cX9Bp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-12-14 at 07:03 +0000, katsuki.uwatoko@toshiba.co.jp wrote:
> This is a new Flash Translation Layer for NAND Flash on mtd.
>=20
> mtd: SFTL (Simple Flash Translation Layer)
>=20
> Introduction
> ------------
>=20
> SFTL is a flash translation layer for NAND Flash on mtd_blkdevs
> interface.  This is mainly-useful for read-oriented use (ex. a storage
> for a boot image) because this provides simple wear-leveling and
> scrubbing. The features are:
>=20
>  * sftl provides wear-leveling (not static wear-leveling) and scrubbing.
>  * sftl has one erase block size cache.
>  * sftl uses 6 bytes in OOB for a logical address, status, version.

This is really bad idea nowadays, because modern flashes tend to use
whole OOB for bad block handling. Or they may disallow writing to OOB
because they cannot handle a write to OOB after a write to the page.

On top of this, modern flashes are so crappy that they have bit-flips
all the time, and need strong ECCs (like 8-bit or more). But the OOB
area is not covered by ECC, so your data in OOB will constantly become
corrupted.

I really suggest to re-design this.

>  * the erase block scan at init is fast.
>  * a unit of read/write from/to MTD is an erase block.
>=20
> Module parameters
> -----------------
>=20
>   mtd=3D		MTD devices to attach.
> 		Parameter format: mtd=3D<num>
> 		Multiple mtd parameters may be specified.
>=20
>   rb=3D		percents of reserved eraseblocks for bad blocks.
> 		This parameter must be from 1 to 90. The default is 2.
> 		The number of reserved blocks must be more than 5.

Could you please present your work in more details. Could you please
describe:

1. Which problems this solves.
2. What are the practical use-cases.
3. What are alternative existing solutions, why they are not good enough
   and why this solution is better.
4. Explain why it is not possible to teach UBI to solve these tasks.
   E.g., introduce a special "simplified" UBI mode with 1-1 mapping / no
   erase counters / whatever. In other words, provide good grounds for
   adding a separate module.

Your really need to spend some time and prepare your strategy for
selling this to upstream.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-C1wZCqCghE96AV3cX9Bp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO7L+WAAoJECmIfjd9wqK0GCAQAJwlViY79YGqjOk02NJKDYB+
PGgjpILHsf/hl5UZedCYKaNyQ1ILHdibPWI6ZWeZer7QHILgsseNF1+FEnoL4Eq4
huTf0qQ+n5oIkYVB6elldSQzrjQhXOgg2KQ3TheV7Jb3mem3SEIp3c8fKuN2El2L
DfCc15NBEcj385/Ca5i2N6K6pm0r4s4nFGwQsL5+8xpwNZeLc6MrXfPQupdKY+qj
TDz8VSLVDINtPaw7lqAjbwX+xH1Wz8D+Ty1Okp1LVRh9vWYbGvl8esyjoQsS7F1D
tiaocfrqBsOWGysb2hM+sYfs0lr2lffp5v6aAVOQ055c5nXmtvsaSSx/5C4ht1o1
T1mor9e0AlO1OeB2kk8DfB4nh+iK+LiGw+jb3jK5k/8MGbLJkglXb8bUXOaZkPiR
mpFPknJzKoqo7AkPLcXeRmIGo3tyaOI9q4YfwpclB1yu2tNYtfbV/FHzC/KaA/BV
/Hk2sZiifRuBByquK2T7G59bbuuPZ/xrKnmhvUysvOuvvtmPwdc2ZAt21pZ1uQSl
VonJesmyoSi/5D/0+EQw8I35nmTWARnhuU2QJsXUoyvDSJsE5ZzhvZBXnYuLp3jy
0EEB2fz0wqqqh1p9Epb0OYEoEqHZ5yQ3eTXDJD93d6chd+mn9nwERzr3mz+H9MxH
lZSLKQ/zPjk7VRqbbj7A
=obs2
-----END PGP SIGNATURE-----

--=-C1wZCqCghE96AV3cX9Bp--

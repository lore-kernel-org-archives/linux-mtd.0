Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RwwNY-0005ii-GP
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 13:55:41 +0000
Received: by dakp5 with SMTP id p5so5507118dak.36
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2012 05:55:39 -0800 (PST)
Message-ID: <1329141475.22240.151.camel@sauron.fi.intel.com>
Subject: Re: Updating UBIFS rootfilesystem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthias Fuchs <matthias.fuchs@esd.eu>
Date: Mon, 13 Feb 2012 15:57:55 +0200
In-Reply-To: <4F326E27.7020407@esd.eu>
References: <4F326E27.7020407@esd.eu>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wq5cJjvzN2zBhoAbsWq7"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wq5cJjvzN2zBhoAbsWq7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-08 at 13:44 +0100, Matthias Fuchs wrote:
> Hi,
>=20
> is there an elegant way to update an UBIFS rootfilesystem?
>=20
> Let's say I have enough flash space for my actual rootfilesystem
> (rootfs1) and a new version (rootfs2). So while running from rootfs1
> I updated rootfs2 volume with a new rootfilesystem.

I you cannot update a mounted fs - you have to unmount it first. If you
are able to do this, you should be able to ubirename.


--=20
Best Regards,
Artem Bityutskiy

--=-wq5cJjvzN2zBhoAbsWq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPORbjAAoJECmIfjd9wqK0wCgP/iDJYU6xwZG4wbLu72m5ILsR
J1n/cI3bCxhuGK7I2D4b0DQd/llel1bXXc4GqA+hpOb60Gwm4Q0V+kdjub1fUZeh
N1gwfUa5MJCeScdqP/ZvZ8irinTxOVlkBuPBfpg/FEj7+ohUo+u8Upe5FnVEsosp
cJyE/gf0d5wN6090LcVmN2JiiSMgDkU+EtCmvLlZR+DCBgDMiUvJfvnkROtGMdhm
AbPrFAxaZLn0sTDJVoS57z/0DKwR2fGCHPMnF6fZ36YkBWKPYQUnwW1WJeqz+0Mk
Z/9TZQzNwrDsphIBjM50txHApl43j/s/NECNEVJm3KNNIr2DfisJ9JufYAAj6Xdt
MaaAXWaqyCiuLVhhUvdvrGszv+s8gDjR+4icScwiEeFWBVBXH8EUDAzpQCHCHdpl
jEwZ4/TXUkKc29BUq6mK/8l6G97Ktis/X7TZKABWpK9wcnFlgc4zxSfQBUIFSGfF
i6OMyQxAdcjleqhOaFv5FFdR0gbBCPjfmj8qMrFoYFoI7DngPjuDBhWfQ9dD98DA
P6ApaztCgucwD5rbXdpsMS3ndDC79lZpWPwx1BAJch/jc4KrYubmx9DnP91voAp2
zo1nzfsYcspi8e6dEo9aS2sepQqNCmPuqWrrY3z706RQA3qCdlyygkwUk7428Q3d
TVYUjGlbw1EMableNYNx
=nb55
-----END PGP SIGNATURE-----

--=-wq5cJjvzN2zBhoAbsWq7--

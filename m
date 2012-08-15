Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1bdd-00062w-KV
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 11:19:50 +0000
Message-ID: <1345029870.3393.128.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/8] mtd: check for max_bitflips in mtd_read_oob()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 15 Aug 2012 14:24:30 +0300
In-Reply-To: <1340408145-24531-3-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-3-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-B4pBWtlHm6d54xbla+FW"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Mike Dunn <mikedunn@newsguy.com>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-B4pBWtlHm6d54xbla+FW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-22 at 16:35 -0700, Brian Norris wrote:
> mtd_read_oob() has some unexpected similarities to mtd_read(). For
> instance, when ops->datbuf !=3D NULL, nand_base.c might return max_bitfli=
ps;
> however, when ops->datbuf =3D=3D NULL, nand_base's code potentially could
> return -EUCLEAN (no in-tree drivers do this yet). In any case where the
> driver might return max_bitflips, we should translate this into an
> appropriate return code using the bitflip_threshold.
>=20
> Essentially, mtd_read_oob() duplicates the logic from mtd_read().
>=20
> This prevents users of mtd_read_oob() from receiving a positive return
> value (i.e., from max_bitflips) and interpreting it as an unknown error.

Pushed this patch to l2-mtd.git, thanks. I've amended the commentary as
Smulik requested, and also removed "(see above)", because "above" is (a)
unclear, and (b) if it means 'mtd_read()', we'd need to make sure
'mtd_read()' is always above 'mtd_read_oob()'.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-B4pBWtlHm6d54xbla+FW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQK4buAAoJECmIfjd9wqK0u1AP/35MMMvLQQV1NnrpDzZwVxw/
OkChUjN2xi0KtJEDGsZEjhWLZEGwOq7+qQ7s7Rcy9MXIstk0Ww13FsJwO4SJI9H7
MsofRuQONDzqylkcSdR6neOwmac5mCyQhA+Uw9UoqFsHWKi9zYgQlqO2KMbMm2j3
QHs/6dk49wOrop4dKIzx2bXYR/NsGXfNO3mje02sw1plcy9WK4WC5wAlvlFfMkB4
sLg+gyHnLcCw+Ox2RCGwSfYlj1nFYSxxAn4HFZmHSng6UCUFO1s2NwPBsHri28P3
+Gbmn3k2/OpqOs04MZbvp383SkZW4G3mHha4HDnMAZ3+zP6ZnReSscxQ0iSfKK2O
qvMfz5qqFen9QSdim+E8g9894ZI2iMPIQtdgHeoQoUwRhgvnZ/urBi5pwXT9inRv
hZl1AyyK3OOvzmVqZJ/thciQ5StW9C0cSWAw39uUnszUMPr8FBTrCwabYzPVNpuy
nCuXS1W+0IDXA3y/lvVw4zFuudhd2kOpyHTFYNrWmXpnhuFemHTT8aYOpQb10lAk
bFJx2cZ8TwHWW/pWp2LliBNdtf4iT+Si3FH6Lpud54xbC8HKx2W79Wb4QQhf8f9H
HToBJ7Gcz/yP7xZRPIR+1+Nf/9P5C/YPyVUJCJ49VrwvwXuI/+R1dIuwOVp3K4qR
myT7wFyxm5BCUZsQMGNZ
=bK73
-----END PGP SIGNATURE-----

--=-B4pBWtlHm6d54xbla+FW--

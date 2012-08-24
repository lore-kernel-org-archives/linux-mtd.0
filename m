Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4sEw-00072w-0y
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 11:39:50 +0000
Message-ID: <1345808678.2848.290.camel@sauron.fi.intel.com>
Subject: Re: [YAFFS] bad block management policy
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Barada <peter.barada@gmail.com>
Date: Fri, 24 Aug 2012 14:44:38 +0300
In-Reply-To: <5023C82B.3000007@gmail.com>
References: <CAFV5biDrgbhJ=_FyPd8YrNsnOUpSrCu-vhsq2GfNsbZ9M2F6Rg@mail.gmail.com>
 <5023C82B.3000007@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-FLqxXtFJRa0YVxpYbYDL"
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


--=-FLqxXtFJRa0YVxpYbYDL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-09 at 10:24 -0400, Peter Barada wrote:
> You could modify YAFFS to ignore -EUCLEAN returns from MTD which will
> prevent YAFFS from marking blocks bad prematurely, but then there is no
> way to predict when a block is about to wear out and return
> uncorrectable errors (-EBADMSG).

We recently improved this area and now you also can set the bitflip
threshold in the MTD so that MTD won't return -EUCLEAN unless the amount
of bits flipped is larger than the threshold. The idea is that UBI
scrubs eraseblocks (moves data to different ones) in case of bitflips.
But 1-bit flips happen so often on some devices, that it is wiser to
ignore those. So now the driver can set the level on which MTD will
start returning -EUCLEAN. Below that flip level, it will return 0.

So this also means that if you set the threshold =3D ECC strength, you
should never even get -EUCLEAN. Not sure it is good idea, but a
possibility as well.

--=20
Best Regards,
Artem Bityutskiy

--=-FLqxXtFJRa0YVxpYbYDL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN2kmAAoJECmIfjd9wqK0CDUQAJpEfSO1JTh9ESCGsZ97w0Fl
YxvJjY3LUfMGGOUNsJiXXAAlsZi1KiJvJNiGgQ5LcwsMX/BEzFM/VIBjkw7V80cn
deIY7d5V15TW933/fl3+fMKjassOxPglBFJy3XdOCjnvXjiDsbWuUFegus2Fu6eN
AiuVgosr0cdc3Heahh9d5ZcP5nX+S02T9g3reMtOMD+oE+wAbpA1ahlfo7dVwo1+
qdwp5IQry2mktbfFn/ZxeVo1tEPEJ30q6P4r3+S2HThjm6pdFsI4u+lgUWw6I3Df
s7ArI6QCoCfgNV6ODTJuIziqc73lCBowfY/bsEbBEKLAUrA7WbJwqVotHafNlX4e
PGaOKU0aqujmolp9DycP/JpKplsYrAcSnzpbsx8uCwHmtkuIm0KaJ8iOfzwG5uaU
ykUIuP7HLV/g7K9AlE04XoU+h/stKQhBY/gJHqtSe6Cs2F9PLEF3Q4CRDl4CtRFD
CEEqc6h6VjaXq5GRqslv+EmsrlJWG6Fywayig8FOo0lzDZEDQ9QanjolwDzrmyko
0f3rQVeIVmjj594BtFoVgLEPNAuQD55is6DFgxGpsxtIiHmVxEioPZ8URlQ6fOdv
B2hUr5Ep1SmbXQBENQG20ADUWo/mP7/Dns+CgpNdgt2ae2WutqsaK4kQnMfxL3Fj
AKk5wt4YMeS84xdCL84R
=z0kf
-----END PGP SIGNATURE-----

--=-FLqxXtFJRa0YVxpYbYDL--

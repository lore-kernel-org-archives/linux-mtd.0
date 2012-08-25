Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5E7y-0006Kl-Hp
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 11:02:07 +0000
Received: by bkcji2 with SMTP id ji2so848634bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 04:02:03 -0700 (PDT)
Message-ID: <1345892510.1815.0.camel@kyv>
Subject: Re: [PATCH] MTD: fix kernel-doc warning in include/linux/mtd/nand.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <rdunlap@xenotime.net>
Date: Sat, 25 Aug 2012 14:01:50 +0300
In-Reply-To: <5030363F.3010505@xenotime.net>
References: <5030363F.3010505@xenotime.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-z6vH2Oi4UIEW4PAzAXq4"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-z6vH2Oi4UIEW4PAzAXq4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-08-18 at 17:41 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
>=20
> Fix kernel-doc warning in <linux/mtd/nand.h>:
>=20
> Warning(include/linux/mtd/nand.h:659): No description found for parameter=
 'read_byte'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-z6vH2Oi4UIEW4PAzAXq4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQOLCeAAoJECmIfjd9wqK0ZgkQAJEU6SQH+2aSu3MekXjfHWUc
cv0X4D6wrKvULB1UlpqsSSTf/pAX90Xy30TNqrZFUQGq+epqm/wlgdDCUWekUTc5
/FDxVxg9WGtiInU+5whdcbPeu7lO0ksyugZqt3xBMwEOicZaY6WTb8ADcRWVxYPm
QJDmDTbCEqpdj4eG39cSwCIFd9X6G55hjDWgNTjFSEOqd9+tY6v/MuitoihUqKdZ
fHi/Lsl1DmVaLVBynFtHmOGe19mSBPaljCZag+G6UCrIa2I2v4kjNuPwngG3Xvvv
90+2Uuzzmow5uZFXPGtI8iQzefX148VzewUWUXVBlsmRDfVfkQ6tAlLBFwwxxDxi
RBcYwlT342aBGX+iC9e6NJ/3hQAdb32jexVZg3FEggDjXnMYRzmoYZDb3o7UOdib
0oe7NiRNGoGYoH+lbsRUaUdMvN1CFP4Ft4cgNBoaxsfEgio74OCAsxFCFu/yTKGF
OJYt+YsMmWEtj79/sVM+EP03nFtyIRK3ngy9aom0xqDl4V4X2sHqmgMLo7OyGAiU
F9R7eNzNLGjMri400Q/9hg20hYHkZWyKHqQQ7/1frBP+Sw5HVwVc13L7iIU3jDcy
b1OIUq6u3BkXJu617mnPL/UQm1wiqwz+WXDygdnjTyn0dC/9zZIC3ecDMtPvFUpv
zb22EzHdGKLQiBnPYYHa
=Bwao
-----END PGP SIGNATURE-----

--=-z6vH2Oi4UIEW4PAzAXq4--

Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjWeW-0000tf-Vh
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 14:22:01 +0000
Message-ID: <1340720760.3119.142.camel@sauron.fi.intel.com>
Subject: Re: UBIFS: unlink failure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 26 Jun 2012 17:26:00 +0300
In-Reply-To: <332997dc8907401d45f417c18fd2aace@radon2.swed.at>
References: <332997dc8907401d45f417c18fd2aace@radon2.swed.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-8OA8I2Xpxc2y7foHVlOO"
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-8OA8I2Xpxc2y7foHVlOO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-06-12 at 23:56 +0200, Richard Weinberger wrote:
>         dd if=3D/dev/urandom of=3D/mnt/x bs=3D1M count=3D1
>         dd if=3D/dev/urandom of=3D/mnt/x bs=3D1M count=3D2
>         dd if=3D/dev/urandom of=3D/mnt/x bs=3D1M count=3D10
>         dd if=3D/dev/urandom of=3D/mnt/x bs=3D1M count=3D30
>         rm x

rm /mnt/x, not rm x. Then it works.

:-)

--=20
Best Regards,
Artem Bityutskiy

--=-8OA8I2Xpxc2y7foHVlOO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6cZ4AAoJECmIfjd9wqK0fvYQANAXwTnO6oK3a8BUdRqtp0k4
uLHNsc2VghGNYkaJOU3/lfK1r520d6uxwlZ97CD9lbCdktHf70vEAFyzU+s1tVy1
eqzpVlCC4OUjZAP5AuBYSnJv84t0n+O+52gsllppHmU99LoOKTRqMru8Xyohju81
9CNBhmiTz98phSfS44URkPgVAMpHVpIm6DCzoVmMJ38XPlaACM2oJgZT7do7O+h5
Q9PTO60nN47QEY8/Kf8bRnvkN8+wBCYzaqrlinMFYK4KrDvqnexAccNMkF5ScL9P
tdpF4G6ILSu/6G7NR6wdNlsI3eOLwKLVkBTx60rdvxIimgQPlftU+0keLV2YgLig
rpMBpJMTRFUpTw1NWJtEWsm6nK8i7gbU2tW6WKBKOfc2lIjdJyrtaReWjJzLOc/f
5aMfa4XMihb6A+wCejHsiPNT/2Sa545x2A9bqF4G+WbNXWeC403Fc10zsy/kSrX4
U6L2YbR/cZ7/tcJomS66h8bIUIlKvYfwTGwcptNmPbM5BReNJi3uEZlyc7Jfxk0b
AIUQCDFVNZ08sekd+03XFLPbIXdiNuMjMevFW9yFYj8qXte/FmBRB+g2kSy581Zr
k8ZTJw/lwcgWBUIqxg5+lmgHa66QO3MImj3isiLoTHV5Hb0HN2QuEUkJU+JEmDFK
LG8qWK8dbI+VsltsPnM5
=RBW/
-----END PGP SIGNATURE-----

--=-8OA8I2Xpxc2y7foHVlOO--

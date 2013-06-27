Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Us8rl-0003rp-Hx
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2013 09:51:50 +0000
Message-ID: <51CC0B15.8080804@pengutronix.de>
Date: Thu, 27 Jun 2013 11:51:17 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: =?UTF-8?B?TWF0cyBLw6Rycm1hbg==?= <Mats.Karrman@tritech.se>
Subject: Re: xattr patches from feb?
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCA20D3@post.tritech.se>,
 <51C837D9.5060007@pengutronix.de>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCA8176@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FCA8176@post.tritech.se>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2WHJOWROBSIEFVSOFPHRN"
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2WHJOWROBSIEFVSOFPHRN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 06/27/2013 11:37 AM, Mats K=C3=A4rrman wrote:
> Thanks for your response! it was held captive by the spam filter for
> a while (my fault) so I didn't notice it. I know about customers and
> changing priorities ;)
>=20
> I havn't received any patches from you yet (also a mail program
> issue?).

Maybe, I'll push the patches to our git server:

http://git.pengutronix.de/?p=3Dmkl/linux.git;a=3Dshortlog;h=3Drefs/heads/=
v3.10/topic/ubifs-xattr

> I have only adopted 1/5 "xattr: protect ui_size and data_len by ui_mute=
x" and 2/5 "fix couple bugs in
> UBIFS extended attribute len" (appended below).
> Those two seem to work well (testing still in progress) and should not =
be affected by the locking issue?

Can you please (re)check if these patches are still the ones on my
server? Can I have your Tested-by? Do they fix your problems? If so, we
should try to get them mainline.

And yes, the first two patches are unrelated to locking problem. The
locking problems are "introduced" by "UBIFS: Add security.* XATTR
support for the UBIFS" I think.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


------enig2WHJOWROBSIEFVSOFPHRN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlHMCx4ACgkQjTAFq1RaXHNEbgCfYVCcUuc4zWBtsWdcQ2tCJjml
d4YAnjnJBdx9zVye/ZGHywUV0GEJKDow
=1vX4
-----END PGP SIGNATURE-----

------enig2WHJOWROBSIEFVSOFPHRN--

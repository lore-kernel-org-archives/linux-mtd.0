Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ur5eS-0007ZJ-BT
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2013 12:13:45 +0000
Message-ID: <51C837D9.5060007@pengutronix.de>
Date: Mon, 24 Jun 2013 14:13:13 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: =?ISO-8859-15?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
Subject: Re: xattr patches from feb?
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCA20D3@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FCA20D3@post.tritech.se>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2JEJXKMICTOVVIDGKBMAH"
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
------enig2JEJXKMICTOVVIDGKBMAH
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

On 06/24/2013 01:15 PM, Mats K=E4rrman wrote:
> Sorry for contacting you directly.

I've added linux-mtd on Cc, maybe there are more people interested in
the patches.

> I have been running integck on UBIFS and found some issues with
> corrupt xattr nodes. I found your post on the linux-mtd mailing list
> but nothing seem to have happened since February.

Yes, unfortunately.

> What has happened since? Were the patches rejected or just ignored?=20
> Do you still believe in them?

Nothing happened, our $CUSTOMER shifted priorities. There is a locking
issue with the patches. Which might be a false positive by the lockdep.

I'll send you my current patches as PM, if someone else is interested,
contact me.

regards,
Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


------enig2JEJXKMICTOVVIDGKBMAH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlHIN98ACgkQjTAFq1RaXHMnJwCZAXUiQln8zYuH7DddM9zsDb0g
z5QAn28WjrX4j9lH9DlbplLAc2n1vR1h
=5LRT
-----END PGP SIGNATURE-----

------enig2JEJXKMICTOVVIDGKBMAH--

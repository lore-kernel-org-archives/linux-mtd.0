Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TK4xi-0000m3-8f
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 10:16:55 +0000
Message-ID: <1349432224.20373.80.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/8] mtd_tests: Refactor duplicate code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vikram Narayanan <vikram186@gmail.com>
Date: Fri, 05 Oct 2012 13:17:04 +0300
In-Reply-To: <506AF9F0.7010903@gmail.com>
References: <506AF985.30104@gmail.com> <506AF9F0.7010903@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-LZ2WgzHrdkPx5P+k264S"
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-LZ2WgzHrdkPx5P+k264S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-02 at 19:58 +0530, Vikram Narayanan wrote:
> Move the duplicate code from all the tests to a common header.
>=20
> Signed-off-by: Vikram Narayanan <vikram186@gmail.com>

Could you please re-structure your patches so that you first do the
'pr_' changes, and then this one. Because 'pr_' are trivial and I can
apply them right away.

This one - I think if you look at UBI and JFFS2 - you may find them also
use the same pattern, and you can actually make this function go to
mtdcore.c and be exported instead.

--=20
Best Regards,
Artem Bityutskiy

--=-LZ2WgzHrdkPx5P+k264S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQbrOgAAoJECmIfjd9wqK0wzYQAKOjo2Rtt+sFNQb7eB5Hcda9
lKwJEHEMDVd2k+gsq3MDcKp28UsKg2DculQX8hjjBKWV6B96msirwOONLPDpk5dt
q3WSoRbMNCk7KkrOzFnW/pTxGIprwGJo7P5ohnUZNq8G3Z54KXIGe7a1tmja5Uga
lIUB7pq6J69yCDF9KU0gRbpTjmwL8evfpCE8zuf6C6oHCaJ67DwZP0tQmNbWQqER
hfMG2P/wtcbt5QPVO0r3C9VLyvWj7VND9s0FH3EyBCBna7FdUIQ2EpCmqT2nHOkJ
Uf9Yh07kgMP1Ud70eGL6oTqrpnvj8Vr/l/val41OI4z9I99IZv4wJhLUC4tQZDI5
l44ILMHJ6JscT4Q4ttSZomUECqxi1RHmRl63ko7+zjNWrqfINSHaJWKnSn7OEvhC
bBxndxvOGdUFeFA/iMIlnlrVhKhDyPhSY8jAHScNRYZhlZEbL5JuwSpRKrCgC4d7
ClCNXtCKozxkUADhwHG8v4WQN+PKf6044Rpt2aBytWJRCfphrC6f5otzPFRs5jZ3
K34Wg7pDwZxKf1MT0Vm5g7ZoEL9wz80ooyIb8Lnt66eYFXlhYBUOe3tWEhsp2PTn
md5Wy2hW8x9hdPMO0621bh/ib9BXyOtJ2awgyizSDgZDPB+SPrdP6sZPSi8S6b1A
+YNqwtpva64JTFxsmNEb
=1BpD
-----END PGP SIGNATURE-----

--=-LZ2WgzHrdkPx5P+k264S--

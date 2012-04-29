Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOYFu-0000sb-8r
 for linux-mtd@lists.infradead.org; Sun, 29 Apr 2012 17:49:54 +0000
Received: by lagy4 with SMTP id y4so1762836lag.36
 for <linux-mtd@lists.infradead.org>; Sun, 29 Apr 2012 10:49:52 -0700 (PDT)
Message-ID: <1335721789.1942.16.camel@koala>
Subject: Re: [PATCH] mtd: nand: Add a NAND_CMD_STATUS when using write
 verification
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bastian Hecht <hechtb@googlemail.com>
Date: Sun, 29 Apr 2012 20:49:49 +0300
In-Reply-To: <1335521971-5046-1-git-send-email-hechtb@gmail.com>
References: <1335521971-5046-1-git-send-email-hechtb@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-1eeT94UW4KLmBgNFljLC"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-1eeT94UW4KLmBgNFljLC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-04-27 at 12:19 +0200, Bastian Hecht wrote:
> To make sure the NAND chip is properly programmed we need a status
> command before each page write. When CONFIG_MTD_NAND_VERIFY_WRITE=3Dy thi=
s
> assumption is broken when writing multiple pages consecutively. This
> patch fixes this.
>=20
> Signed-off-by: Bastian Hecht <hechtb@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-1eeT94UW4KLmBgNFljLC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPnX89AAoJECmIfjd9wqK0i0IP+waCiEWDW0nTygOsjkNxSBQL
PhFC3Us+IY/mDOKDvK1jQKUU81a+NNqlB2lMRJv51+IBSz86I7/SNCPb9Qwwjy5U
JgyRcq7utNcZChzERL2t33pwDgBbAFKTeRSKCZEv3XmG67ybyDCEjH+8jpPuYWML
/hCy7NgmxZynX/SwqTroxiQfjkdbHBiim21b8ILEhR3lQChnu1S9VegtsLAxJwRb
MczkEJz11GFYgrHuAyWjG8ZMYP5yw1M37tkeopLOCTOMkV8ny0KtxMF22XIFV0sB
VU+I5FCsp7kLylOsRxY3h/FeGf0Lh9b+H3YmAzldRhmkwhzo+yGQpKLCD6qKSyEl
PRg26QGL8ge1ZAlbpq0/rk+EyZW8Egie+RmRlbEhSQSk9TWK+iYxjbNyfO7JUGts
tBCrCiHscQVCFMMORcNXGUVKceTzzPKh0G2RX6vE2AxKJwMIfYV5v3RoXpwfrK8G
4H5TMIpLxNknX2669DZLkisSl/pJcImXGoMNNGigudQtQhju1BV15HswrYZkfJay
nlZFRjBXOr88Tdl0R5ZNjTmXTeEWkOOU2xAHxfg56WnR2EvGgelxYq2oBdaWTcru
w30zZ5fXWt/51O5iOzU7ejlWlD/ZHg1xGHsihtmfnhxuGaK8xzY7LmMA/K3Sm+AJ
ROxfArTgylr0F9ZkbV9C
=2nzf
-----END PGP SIGNATURE-----

--=-1eeT94UW4KLmBgNFljLC--

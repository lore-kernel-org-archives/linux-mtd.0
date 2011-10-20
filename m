Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGvcj-00084k-FF
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 16:37:42 +0000
Received: by wyg8 with SMTP id 8so3774287wyg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2011 09:37:39 -0700 (PDT)
Subject: Re: UBIFS recovery fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Date: Thu, 20 Oct 2011 19:37:22 +0300
In-Reply-To: <20111018084222.GC5997@parrot.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<Pine.LNX.4.64.1110181007100.30940@lnxricardw.se.axis.com>
	<20111018084222.GC5997@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-i38hzN76R1n+2Q6I54No"
Message-ID: <1319128648.20953.20.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-i38hzN76R1n+2Q6I54No
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-10-18 at 10:42 +0200, Ivan Djelic wrote:
> Besides unstable bits, lower endurance, higher ecc requirements and NOP1,=
 there
> is a "page pairing" phenomenon which is not handled by UBI/UBIFS AFAIK.
> When you cut power during a page write, you may lose data in another (pai=
red)
> previously programmed page.

Yeah, covered this at the web site and provided an idea what UBIFS could
do to handle that.

--=20
Best Regards,
Artem Bityutskiy

--=-i38hzN76R1n+2Q6I54No
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOoE5CAAoJEJtuLFy+q7feVSIIAIu2fRTkers+quQ+flpUc9KM
fV/9NRk69rtCCc9eGUEzDeLENzJphXxyrn8ZNOUlCnhA1YCTxDBoGEzxLw+DepCP
LtRU/pFhIS3rfY6RAgSlWpS3K60JMaSEbb1cHAmEAVy/wQCWNf2ZdxtDeSc5XVj7
OY4SA8ZXpVSNS4/VUmU549kih9zA+dr3Vvo4fJFxe8wstK+z3ljofq+gURLhI/Px
0un34y1zNPFuPAMPnhBUhy04f6jIE9j5opPGFmA1wKhmNDouNX8VVaSED8VuGlmM
J4YiGJJRSvUI/9vv5sdYhKGvkU+hVVqUHJV60YSx1hacVnXF8B9paxv6ZlXeIW0=
=GKvM
-----END PGP SIGNATURE-----

--=-i38hzN76R1n+2Q6I54No--

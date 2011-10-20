Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGvir-0008HI-5Z
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 16:44:01 +0000
Received: by wyg8 with SMTP id 8so3783724wyg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2011 09:43:59 -0700 (PDT)
Subject: RE: UBIFS recovery fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?Jean-S=E9bastien?= Gagnon <jsgagnon@vizimax.com>, Ivan
	Djelic <ivan.djelic@parrot.com>
Date: Thu, 20 Oct 2011 19:43:41 +0300
In-Reply-To: <225442585F89274EA3A62F88671ECBAC0D33C8EB@prod-svr-1.intranet.str.ca>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<225442585F89274EA3A62F88671ECBAC0D33C8E2@prod-svr-1.intranet.str.ca>
	<20111018145413.GA8576@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8EB@prod-svr-1.intranet.str.ca>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-yaLQcFdBxZOsSv3/JT68"
Message-ID: <1319129028.20953.26.camel@sauron>
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


--=-yaLQcFdBxZOsSv3/JT68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-10-18 at 11:10 -0400, Jean-S=C3=A9bastien Gagnon wrote:
> If you cut power during a page programming operation, you can easily get =
more
> unstable bits than what the manufacturer-specified ecc supports (for inst=
ance,
> 3 unstable bits on a 1bit-ecc device). We experienced this on several dif=
ferent
> devices.
> Having a lot of bitflips (more than what ecc supports) is not the problem=
 here:
> the page was indeed partially programmed, it contains garbage and its con=
tents
> should be discarded.
>=20
> The real problem appears when those faulty bits are unstable: during the =
first
> few read attempts, the page may be successfully read (possibly with ecc
> corrections); and then, a bit later, the page becomes unreadable because =
of too
> many faulty bits.

Right. If you first get a correctable bit-flip, UBI will schedule this
PEB for scrubbing. When the background thread starts scrubbing, it will
read the PEB _again_, and this time it can end up with an uncorrectable
ECC error.

This is probably also a good point: when UBIFS recovers, it should
probably somehow ask UBI to _not_ do scrubbing, to avoid failures at UBI
level if UBI decides to scrub a PEB before UBIFS erase-cycles it.

IOW, the whole stack (not only UBIFS) should make sure the PEBs with
unstable bits are read only once.

--=20
Best Regards,
Artem Bityutskiy

--=-yaLQcFdBxZOsSv3/JT68
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOoE+9AAoJEJtuLFy+q7fesQ4H/2cGdtvjpkURiFi5flrAUKab
DCyCYM/a/FqWp19ywNUKgHO7pnsDi7Le6/GOEJkzm5Fl59ZnSkSDCzDdSy1oRufD
Gf93zoVGv1Fkjp3lIK4F/yfyl6VxdFrbDnus9h+13mEpQUJX2MAua/kZQMY6D/k1
2+tb9EmAdGwiIa8oLrHjBlnc3t+7Cw84Fl2YlNFf3AR18h5OvLeBnm+K2JCBgt5V
L2nJ3lXcu6ItkgNadVe2b04jPiPFa9bKfj2hWlY9oV2qL68cFTnm/rNlKWrnG5/1
yWcz5+QDGGl9M4rcOad345hbjTeHuadU+PqtDQ/GB2+zBqQTXPqqPCpj+N7iln4=
=FjxQ
-----END PGP SIGNATURE-----

--=-yaLQcFdBxZOsSv3/JT68--

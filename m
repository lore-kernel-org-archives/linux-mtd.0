Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Cp7t-00051P-SE
	for <linux-mtd@lists.infradead.org>; Tue, 06 May 2003 00:12:06 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Michael Moedt <xemc@yahoo.com>
In-Reply-To: <20030505224936.32155.qmail@web13908.mail.yahoo.com>
References: <20030505224936.32155.qmail@web13908.mail.yahoo.com>
Message-Id: <1052176326.1172.11789.camel@tubarao>
Mime-Version: 1.0
Date: 05 May 2003 17:12:07 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-mzc2GoFy/+Epw6GWaS3m"
cc: linux-mtd@lists.infradead.org
Subject: Re: Error: Wacky! Unable to decode failure status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mzc2GoFy/+Epw6GWaS3m
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-05-05 at 16:49, Michael Moedt wrote:
> I hope you don't mind my fooling, but I've modified
> the patch yet again,

I often find better ways of doing things if I re-read and edit things
one more time.

> to use if-then blocks instead of
> a switch. (I've heard it's better for removing code at
> compile-time.)

I'm no expert here - I think a good compiler will remove unnecessary
code regardless.  Either way, I'm not so hung up on a switch/case that I
refuse to change.

> Also, it complained to me about CFIDEV_BUSWIDTH_8
> being undeclared, which matches the behavior in
> include/linux/mtd/cfi.h, when the geometry option
> isn't enabled.  I put in something in for this as
> well.  Could you look over my changes?

You'll have to forgive me, but I also changed my original patch.  The
"ones =3D CMD( ones )" is not needed.

BTW, we should just ignore the CFIDEV_BUSWIDTH_8 - it's not used
anywhere that I know of and it has some known issues that make it icky.

Yeah, I can't believe I used the word "icky."

> Thanks again,
>=20
> Mike
>=20
>=20
> Here's that patch:

Thanks.

--=20
Thayne Harbaugh
Linux Networx

--=-mzc2GoFy/+Epw6GWaS3m
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+tu/GfsBPTKE6HMkRAkdyAJ9nLvkBOvmK+L7Tkhrl4qa/NGb+FwCfRn/p
kXlZCuUFUEpQ2WWxHE9I5kA=
=hCn2
-----END PGP SIGNATURE-----

--=-mzc2GoFy/+Epw6GWaS3m--

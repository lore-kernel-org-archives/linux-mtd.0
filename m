Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19D3ZS-0008Mu-U9
	for <linux-mtd@lists.infradead.org>; Tue, 06 May 2003 15:37:31 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1052203806.7532.20.camel@imladris.demon.co.uk>
References: <20030505224936.32155.qmail@web13908.mail.yahoo.com>
	 <1052203806.7532.20.camel@imladris.demon.co.uk>
Message-Id: <1052231851.1172.12864.camel@tubarao>
Mime-Version: 1.0
Date: 06 May 2003 08:37:31 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-fRNVCU3eWUq060fWwbKX"
cc: Michael Moedt <xemc@yahoo.com>
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


--=-fRNVCU3eWUq060fWwbKX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-05-06 at 00:50, David Woodhouse wrote:

> > +#ifdef CFIDEV_BUSWIDTH_8
> > +        __u64 ones =3D 0;
> > +#else
> >          __u32 ones =3D 0;
> > +#endif
>=20
> cfi_word is there to prevent these ifdefs.

Thanks for the hint.

> > +        if ( CFIDEV_BUSWIDTH =3D=3D CFIDEV_BUSWIDTH_1 ) {
>=20
> Use cfi_buswidth_is_1() et al. Then the compiler really will be able to
> optimise them out in the appropriate cases.

Already had this one changed to cfi_buswidth_is_?().

I'll likely commit something today - I'm checking out a problem that has
mysteriously fixed itself 8-/

--=20
Thayne Harbaugh
Linux Networx

--=-fRNVCU3eWUq060fWwbKX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+t8irfsBPTKE6HMkRAkrDAJ9kcE52hwHitE110W4W/lJDpsjr/ACfb2eY
WT1t1QhqOmFd6jlJRskg6pQ=
=6O/V
-----END PGP SIGNATURE-----

--=-fRNVCU3eWUq060fWwbKX--

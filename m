Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CRFtf-00059n-Iv
	for linux-mtd@lists.infradead.org; Mon, 08 Nov 2004 15:13:53 -0500
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Alexander Hoffmann <ahoffmann@sysgo.de>
In-Reply-To: <418F6CA7.6000808@sysgo.de>
References: <418F5E68.3010200@sysgo.de>
	<20041108120624.GE13105@home.fluff.org>  <418F6CA7.6000808@sysgo.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-E4jQgKo2VHpKiUIMC2x3"
Date: Mon, 08 Nov 2004 12:50:53 -0700
Message-Id: <1099943453.10812.16.camel@tubarao>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Subject: Re: Usage of MTD_UADDR_UNNECESSARY broken?
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-E4jQgKo2VHpKiUIMC2x3
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-11-08 at 13:55 +0100, Alexander Hoffmann wrote:
> Ben Dooks wrote:
>=20
> >On Mon, Nov 08, 2004 at 12:54:16PM +0100, Alexander Hoffmann wrote:
> > =20
> >
> >>Hi everyone,
> >>
> >>can anybody please explain me the exact difference between=20
> >>MTD_UADDR_DONT_CARE and MTD_UADDR_UNNECESSARY .
> >>Because if I use MTD_UADDR_UNNECESSARY an not existing field in the=20
> >>unlock_addrs array is beeing referenced
> >>(/drivers/mtd/chips/jedec_probe.c, function cfi_jedec_setup, line 1740)=
:
> >>
> >>/* Mask out address bits which are smaller than the device type */
> >>mask =3D ~(p_cfi->device_type-1);
> >>p_cfi->addr_unlock1 =3D unlock_addrs[uaddr].addr1 & mask;
> >>p_cfi->addr_unlock2 =3D unlock_addrs[uaddr].addr2 & mask;
> >>   =20
> >>
> >
> >hmm, thought this masking had been eliminated in later copies of
> >the mtd code?

Yes, the masking has been eliminated, but someone left the comment in
(doh!).

> Ok, you are right. But this doesn't change the fact that
>=20
> unlock_addrs[uaddr].addr1
>=20
> refers to an nonexisting field in the unlock_addrs array.

I don't see how the code you that you described is being reached.  It
looks like the start of jedec_probe_chip() checks for UNNECESSARY and
returns 0 (although I would expect 1) and so cfi_jedec_setup() should
never be called with UNNECESSARY (even for subsequent chips).

Can you tell me what your chip is and why you think that cfi_jedec_setup
() is called?

--=20
Thayne Harbaugh
Linux Networx

--=-E4jQgKo2VHpKiUIMC2x3
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBj84dsYFQl3A+qS0RAqKnAJ9mfyxYdcLl0Yh57jN7kPKkF8XllwCeKubv
JywgsdpFle4nmb4dMZcS4ok=
=E7j3
-----END PGP SIGNATURE-----

--=-E4jQgKo2VHpKiUIMC2x3--

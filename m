Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NG6b-0001dA-Gd
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jun 2003 19:01:53 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: carolyn.j.smith@exgate.tek.com
In-Reply-To: <212D7E61C1F7D511B9270002A507DE7D24B628@us-bv-m10.bv.tek.com>
References: <212D7E61C1F7D511B9270002A507DE7D24B628@us-bv-m10.bv.tek.com>
Message-Id: <1054663312.1135.111.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 03 Jun 2003 12:01:52 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-H6htnLyQplFNHOdxmlx2"
cc: linux-mtd@lists.infradead.org
Subject: Re: 4 AM29LV800B's in 16-bit mode?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-H6htnLyQplFNHOdxmlx2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-06-02 at 14:32, carolyn.j.smith@exgate.tek.com wrote:
> My board (Wind River's SBC8240) has 4 AM29LV800B chips in 16-bit mode
> (verified that BYTE# is high using a scope) with buswidth 64 bits for a
> total of 4 MB.
>=20
> I am using the "jedec_probe" code. With the buswidth set to 8, the chips =
are
> not detected at all.=20
>
> With the buswidth set to 4, the chips are recognized as long as I modify =
the
> unlock addresses to be MTD_UADDR_DONT_CARE instead of

Obviously not the desired buswidth of 8.

Some chips will ID without the unlock sequence, but the unlock sequence
is still required for other functionality.

> MTD_UADDR_0x0AAA_0x0555 and MTD_UADDR_0x0555_0x02AA but erasing the
> resulting device fails in do_erase_oneblock.=20

Erase fails because the correct unlock addresses are required for
destructive functions (erase/write).

>=20
> Any suggestions?

I think what is happening is that the unlock addresses are not being
intelligently "guessed" by jedec_probe_chip().  I have been slowly
rewriting all of jedec_probe.c as is needed and I have long anticipated
that the unlock addresses seeds are a poor way of dealing with a known
list of flash parts.  I think now is the time that this piece of code is
fixed.

This is what you can do to test my hypothesis:

At the top of jedec_probe_chip() is a FIXME comment about the unlock
address seeds.  Completely remove the "switch(cfi->device_type) { ... }"
statement and replace it with "cfi->addr_unlock1 =3D 0x0555;
cfi->addr_unlock2 =3D 0x02AA;"

That effectively hard-codes the correct unlock address for your chips.=20
If that fixes the problem then I'll send you a patch that is more
generic that doesn't break other chips.

> Carolyn
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
--=20
Thayne Harbaugh
Linux Networx

--=-H6htnLyQplFNHOdxmlx2
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+3OKQfsBPTKE6HMkRAlWeAJ0dGnxmoyUI7zbdi3Wgf+Syq6XP5ACfRXdA
o20e1ILYuFMLKSNwUqhmBiQ=
=W3iu
-----END PGP SIGNATURE-----

--=-H6htnLyQplFNHOdxmlx2--

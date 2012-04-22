Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLxjb-0000Fq-4c
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 14:25:51 +0000
Received: by lbol5 with SMTP id l5so3627308lbo.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 07:25:48 -0700 (PDT)
Message-ID: <1335104592.28267.13.camel@brekeke>
Subject: Re: UBIFS mount failure upon power off
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark <xiaoming1981.zhang@gmail.com>
Date: Sun, 22 Apr 2012 17:23:12 +0300
In-Reply-To: <4F940D08.3080101@gmail.com>
References: <4F85764C.7070408@gmail.com> <1335100532.28267.9.camel@brekeke>
 <4F940D08.3080101@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-k38HKu/7+bZ8omDQXxvG"
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


--=-k38HKu/7+bZ8omDQXxvG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-04-22 at 21:52 +0800, Mark wrote:
> On 04/22/2012 09:15 PM, Artem Bityutskiy wrote:
> > Hi,
> >
> > On Wed, 2012-04-11 at 20:17 +0800, Mark wrote:
> >>  brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
> >>  offset=3D3c81c00, ret=3D-77
> >>  UBI error: ubi_io_read: error -77 while reading 126976 bytes from PEB
> >>  21:4096, read 2048 bytes
> >>  UBIFS error (pid 484): ubifs_start_scan: cannot read 126976 bytes fro=
m
> >>  LEB 18:0, error -5
> >>  mount: mounting ubi13_0 on /usr/local/appdata failed: Input/output
> >>  error
> >>
> > Please fix your NAND driver and why it returns strange error code
> > -EBADFD (-77). Uncorrectable ECC errors should be reported as -EBADMSG
> > instead. Bit-flips as -EUCLEAN.
> >
>=20
> Thank you very much, I still have some questions:
>=20
> 1. I'm using mips platform so I think "-77" is "-EBADMSG":
>        ./arch/mips/include/asm/errno.h:51:#define      EBADMSG=20
> 77      /* Not a data message */

Oh, ok, sorry.

>=20
> 2. I found these comments in ubi_io_read():
> 	        /*=20
> =20
>=20
>                   * The driver should never return -EBADMSG if it failed=
=20
> to read=20
>=20
>                   * all the requested data. But some buggy drivers might=
=20
> do=20
>=20
>                   * this, so we change it to -EIO.=20
> =20
>=20
>                   */
>=20
>     but seems my nand driver do_read_ops() function returns immediately
>     on an ecc error. Why the driver must continue reading the left data?

Yes, I ask the driver to read 5 NAND pages, then it should read all 5,
even if the second one has unrecoverable ECC error. But if any page had
ECC errors, it should return -EBADMSG.

>=20
> 3. I fixed this problem, in most situations the ubifs can recover=20
> successfully,
>     but I still get this error (though difficult to reproduce):
>=20
>         UBI error: ubi_io_read: error -77 while reading 126976 bytes=20
> from PEB 2:4096, read 126976 bytes
>         UBIFS error (pid 481): insert_node: duplicate sqnum in replay
>         mount: mounting ubi13_0 on /usr/local/hmt/appdata failed:=20
> Invalid argument
>=20
>     What could be the reason?

Difficult to say, enable UBI debugging - it will print more information
(not all the debugging messages, just debugging).

--=20
Best Regards,
Artem Bityutskiy


--=-k38HKu/7+bZ8omDQXxvG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlBRQAAoJECmIfjd9wqK0FUkQAMvDTx9tWnuFc8jQkl8B1h46
ZVPg/b986664o28dTdhkhZU7pUENG9Wr6MyhddyY/x8MacIsBXQY5lCGnwitNf+9
r2Z6I0cgG+/iM0zdJwfn15tnQsJ9E3tFUjrsNLC5MIktx3uHOmbZSDhxksJqKBp7
dR8hF4UGUVQMnjYrnOOg0pLI5GqyGyU7lzrjLLumN21711NRX5Ivlbz0wrfG758f
Tmqz0LlyK9y9tqm8gmUi4CQods0TBhRoXGJPZVkHvVD2BXW5/4xA/onNvdi6NpVE
UtnxjAiaQjhtTPuMOHV3inscl6PAYv+E/HKNGJbeTkKoMyeBCgaAZXyw8PHj+cqg
KZyOW0WeJzGfGHS6Mv4slPBcAjWddOkrbwMPLZyOl0wSvpcREmECDmp5dXmMMAPQ
mnwpwrTWguZ4Dj9wwpJBD6NsYA6sfKC3Xp2/SoGaqO5GnyN3IueVAUCSNUf7Qd+2
87qjqXR41nF+t6U+jtz7iGapBX3YNco3a5a/bNP2EmhUz154j5/1xtKofGrD8pbk
uoY/AjdpFeFcTz5Le/gjTcAmAZ83mzQixYq5S18Z27UK+4xRbAGiKgXE+HqLxRlX
bmT/gZ37xvqezRmoFv+Z2B7YSF2OTo4ZAANcws947xB5C3aodiq2AfFwhixWR3eF
yOUyCgTOiqOmKKOECVLU
=tRg+
-----END PGP SIGNATURE-----

--=-k38HKu/7+bZ8omDQXxvG--

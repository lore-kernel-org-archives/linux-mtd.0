Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ef0FW-0003W0-C6
 for linux-mtd@lists.infradead.org; Fri, 26 Jan 2018 09:24:44 +0000
Date: Fri, 26 Jan 2018 10:24:13 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-mtd@lists.infradead.org, u-boot <u-boot@lists.denx.de>, Carlos
 Rafael Giani <dv@pseudoterminal.org>, Ryan Erbstoesser
 <rerbstoesser@gateworks.com>
Subject: Re: reading ubi from a NAND for programming to other devices
Message-ID: <20180126102413.5faa4534@jawa>
In-Reply-To: <CAJ+vNU2YFMR5WkekSgHfRHo10PgqKBski0a47qEn2XKZ-zjE9Q@mail.gmail.com>
References: <CAJ+vNU2YFMR5WkekSgHfRHo10PgqKBski0a47qEn2XKZ-zjE9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lccy3QQ7mlTcZqj9WEGcXdE"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Sig_/lccy3QQ7mlTcZqj9WEGcXdE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tim,

> Greetings,
>=20
> I'm looking to understand what methods are available for
> reading/writing ubi/ubifs from an existing NAND flash in order to
> duplicate the contents onto another device in U-Boot, Linux, and with
> JTAG flashing for production.

You may want to check if nanddump / nandwrite will work for you (but
those are Linux utils, not available in u-boot).

http://git.infradead.org/mtd-utils.git/tree/HEAD:/nand-utils

>=20
> Typically I create ubi's using ubinize then I can use U-Boot 'nand
> erase' and 'nand write' or JTAG to write the ubi without issues.
> However if I use U-Boot 'nand read' to read a ubi then write it back
> using the same method I get 'ubi0 warning: ubi_io_read: error -74 (ECC
> error)' and 'ubi0 error: ubi_io_read: error -74 (ECC error)' messages
> from Linux when its mounted. I find I run into the same problem when
> JTAG programming ubi's: no issues when using a ubi created via ubinize
> but when flashing one that came from a U-Boot 'nand read' I see ubi
> errors when mounting it.
>=20
> Some testing shows me that I can't use U-Boot nand read/erase/write
> once U-Boot has 'attached' the UBI (via the U-Boot 'ubi part' command)
> which scans and re-sizes the volume.
>=20
> If I on the other hand take a ubi from U-Boot 'nand read' and use
> Linux ubiformat to flash that onto a new device I get no ubi
> warnings/errors when its mounted. My understanding is that ubiformat
> is simply preserving erase counters but there must be something else
> its doing.
>=20
> What's going on here and what can I do in U-Boot/JTAG to properly
> write ubi that's been read from an existing system? I'm hoping there
> is a method that doesn't require iterating over the individual volumes
> within the ubi.
>=20
> Best Regards,
>=20
> Tim
> _______________________________________________
> U-Boot mailing list
> U-Boot@lists.denx.de
> https://lists.denx.de/listinfo/u-boot



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/lccy3QQ7mlTcZqj9WEGcXdE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlpq874ACgkQAR8vZIA0
zr2B0ggAuosbWxClQQ2ANcBymx+NZdJF2NkFouPIEF7hfejwgCUPeUlQzR28L6ju
ELBTch2+WQslmwSvKfnG/Kqt5zi3OaOobRE+SikkCrFZsXhU9+D8yxeUmvvCoceU
nT/PNnWZL3MpAvln+j5u5qpb2V6K9cbC9YpVkdTn7GA3MuAzUGREJXqavwQxZDeL
7q3ZeYLPMvdgLQt4vCmI0xY51X95QdxCzFZQFLvZw/QBDVilBItW3Y4aMXVT6jvf
D1BmKyo9ISNIc3Yl+jza7QLSTvDl4A2BfH3AfBzWg99bDqPG7nQpYZDjUMZWpNUg
z5F9BPfWfwPGhjJMoEx7rnUy4SbeRQ==
=huCK
-----END PGP SIGNATURE-----

--Sig_/lccy3QQ7mlTcZqj9WEGcXdE--

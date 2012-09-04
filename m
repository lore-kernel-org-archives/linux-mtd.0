Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8olP-0002fu-Hi
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 08:45:40 +0000
Message-ID: <1346748631.12610.27.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 3/3] mtd: cmdlinepart: check the partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Tue, 04 Sep 2012 11:50:31 +0300
In-Reply-To: <5045BAF4.9090308@freescale.com>
References: <1346744628-13840-1-git-send-email-b32955@freescale.com>
 <1346744628-13840-3-git-send-email-b32955@freescale.com>
 <1346746785.12610.12.camel@sauron.fi.intel.com>
 <5045BAF4.9090308@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ZBd7mvFpTYpz4dblM9fh"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ZBd7mvFpTYpz4dblM9fh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-04 at 16:25 +0800, Huang Shijie wrote:
> =E4=BA=8E 2012=E5=B9=B409=E6=9C=8804=E6=97=A5 16:19, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> > Just do
> >
> > if (ret)
> > 	return ret;
> >
> >
> > and kill the huge 'switch' that you added.
> If the cmdline have two mtd-ids such as:
>   =20
> gpmi-nand:100m(root),100m@100m(kernel),1g@200m(rootfs);edb7212-nand:-(hom=
e)
>=20
> The `return` will also bypass the `edb7212-nand`.
>=20
> Is it acceptable?

I thought the whole idea is to refuse command lines which are ambiguous
or make no sense, no?

You could actually do this in two step and split your 3rd patch:

1. Add 'check_partitions' which prints an error messages and returns
-EINVAL if the command line has overlaps or gaps or other bad things.
But ignore the return code in 'mtdpart_setup_real()'

2. Make 'mtdpart_setup_real()' check for the error code and propagate it
up, so we'll have a prink + real refusal.

--=20
Best Regards,
Artem Bityutskiy

--=-ZBd7mvFpTYpz4dblM9fh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRcDYAAoJECmIfjd9wqK0HNkQAKKETh6xX1q1c9uq/SYIqHTU
luV+LxmxQ9AHsCfyuUqVaZp6QI4Wl6LJoGJSS8kWTNcNeiFnr2dqB+iywnPbJ5hE
AVOZiwHrdMGq1aYeCJ91F5DJx9syrp61LEpyS/pyhyHVwPJQIwnzHbLHUh5ZUg/J
2FwM9Esv4urKktppgrDQR7o6FtTYjjtcu7cntkySeyl4VTs2uMi6UW2gjUrwGvfz
78VhFuzxtHwoeNSVbIwInwAuC7HYow93i0DW88qjKXKJ9cfVB03byGiztanuinUG
5YfDYiv40QKjiWWuTXPrJIbHFY+/QFpn5eDWpJAuWxG7MJR8wn/423yF+WQX0CWP
Gr2zmzR0pLD4tfiqbXh2NqxuYuVD3TegSH5fwI3xJnEyINDx/wpsy68HzHb8esHS
mAD1VrRoJ7Wvy6bTh9HDZfdD7yF3RQzBc8NR81J/R5clBWhgJIKx4wUrdlBsf2ZX
5TgpY9nC7+367lY9O6Ol/ZYtyQOeZHLzN3zlU4jMSL97vqseHpvxwt0kcHCUsMNW
aQCpoTDPQNdyfj3Pu8T2ivx10QK/UTuO7urzLR2kH8TJ2GhkAiQEVUALtPfPcqwE
3wOxyo+mEQvh8txsVSUTaZ8rBojsE+mxynClGDBHd8SSMyD/L0Dk/vGgvZIb6F7e
/EQKwXB5ENPGKl/43gLp
=zVO+
-----END PGP SIGNATURE-----

--=-ZBd7mvFpTYpz4dblM9fh--

Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScPrp-0001ZP-6f
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 23:42:21 +0000
Received: by wibhm14 with SMTP id hm14so4318181wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2012 16:42:18 -0700 (PDT)
Message-ID: <1339025892.8066.16.camel@brekeke>
Subject: Re: [PATCH 1/5] UBI: fastmap: add more TODOs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 07 Jun 2012 02:38:12 +0300
In-Reply-To: <4FCFCBDD.8030907@nod.at>
References: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
 <1338909119-5188-2-git-send-email-dedekind1@gmail.com>
 <4FCFCBDD.8030907@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-8aXR8VpT/OLSMyV6F4Aj"
Mime-Version: 1.0
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-8aXR8VpT/OLSMyV6F4Aj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 23:30 +0200, Richard Weinberger wrote:
> I'm confused to find bad PEBs I'd still need a full scan, right?

If full scan means call mtd_block_isbad() for each PEB, then yes.

> >  	ret =3D ubi_io_read(ubi, fmsb, sb_pnum, ubi->leb_start, sizeof(*fmsb)=
);
> >  	if (ret && ret !=3D UBI_IO_BITFLIPS) {
> > +		/* TODO: what are the error codes > 0 ? Why is this check? */
>=20
> To catch UBI_IO_BAD_HDR, UBI_IO_BAD_HDR_EBADMSG and friends.

Which are never returned by ubi_io_read().

> AFAIK ->magic is the only __b32 field where I not use be32_to_cpu() becau=
se it's useless here.

Why is it useless?

if we have the following bytes starting from address 0xC0000000:
7B 11 D6 9F

then we do:

unsigned int *p =3D 0xC0000000;
printk("%#x\n", *p);

we should see:

0x7B11D69F on BE system (e.g., powerpc)
and
0x9FD6117B on LE system (e.g., x86).

--=20
Best Regards,
Artem Bityutskiy

--=-8aXR8VpT/OLSMyV6F4Aj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPz+nkAAoJECmIfjd9wqK0/NwP/jfAafRaZn76lphsOb/y8Ifc
aVfz4LDd979aU229aGez3E3110f1w5KLZAybvYi0W2TBUa3V5Uj2IhfvnDClkXCQ
CvbqDq+iwFLbnJepXbxTW69iznlVKp7vgct5tghUZwjiYJyxmRsgZPbGtPWRIO8E
uLgS9e/heiWKchyFWvevSkIeg/ffd3BrYWYtJAZbg4U0QV41JtkvAi/PsVMf6KX/
9/r/jfXo4lM9cvY8NY0apuJ46bRgXJ1o7B5OZam6L0x3Bz8GjAV8lDXU3Xdf7Sn5
lNqlQU98vx7qISSLAt51v5opEJuFWeR5pslKOz7/DOB8deXhAcCw2BE8kaahNqNx
ErcZoLdSAe5SNwlIXylF8+pMFo2VPHiMuyXd/EMaMK89zFcgKBS4P4TrkqnH59EO
x51nv8OJmslX/C5SkUHz6XvekaxTbhBBa39Z15Xf5vyVUzkNtZ27YxvN4W1NdOVh
LOzOof+5/Ci+D2ouHN8Ut724lE8M5vQrrdwmBmUyzcRptye8Nma/UMctsFDS4Wpc
A5tWHpBmMb35eGvyoKBZljlG6XD8SzQ1kgXym6NyQvgB8gKnG0xugsf6Ty8HCSqA
OWXkHWYxMTvs7UG7M9U4bqbh42dRx/LpK9MqZZ7EFaCdT5E9j97eRhhM4uPDR4rl
XdlX/4ABpO9G4R3Mt6U5
=IvJ+
-----END PGP SIGNATURE-----

--=-8aXR8VpT/OLSMyV6F4Aj--

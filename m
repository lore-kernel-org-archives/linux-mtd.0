Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGvO2-0007Ud-HS
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 16:22:31 +0000
Received: by wyg8 with SMTP id 8so3753359wyg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2011 09:22:29 -0700 (PDT)
Subject: Re: [PATCH] phram: make kernel boot command line arguments work
From: Artem Bityutskiy <dedekind1@gmail.com>
To: h-fache@ti.com
Date: Thu, 20 Oct 2011 19:16:53 +0300
In-Reply-To: <1318866038-11781-1-git-send-email-h-fache@ti.com>
References: <1318866038-11781-1-git-send-email-h-fache@ti.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ldMT+GMk10d5Jt5r8ZKc"
Message-ID: <1319127421.20953.5.camel@sauron>
Mime-Version: 1.0
Cc: joern@lazybastard.org, joern@logfs.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ldMT+GMk10d5Jt5r8ZKc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-10-17 at 17:40 +0200, h-fache@ti.com wrote:
> From: Herv=C3=A9 Fache <h-fache@ti.com>
>=20
> This patch is based on Ville Herva's similar patch to block2mtd.
>=20
> Trying to pass kernel command line arguments at boot-time did not work, a=
s
> phram_setup() was called so early that kmalloc() was not functional.
>=20
> This patch only saves the option string at the early boot stage, and pars=
es
> it later when init_phram() is called. This is determined by the fact that
> init was called, or not.
>=20
> With this patch, I can boot with a statically-compiled phram, and mount a
> ext2 root fs from physical RAM, without the need for a initrd.
>=20
> Signed-off-by: Herv=C3=A9 Fache <h-fache@ti.com>

Could you please make checkpatch.pl happy?

--=20
Best Regards,
Artem Bityutskiy

--=-ldMT+GMk10d5Jt5r8ZKc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOoEl1AAoJEJtuLFy+q7fed5YIAI0XgAY4kh3vJe+IdULlpbem
ADHXOVlJlrT9shumuWOJzaR5Wpbwpvlvpknpq+2JtzOD7ldqJHeNLaFVVZ3fnesZ
7+518+zBltqdP64wE5+1GgqFrC0cS5AjwX3KAqXX258k5oo7BlgXvPqdVF/qA2w/
9n1oLqEcijrIj89gIDWjva9MGyUaBln8ed/vH2uORhSDhF33Uaoxn9Gs2oTiYujX
ExTSIa8Oh24zAiBzC4IzZnCYXzJ+evirV7k+MZMv+w5ew4TlgxxBDgik5bBLASWq
oIsBjeg2+x69K1YH7CEhZSxw0E4qCDIwdH5yiajDgEzhb0I6Pmbn+qTv8SRvcDw=
=h8b5
-----END PGP SIGNATURE-----

--=-ldMT+GMk10d5Jt5r8ZKc--

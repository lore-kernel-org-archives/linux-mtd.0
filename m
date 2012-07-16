Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sqfq0-0004EK-QW
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 07:35:30 +0000
Received: by lbbgg6 with SMTP id gg6so7388532lbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 00:35:13 -0700 (PDT)
Message-ID: <1342423786.3213.5.camel@brekeke>
Subject: Re: [PATCH] mtd: mxc_nand: Select the driver via ARCH_MXC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Mon, 16 Jul 2012 10:29:46 +0300
In-Reply-To: <1341266419-21321-1-git-send-email-festevam@gmail.com>
References: <1341266419-21321-1-git-send-email-festevam@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-EMxLp7OOSg36UNzXz9wN"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 shawn.guo@linaro.org, dwmw2@infradead.org, kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-EMxLp7OOSg36UNzXz9wN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-02 at 19:00 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>=20
> With device tree support in place, we should not use IMX_HAVE_PLATFORM_MX=
C_NAND
> as a dependency for selecting the mxc_nand driver.
>=20
> Use ARCH_MXC symbol instead, so that the driver can be even selected when=
 a single device-tree
> machine is selected.
>=20
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-EMxLp7OOSg36UNzXz9wN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQA8LqAAoJECmIfjd9wqK0xTUP/RA0AfPDK7UUQovxKaXCvqJP
vEqufbq1HUrCRKy5YoC79U7i3dFvERVoWKh9i0EoTSJBWCULEG4MT4QVzBvjEfx8
O7OK/5klhRFkU2SKzAXiBMmX1uZqDfCoFwdvKzpB2ifsDFich6tRYmwYR1erywWe
Q0+KxW1WSu4OIUJjFGKoqoWLI+Y0dhvPQaTgiO9iBjCqyyLuv7sPfCw1+tBWVfzd
fYBJYTAO8gPyZswXBqwVvQzwRuscQJoIzeQwdvKmq/dTs6894Dx1ME3YmZTpf/gu
KGuC6kWla21PXnKnQWWNHlFbczHli3BtOuTJEsTrG4uDwvNzQvcc6NLrdDXr2Z8e
ApKvo/YXynpdPHFXc/ZVhMW8v77e9d/z8NvCeb1VNn/+0WdHERQDNCMx358zU1Yj
xz4/gA0cTWSajcKamQcWUwkYhqydRzNBvYn8zUy37LJbP0vmC5pLBIQXF5dW8k/w
Rw2WN/ej/zt0pPXLguMcdXuteCrxDNPvwrzxa539FdBtF25YFskTqOaAS4E75h95
Igi7Qphz3NtL+IOZafTCF+9N8S9kR6GgNMfCBEZumTyTaEPD9MYv5WFHXkOEj8hi
4FhVI7ZlD/LEG7mOUtkG8v66wc/XTg5GHCRyX1r3lv/SH2PKDSDi8GYVhPvqiVeL
DVEAte3+QbvlgE37hdMH
=GNuC
-----END PGP SIGNATURE-----

--=-EMxLp7OOSg36UNzXz9wN--
